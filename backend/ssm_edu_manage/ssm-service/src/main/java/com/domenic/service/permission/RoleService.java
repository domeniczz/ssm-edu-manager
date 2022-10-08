package com.domenic.service.permission;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.RoleMenuVo;
import com.domenic.domain.permission.RoleResourceVo;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/29/2022 12:42 PM
 */
public interface RoleService {

    /**
     * 查询所有角色；根据条件进行查询，如：角色名称
     * @param role 角色封装类
     * @return List&lt;Role&gt;
     */
    List<Role> findAllRole(Role role) throws Exception;

    /**
     * 新建广告信息
     * @param role role 封装类
     * @return 是否成功
     */
    boolean saveRole(Role role);

    /**
     * 修改广告信息
     * @param role role 封装类
     * @return 是否成功
     */
    boolean updateRole(Role role);

    /**
     * 根据 角色 id 查询所有对应的 菜单 id
     * 可用于回显角色对应授权的菜单
     * @param roleId 角色 id
     * @return List&lt;String&gt; String 类型的菜单 id 集合
     */
    List<String> findMenuByRoleId(Integer roleId);

    /**
     * 根据前端传来的 菜单 id 集合，为角色授权菜单
     * 执行思路：先删除 角色 - 菜单 中间表中所有该角色已被分配的菜单，也就是解除该角色和菜单的关联，再进行菜单分配
     * @param roleMenuVo 参数封装类
     * @return 是否成功
     */
    boolean roleAssignMenu(RoleMenuVo roleMenuVo);

    /**
     * 删除角色（从 角色表 和 角色-菜单中间表 中删除）
     * @param roleId 角色 id
     * @return 是否成功
     */
    boolean deleteRole(Integer roleId);

    /**
     * 获取当前角色拥有的资源
     * @param roleId 角色 id
     * @return List&lt;Resource&gt;
     */
    List<Resource> findResourceListByRoleId(Integer roleId) throws Exception;

    /**
     * 为角色分配资源
     * @param roleResourceVo 参数封装类
     * @return 是否成功
     */
    boolean roleAssignResource(RoleResourceVo roleResourceVo);
}
