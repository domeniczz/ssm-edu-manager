package com.domenic.service.user;

import com.domenic.domain.permission.Role;
import com.domenic.domain.user.User;
import com.domenic.domain.user.UserVo;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/28/2022 10:43 AM
 */
public interface UserService {

    /**
     * 查询所有用户信息
     * 可选条件查询：用户名；手机号；注册的起始、结束时间
     * @param userVo 前台参数封装类
     * @param navigatePages 导航处显示的页码数量
     * @return List&lt;User&gt;
     */
    PageInfo<User> findAllUserByPage(UserVo userVo, Integer navigatePages) throws Exception;

    /**
     * 更新用户状态
     * @param id 用户 id
     * @param status 要更改为的状态
     * @return 是否成功
     */
    boolean updateUserStatus(Integer id, String status);

    /**
     * 用户登录
     * @param user 用户封装类
     * @return 用户类
     */
    User userLogin(User user);

    /**
     * 根据用户 id 查询用户当前具有的角色
     * @param id 用户 id
     * @return List&lt;Role&gt;
     */
    List<Role> findUserRelatedRoleById(Integer id);

    /**
     * 给用户分配角色
     * @param userVo 前台参数封装类
     * @return 是否成功
     */
    boolean userAssignRole(UserVo userVo);

    /**
     * 获取用户被允许访问的：菜单、资源
     * @param userId 用户 id
     * @return 封装了菜单、资源的 Map 集合
     */
    Map<String, Object> getUserPermissions(Integer userId);
}
