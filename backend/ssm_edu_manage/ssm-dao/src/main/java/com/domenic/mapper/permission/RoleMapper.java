package com.domenic.mapper.permission;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.Role_Menu_Relation;
import com.domenic.domain.permission.Role_Resource_Relation;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/29/2022 12:50 PM
 */
public interface RoleMapper {

    /**
     * 查询所有角色；根据条件进行查询，如：角色名称
     * @param role 角色封装类
     * @return List&lt;Role&gt;
     */
    List<Role> findAllRole(Role role);

    /**
     * 新建广告信息
     * @param role role 封装类
     * @return 是否成功
     */
    int saveRole(Role role);

    /**
     * 修改广告信息
     * @param role role 封装类
     * @return 是否成功
     */
    int updateRole(Role role);

    /**
     * 根据 角色 id 查询所有对应的 菜单 id
     * 可用于回显角色对应授权的菜单
     * @param roleId 角色 id
     * @return List&lt;String&gt; String 类型的菜单 id 集合
     */
    List<String> findMenuByRoleId(Integer roleId);

    /**
     * 删除 角色 - 菜单 中间表中所有该角色已被分配的菜单
     * 也就是解除该角色和菜单的关联
     * @param roleId 角色 id
     * @return 是否成功
     */
    int deleteRoleAssignedMenu(Integer roleId);

    /**
     * 为角色授权菜单
     * @param roleMenuEach 参数封装类，封装单条角色菜单的关联记录
     * @return 是否成功
     */
    int RoleAssignMenu(Role_Menu_Relation roleMenuEach);

    /**
     * 删除角色（必须要原本就有，再去删除，不然就影响 0 行，这里的 int 返回是 0）
     * 从 角色表 和 角色-菜单中间表 中删除
     * @param roleId 角色 id
     * @return 是否成功
     */
    int deleteRole(Integer roleId);

    /**
     * 获取当前角色拥有的资源
     * @param roleId 角色 id
     * @return List&lt;Resource&gt;
     */
    List<Resource> findResourceListByRoleId(Integer roleId);

    /**
     * 删除 角色 - 资源 中间表中所有该角色已被分配的资源
     * 也就是解除该角色和资源的关联
     * @param roleId 角色 id
     * @return 是否成功
     */
    int deleteRoleAssignedResource(Integer roleId);

    /**
     * 为角色授权资源
     * @param roleResourceEach 参数封装类，封装单条角色资源的关联记录
     * @return 是否成功
     */
    int RoleAssignResource(Role_Resource_Relation roleResourceEach);
}
