package com.domenic.service.user.impl;

import com.domenic.domain.permission.Menu;
import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.User_Role_Relation;
import com.domenic.domain.user.User;
import com.domenic.domain.user.UserVo;
import com.domenic.exception.DaoNotSuccessException;
import com.domenic.mapper.user.UserMapper;
import com.domenic.service.user.UserService;
import com.domenic.utils.SHA256Util;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/28/2022 10:43 AM
 */
@Service
public class UserServiceImpl implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger("UserServiceImpl.class");

    @Autowired
    UserMapper mapper;

    @Override
    public PageInfo<User> findAllUserByPage(UserVo userVo, Integer navigatePages) throws Exception {
        PageHelper.startPage(userVo.getCurrentPage(), userVo.getPageSize());
        List<User> userList = mapper.findAllUser(userVo);
        return new PageInfo<>(userList, navigatePages);
    }

    @Override
    public boolean updateUserStatus(Integer id, String status) {
        User user = new User();
        user.setId(id);
        user.setStatus(status);
        LOGGER.info("更新用户状态开始");
        int res = mapper.updateUserStatus(user);
        // 异常处理
        if (0 == res) {
            try {
                throw new DaoNotSuccessException("Update user status Failed!");
            } catch (DaoNotSuccessException e) {
                e.printStackTrace();
                System.out.println("\nuser id: " + id + ", user new status: " + status);
                LOGGER.error("更新用户状态出错！DaoNotSuccessException");
                return false;
            }
        }
        LOGGER.info("更新用户状态结束");
        return true;
    }

    @Override
    public User userLogin(User user) {
        // 根据信息，查询到该用户的所有信息（包含保存在数据库中的密码密文）
        User login = mapper.findSpecificUser(user);
        try {
            if (null != login && SHA256Util.verify(user.getPassword(), login.getPassword())) {
                return login;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Role> findUserRelatedRoleById(Integer id) {
        LOGGER.info("根据用户 id 查询用户当前具有的角色");
        return mapper.findUserRelatedRoleById(id);
    }

    @Override
    public boolean userAssignRole(UserVo userVo) {
        try {
            final Integer userId = userVo.getUserId();

            LOGGER.info("清空所有 用户 - 角色 的关联");
            int resDel = mapper.deleteUserAssignedRole(userId);

            LOGGER.info(0 != resDel ? "清空 用户 - 角色 关联成功" : "用户 id = " + userId + " 没有关联的角色，清空结束");

            // Loop RoleId List to insert records into user_role_relation
            userVo.getRoleIdList().forEach(roleId -> {
                User_Role_Relation ur = new User_Role_Relation();
                ur.setUserId(userVo.getUserId());
                ur.setRoleId(roleId);
                LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Shanghai"));
                ur.setCreateTime(now);
                ur.setUpdateTime(now);
                ur.setCreatedBy("system");
                ur.setUpdatedBy("system");
                LOGGER.info("为用户 " + userVo.getUserId() + " 授权角色 " + "roleId = " + roleId + " 开始");
                int resAssign = mapper.userAssignRole(ur);
                LOGGER.info(0 != resAssign ? "为用户 " + userVo.getUserId() + " 授权角色 " + "roleId = " + roleId + " 结束" : "为用户 " + userVo.getUsername() + " 授权角色 " + "roleId = " + roleId + " 失败！！");
            });

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Map<String, Object> getUserPermissions(Integer userId) {

        // 步骤一，根据用户 id 查询对应的角色信息
        List<Role> roleList = mapper.findUserRelatedRoleById(userId);

        // 获取用户对应的角色 id，保存到 List 集合中
        ArrayList<Integer> roleIds = new ArrayList<>();
        for (Role role : roleList) {
            roleIds.add(role.getId());
        }

        // 步骤二，获取角色 id 查询被授权的顶级目录
        List<Menu> rootMenus = mapper.findRootMenuByRoleId(roleIds);

        // 步骤三，根据顶级菜单的 id，查询子菜单
        // 并把子菜单关联到对应的父菜单中
        for (Menu menu : rootMenus) {
            menu.setSubMenuList(mapper.findSubMenuByPid(menu.getId()));
        }

        // 步骤四，获取角色拥有的资源权限信息
        List<Resource> resourceList = mapper.findResourceByRoleId(roleIds);

        return new HashMap<String, Object>() {{
            put("menuList", rootMenus);
            put("resourceList", resourceList);
        }};
    }
}
