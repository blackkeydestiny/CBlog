package com.ccm.blog.service;

import com.ccm.blog.BaseJunitTest;
import com.ccm.blog.business.entity.Comment;
import com.ccm.blog.business.service.BizCommentService;
import com.ccm.blog.BaseJunitTest;
import com.ccm.blog.business.entity.Comment;
import com.ccm.blog.business.service.BizCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.TimeUnit;

/**
 * @author chuming.chen
 * @version 1.0
 * @date 2018/4/28 11:14
 * @since 1.0
 */
public class BizCommentServiceImplTest extends BaseJunitTest {

    @Autowired
    private BizCommentService commentService;

    @Test
    public void comment() throws InterruptedException {
        Comment comment = new Comment();
        comment.setPid(1L);
        comment.setNickname("测试");
        comment.setEmail("843977358@qq.com");
        comment.setQq("843977358");
        commentService.comment(comment);

        TimeUnit.SECONDS.sleep(60);
    }
}
