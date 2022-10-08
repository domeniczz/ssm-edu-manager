package com.domenic.service.permission.impl;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.RoleMenuVo;
import com.domenic.domain.permission.RoleResourceVo;
import com.domenic.domain.permission.Role_Menu_Relation;
import com.domenic.domain.permission.Role_Resource_Relation;
import com.domenic.mapper.permission.RoleMapper;
import com.domenic.service.permission.RoleService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/29/2022 12:48 PM
 */
@Service
public class RoleServiceImpl implements RoleService {

    private static final Logger LOGGER = LoggerFactory.getLogger("RoleServiceImpl.class");

    @Autowired
    RoleMapper mapper;

    @Override
    public List<Role> findAllRole(Role role) throws Exception {
        return mapper.findAllRole(role);
    }

    @Override
    public boolean saveRole(Role role) {
        if (null == role.getCreatedBy()) {
            role.setCreatedBy("system");
        }
        if (null == role.getUpdatedBy()) {
            role.setUpdatedBy("system");
        }
        LOGGER.info("新增角色开始");
        boolean b = ServiceOperationsUtil.operate(role, mapper, "save");
        LOGGER.info(b ? "新增角色结束" : "新增角色失败");
        return b;
    }

    @Override
    public boolean updateRole(Role role) {
        // 设置默认值
        if (null == role.getUpdatedBy()) {
            role.setUpdatedBy("system");
        }
        LOGGER.info("修改角色开始");
        boolean b = ServiceOperationsUtil.operate(role, mapper, "update");
        LOGGER.info(b ? "修改角色结束" : "修改角色失败");
        return b;
    }

    @Override
    public List<String> findMenuByRoleId(Integer roleId) {
        LOGGER.info("根据 角色 id 查询所有对应的 菜单 id");
        return mapper.findMenuByRoleId(roleId);
    }

    @Override
    public boolean roleAssignMenu(RoleMenuVo roleMenuVo) {
        try {
            final Integer roleId = roleMenuVo.getRoleId();

            LOGGER.info("清空所有 角色 - 菜单 的关联");
            int resDel = mapper.deleteRoleAssignedMenu(roleId);

            LOGGER.info(0 != resDel ? "清空 角色 - 菜单 关联成功" : "角色 id = " + roleId + " 没有关联的菜单，清空结束");

            // Loop MenuId List to insert records into role_menu_relation
            roleMenuVo.getMenuIdList().forEach(menuId -> {
                Role_Menu_Relation rm = new Role_Menu_Relation();
                rm.setMenuId(menuId);
                rm.setRoleId(roleId);
                LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Shanghai"));
                rm.setCreateTime(now);
                rm.setUpdateTime(now);
                rm.setCreatedBy("system");
                rm.setUpdatedBy("system");
                LOGGER.info("为角色 " + roleMenuVo.getRoleId() + " 授权菜单 " + "menuId = " + menuId + " 开始");
                int resAssign = mapper.RoleAssignMenu(rm);
                LOGGER.info(0 == resAssign ? "为角色 " + roleMenuVo.getRoleId() + " 授权菜单 " + "menuId = " + menuId + " 结束" : "为角色 " + roleMenuVo.getRoleId() + " 授权菜单 " + "menuId = " + menuId + " 失败！！");
            });

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteRole(Integer roleId) {
        LOGGER.info("删除角色，id = " + roleId);
        return mapper.deleteRole(roleId) > 0;
    }

    @Override
    public List<Resource> findResourceListByRoleId(Integer roleId) throws Exception {
        LOGGER.info("获取当前角色拥有的资源");
        return mapper.findResourceListByRoleId(roleId);
    }

    @Override
    public boolean roleAssignResource(RoleResourceVo roleResourceVo) {
        try {
            final Integer roleId = roleResourceVo.getRoleId();

            LOGGER.info("清空所有 角色 - 资源 的关联");
            int resDel = mapper.deleteRoleAssignedResource(roleId);

            LOGGER.info(0 != resDel ? "清空 角色 - 资源 关联成功" : "角色 id = " + roleId + " 没有关联的资源，清空结束");

            // Loop ResourceId List to insert records into role_resource_relation
            roleResourceVo.getResourceIdList().forEach(resourceId -> {
                Role_Resource_Relation rm = new Role_Resource_Relation();
                rm.setResourceId(resourceId);
                rm.setRoleId(roleId);
                LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Shanghai"));
                rm.setCreateTime(now);
                rm.setUpdateTime(now);
                rm.setCreatedBy("system");
                rm.setUpdatedBy("system");
                LOGGER.info("为角色 " + roleResourceVo.getRoleId() + " 授权资源 " + "menuId = " + resourceId + " 开始");
                int resAssign = mapper.RoleAssignResource(rm);
                LOGGER.info(0 == resAssign ? "为角色 " + roleResourceVo.getRoleId() + " 授权资源 " + "menuId = " + resourceId + " 结束" : "为角色 " + roleResourceVo.getRoleId() + " 授权资源 " + "menuId = " + resourceId + " 失败！！");
            });

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
