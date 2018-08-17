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

import com.ccm.blog.util.AesUtil;
import com.github.pagehelper.PageInfo;
import com.ccm.blog.business.entity.User;
import com.ccm.blog.business.enums.ResponseStatus;
import com.ccm.blog.business.service.SysUserRoleService;
import com.ccm.blog.business.service.SysUserService;
import com.ccm.blog.business.vo.UserConditionVO;
import com.ccm.blog.framework.object.PageResult;
import com.ccm.blog.framework.object.ResponseVO;
import com.ccm.blog.util.PasswordUtil;
import com.ccm.blog.util.ResultUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户管理
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/24 14:37
 * @since 1.0
 */
@RestController
@RequestMapping("/user")
public class RestUserController {
    @Autowired
    private SysUserService userService;
    @Autowired
    private SysUserRoleService userRoleService;

    @RequiresPermissions("users")
    @PostMapping("/list")
    public PageResult list(UserConditionVO vo) {
        PageInfo<User> pageInfo = userService.findPageBreakByCondition(vo);
        return ResultUtil.tablePage(pageInfo);
    }

    /**
     * 保存用户角色
     *
     * @param userId
     * @param roleIds
     *         用户角色
     *         此处获取的参数的角色id是以 “,” 分隔的字符串
     * @return
     */
    @RequiresPermissions("user:allotRole")
    @PostMapping("/saveUserRoles")
    public ResponseVO saveUserRoles(Long userId, String roleIds) {
        if (StringUtils.isEmpty(userId)) {
            return ResultUtil.error("error");
        }
        userRoleService.addUserRole(userId, roleIds);
        return ResultUtil.success("成功");
    }

    @RequiresPermissions("user:add")
    @PostMapping(value = "/add")
    public ResponseVO add(User user) {
        User u = userService.getByUserName(user.getUsername());
        if (u != null) {
            return ResultUtil.error("该用户名["+user.getUsername()+"]已存在！请更改用户名");
        }
        try {
            //user.setPassword(PasswordUtil.encrypt(user.getPassword(), user.getUsername()));
            //默认密码为123456
            user.setPassword(PasswordUtil.encrypt("123456", user.getUsername()));
            userService.insert(user);
            return ResultUtil.success("成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("error");
        }
    }

    @RequiresPermissions(value = {"user:batchDelete", "user:delete"}, logical = Logical.OR)
    @PostMapping(value = "/remove")
    public ResponseVO remove(Long[] ids) {
        if (null == ids) {
            return ResultUtil.error(500, "请至少选择一条记录");
        }
        for (Long id : ids) {
            userService.removeByPrimaryKey(id);
            userRoleService.removeByUserId(id);
        }
        return ResultUtil.success("成功删除 [" + ids.length + "] 个用户");
    }

    @RequiresPermissions("user:get")
    @PostMapping("/get/{id}")
    public ResponseVO get(@PathVariable Long id) {
        try {
            User u = this.userService.getByPrimaryKey(id);
            // 获取user信息前 对密码进行解密，否则在编辑user保存时，出现对数据库中已经加密的密码又再次进行加密
//            String password = PasswordUtil.decrypt(u.getPassword(), u.getUsername().trim());
//            u.setPassword(password);
            return ResultUtil.success(null, u);
        }catch (Exception e){
            e.printStackTrace();
            return ResultUtil.error("error");
        }
    }

    @RequiresPermissions("user:edit")
    @PostMapping("/edit")
    public ResponseVO edit(User user) {
        try {
            // 编辑保存user，对密码进行加密
//            String password = PasswordUtil.encrypt(user.getPassword(), user.getUsername().trim());
//            user.setPassword(password);
            userService.updateSelective(user);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("用户修改失败！");
        }
        return ResultUtil.success(ResponseStatus.SUCCESS);
    }

}
