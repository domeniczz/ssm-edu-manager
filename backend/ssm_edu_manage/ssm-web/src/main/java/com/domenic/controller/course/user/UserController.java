package com.domenic.controller.course.user;

import com.domenic.domain.ResponseResult;
import com.domenic.domain.permission.Role;
import com.domenic.domain.user.User;
import com.domenic.domain.user.UserVo;
import com.domenic.service.user.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author Domenic
 * @Description 用户模块
 * @Date 9/28/2022 10:42 AM
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService service;

    /**
     * 查询所有用户信息
     * 可选条件查询：用户名；手机号；注册的起始、结束时间
     * @param userVo 前台参数封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/findAllUserByPage")
    public ResponseResult findAllUserByPage(@RequestBody UserVo userVo) {

        // 设置默认值（若前端没有传值）
        if (null == userVo.getCurrentPage()) {
            userVo.setCurrentPage(1);
        }
        if (null == userVo.getPageSize()) {
            userVo.setPageSize(5);
        }

        PageInfo<User> res = null;
        try {
            res = service.findAllUserByPage(userVo, 3);
            return new ResponseResult(true, 200, "分页查询所有用户信息成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "分页查询所有用户信息出错！", res);
        }
    }

    /**
     * 更新用户状态
     * @param id 用户 id
     * @param status 要更改为的状态
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/updateUserStatus")
    public ResponseResult updateUserStatus(Integer id, String status) {

        if ("ENABLE".equalsIgnoreCase(status)) {
            status = "ENABLE";
        } else {
            status = "DISABLE";
        }

        boolean b = service.updateUserStatus(id, status);
        return new ResponseResult(b, 200, b ? "更新用户状态成功" : "更新用户状态失败", null);
    }

    /**
     * 用户登录
     * @param user 用户封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/login")
    public ResponseResult userLogin(@RequestBody User user, HttpSession session) {
        User login = service.userLogin(user);

        // 结果不为 null，则表示登录成功
        if (null != login) {
            String accessToken = UUID.randomUUID().toString();
            Integer userId = login.getId();
            Map<String, Object> responseMap = new HashMap<String, Object>(){{
                put("access_token", accessToken);
                put("user_id", userId);
            }};
            session.setAttribute("access_token", accessToken);
            session.setAttribute("user_id", userId);
            return new ResponseResult(true, 200, "用户 " + login.getName() + " : " + login.getPhone() + " 登录成功", responseMap);
        }
        // 登录失败
        else {
            String name = login.getName();
            return new ResponseResult(true, 200, "用户" + (null == name ? "" : name) + "登录失败！" + (null == name ? "该用户不存在！" : "也许是密码错误！"), null);
        }
    }

    /**
     * 根据用户 id 查询用户当前具有的角色
     * @param id 用户 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findUserRelatedRoleById")
    public ResponseResult findUserRelatedRoleById(@RequestParam Integer id) {
        List<Role> roleList = service.findUserRelatedRoleById(id);
        return new ResponseResult(true, 200, "用户对应的角色回显成功", roleList);
    }

    /**
     * 给用户分配角色
     * 执行思路：先删除 用户 - 角色 中间表中所有该用户已被分配的角色，也就是解除该用户和角色的关联，再进行角色分配
     * @param userVo 前台参数封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/userAssignRole")
    public ResponseResult userAssignRole(@RequestBody UserVo userVo) {
        boolean b = service.userAssignRole(userVo);
        return new ResponseResult(b, 200, b ? "为用户 id = " + userVo.getUserId() + " 授权角色成功" : "为用户 id = " + userVo.getUserId() + " 授权角色失败", null);
    }

    /**
     * 获取用户被允许访问的：菜单、资源
     * 可用于根据权限进行动态地菜单展示
     * @param request 请求信息
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/getUserPermissions")
    public ResponseResult getUserPermissions(HttpServletRequest request) {

        // 获取请求头中的 token
        String reqHeadToken = request.getHeader("Authorization");
        System.out.println("reqHeadToken: " + reqHeadToken);
        // 获取 session 中 token
        String sessionToken = (String) request.getSession().getAttribute("access_token");
        System.out.println("sessionToken: " + sessionToken);

        // 封装查询结果的 Map 集合
        Map<String, Object> permissions;

        // 若 token 相同，则表示用户已经登录
        if (sessionToken.equals(reqHeadToken)) {
            permissions = service.getUserPermissions((Integer) request.getSession().getAttribute("user_id"));
        } else {
            return new ResponseResult(false, 200, "查询权限信息失败！用户是否未登录或登录过期", null);
        }

        return new ResponseResult(true, 200, "查询用户权限信息成功！", permissions);
    }
}
