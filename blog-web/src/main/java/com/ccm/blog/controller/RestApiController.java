/**
 * MIT License
 * Copyright (c) 2018 chuming.chen
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.ccm.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccm.blog.business.entity.Comment;
import com.ccm.blog.business.entity.Link;
import com.ccm.blog.business.enums.CommentStatusEnum;
import com.ccm.blog.business.service.BizArticleService;
import com.ccm.blog.business.service.BizCommentService;
import com.ccm.blog.business.service.SysLinkService;
import com.ccm.blog.business.service.SysNoticeService;
import com.ccm.blog.business.vo.CommentConditionVO;
import com.ccm.blog.framework.exception.CcmArticleException;
import com.ccm.blog.framework.exception.CcmCommentException;
import com.ccm.blog.framework.exception.CcmLinkException;
import com.ccm.blog.framework.object.ResponseVO;
import com.ccm.blog.util.RestClientUtil;
import com.ccm.blog.util.ResultUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 网站接口类，申请友链、评论、点赞等。通过ccm.js和ccm.comment.js发送ajax请求调用
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/18 11:48
 * @since 1.0
 */
@Slf4j
@RestController
@RequestMapping("/api")
public class RestApiController {

//    @Autowired
//    private SysLinkService sysLinkService;
//    @Autowired
//    private BizCommentService commentService;
//    @Autowired
//    private BizArticleService articleService;
//    @Autowired
//    private SysNoticeService noticeService;

    private final SysLinkService sysLinkService;
    private final BizCommentService commentService;
    private final BizArticleService articleService;
    private final SysNoticeService noticeService;
    @Autowired
    public RestApiController(SysLinkService sysLinkService, BizCommentService commentService, BizArticleService articleService, SysNoticeService noticeService){
        this.sysLinkService = sysLinkService;
        this.commentService = commentService;
        this.articleService = articleService;
        this.noticeService = noticeService;
    }

    /**
     * 申请友情链接
     * @param link
     * @param bindingResult
     * @return
     */
    @PostMapping("/autoLink")
    public ResponseVO autoLink(@Validated Link link, BindingResult bindingResult) {
        log.info("申请友情链接......");
        log.info(JSON.toJSONString(link));
        if (bindingResult.hasErrors()) {
            return ResultUtil.error(bindingResult.getFieldError().getDefaultMessage());
        }
        try {
            sysLinkService.autoLink(link);
        } catch (CcmLinkException e) {
            log.error("客户端自助申请友链发生异常", e);
            return ResultUtil.error(e.getMessage());
        }
        return ResultUtil.success("已成功添加友链，祝您生活愉快！");
    }

    /**
     * 通过QQ号获取QQ昵称
     * @param qq
     * @return
     */
    @PostMapping("/qq/{qq}")
    public ResponseVO qq(@PathVariable("qq") String qq) {
        if (StringUtils.isEmpty(qq)) {
            return ResultUtil.error("");
        }
        Map<String, String> resultMap = new HashMap<>(4);
        String nickname = "匿名";
        String json = RestClientUtil.get("http://r.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins=" + qq, "GBK");
        if (!StringUtils.isEmpty(json)) {
            try {
                json = json.replaceAll("portraitCallBack|\\\\s*|\\t|\\r|\\n", "");
                json = json.substring(1, json.length() - 1);
                log.info(json);
                JSONObject object = JSONObject.parseObject(json);
                JSONArray array = object.getJSONArray(qq);
                nickname = array.getString(6);
            } catch (Exception e) {
                log.error("通过QQ号获取用户昵称发生异常", e);
            }
        }
        resultMap.put("avatar", "https://q1.qlogo.cn/g?b=qq&nk=" + qq + "&s=40");
        resultMap.put("nickname", nickname);
        resultMap.put("email", qq + "@qq.com");
        resultMap.put("url", "https://user.qzone.qq.com/" + qq);
        return ResultUtil.success(null, resultMap);
    }

    /**
     * 加载comments列表
     * @param vo
     * @return
     */
    @PostMapping("/comments")
    public ResponseVO comments(CommentConditionVO vo) {
        vo.setStatus(CommentStatusEnum.APPROVED.toString());
        return ResultUtil.success(null, commentService.list(vo));
    }

    /**
     * 提交comment
     * @param comment
     * @return
     */
    @PostMapping("/comment")
    public ResponseVO comment(Comment comment) {
        try {
            commentService.comment(comment);
        } catch (CcmCommentException e) {
            log.error("评论发生异常", e);
            return ResultUtil.error(e.getMessage());
        }
        return ResultUtil.success("评论发表成功，系统正在审核，请稍后刷新页面查看！");
    }

    /**
     * 评论点赞
     * @param id
     * @return
     */
    @PostMapping("/doSupport/{id}")
    public ResponseVO doSupport(@PathVariable("id") Long id) {
        try {
            commentService.doSupport(id);
        } catch (CcmCommentException e) {
            log.error("评论点赞发生异常", e);
            return ResultUtil.error(e.getMessage());
        }
        return ResultUtil.success("");
    }

    /**
     * 评论点踩
     * @param id
     * @return
     */
    @PostMapping("/doOppose/{id}")
    public ResponseVO doOppose(@PathVariable("id") Long id) {
        try {
            commentService.doOppose(id);
        } catch (CcmCommentException e) {
            log.error("评论点踩发生异常", e);
            return ResultUtil.error(e.getMessage());
        }
        return ResultUtil.success("");
    }

    /**
     * 文章点赞
     * @param id
     * @return
     */
    @PostMapping("/doPraise/{id}")
    public ResponseVO doPraise(@PathVariable("id") Long id) {
        try {
            articleService.doPraise(id);
        } catch (CcmArticleException e) {
            log.error("文章点赞发生异常", e);
            return ResultUtil.error(e.getMessage());
        }
        return ResultUtil.success("");
    }

    /**
     * 页面通知
     * @return
     */
    @PostMapping("/listNotice")
    public ResponseVO listNotice() {
        return ResultUtil.success("", noticeService.listRelease());
    }

}
