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

import com.github.pagehelper.PageInfo;
import com.ccm.blog.business.entity.Template;
import com.ccm.blog.business.enums.ResponseStatus;
import com.ccm.blog.business.service.SysTemplateService;
import com.ccm.blog.business.vo.TemplateConditionVO;
import com.ccm.blog.framework.object.PageResult;
import com.ccm.blog.framework.object.ResponseVO;
import com.ccm.blog.util.ResultUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 模板管理
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/24 14:37
 * @since 1.0
 */
@RestController
@RequestMapping("/template")
public class RestTemplateController {
//    @Autowired
//    private SysTemplateService templateService;

    private final SysTemplateService templateService;
    @Autowired
    public RestTemplateController(SysTemplateService templateService){
        this.templateService = templateService;
    }

    @RequiresPermissions("templates")
    @PostMapping("/list")
    public PageResult list(TemplateConditionVO vo) {
        PageInfo<Template> pageInfo = templateService.findPageBreakByCondition(vo);
        return ResultUtil.tablePage(pageInfo);
    }

    @RequiresPermissions("template:add")
    @PostMapping(value = "/add")
    public ResponseVO add(Template template) {
        templateService.insert(template);
        return ResultUtil.success("成功");
    }

    @RequiresPermissions(value = {"template:batchDelete", "template:delete"}, logical = Logical.OR)
    @PostMapping(value = "/remove")
    public ResponseVO remove(Long[] ids) {
        if (null == ids) {
            return ResultUtil.error(500, "请至少选择一条记录");
        }
        for (Long id : ids) {
            templateService.removeByPrimaryKey(id);
        }
        return ResultUtil.success("成功删除 [" + ids.length + "] 个模板");
    }

    @RequiresPermissions("template:get")
    @PostMapping("/get/{id}")
    public ResponseVO get(@PathVariable Long id) {
        return ResultUtil.success(null, this.templateService.getByPrimaryKey(id));
    }

    @RequiresPermissions("template:edit")
    @PostMapping("/edit")
    public ResponseVO edit(Template template) {
        try {
            templateService.updateSelective(template);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("模板修改失败！");
        }
        return ResultUtil.success(ResponseStatus.SUCCESS);
    }

}
