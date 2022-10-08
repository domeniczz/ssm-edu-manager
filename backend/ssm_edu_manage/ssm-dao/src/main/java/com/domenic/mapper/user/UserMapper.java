package com.domenic.mapper.user;

import com.domenic.domain.permission.Menu;
import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.User_Role_Relation;
import com.domenic.domain.user.User;
import com.domenic.domain.user.UserVo;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/28/2022 10:43 AM
 */
public interface UserMapper {

    /**
     * 查询所有用户信息
     * 可选条件查询：用户名；手机号；注册的起始、结束时间
     * @param userVo 前台参数封装类
     * @return List&lt;User&gt;
     */
    List<User> findAllUser(UserVo userVo);

    /**
     * 更新用户状态
     * @param user 用户封装类
     * @return 是否成功
     */
    int updateUserStatus(User user);

    /**
     * 查找特定用户
     * @param user 用户封装类
     * @return 用户类
     */
    User findSpecificUser(User user);

    /**
     * 根据用户 id 查询用户当前具有的角色
     * (获取用户权限显示，步骤一)
     * @param id 用户 id
     * @return List&lt;Role&gt;
     */
    List<Role> findUserRelatedRoleById(Integer id);

    /**
     * 删除 用户 - 角色 中间表中所有该用户已被分配的角色
     * 也就是解除该用户和角色的关联
     * @param id 用户 id
     * @return 是否成功
     */
    int deleteUserAssignedRole(Integer id);

    /**
     * 给用户分配角色
     * @param user_role_relation 用户 - 角色 关联信息封装类
     * @return 是否成功
     */
    int userAssignRole(User_Role_Relation user_role_relation);

    /**
     * 获取用户权限显示，步骤二
     * 通过角色 id 查询被授权的顶级目录
     * @param ids 角色 id 集合
     * @return List&lt;Menu&gt; 对应的顶级菜单的集合
     */
    List<Menu> findRootMenuByRoleId(List<Integer> ids);

    /**
     * 获取用户权限显示，步骤三
     * 根据顶级菜单的 id，查询子菜单
     * 参数 pid 就是顶级菜单的 id 值
     * @param pid 被选出来的顶级菜单的 id
     * @return List&lt;Menu&gt; 顶级菜单的子菜单的集合
     */
    List<Menu> findSubMenuByPid(Integer pid);

    /**
     * 获取用户权限显示，步骤四
     * 获取角色拥有的资源权限信息
     * @param ids 角色 id 集合
     * @return List&lt;Resource&gt; 资源的集合
     */
    List<Resource> findResourceByRoleId(List<Integer> ids);
}
