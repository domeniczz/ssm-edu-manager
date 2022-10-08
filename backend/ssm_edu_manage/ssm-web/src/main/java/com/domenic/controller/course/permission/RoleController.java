package com.domenic.controller.course.permission;

import com.domenic.domain.ResponseResult;
import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.Role;
import com.domenic.domain.permission.RoleMenuVo;
import com.domenic.domain.permission.RoleResourceVo;
import com.domenic.service.permission.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/29/2022 12:37 PM
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleService service;

    /**
     * 查询所有角色；根据条件进行查询，如：角色名称
     * @param role 角色封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/findAllRole")
    public ResponseResult findAllRole(@RequestBody Role role) {
        List<Role> res = null;
        try {
            res = service.findAllRole(role);
            return new ResponseResult(true, 200, "查询角色列表成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询角色列表出错", res);
        }
    }

    /**
     * 新建或修改广告信息
     * @param role role 封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateRole")
    public ResponseResult saveOrUpdateRole(@RequestBody Role role) {
        // 添加操作
        if (null == role.getId()) {
            boolean b = service.saveRole(role);
            return new ResponseResult(b, 200, b ? "新建角色成功" : "新建角色失败", null);
        }
        // 修改操作
        else {
            boolean b = service.updateRole(role);
            return new ResponseResult(b, 200, b ? "修改角色成功" : "修改角色失败", null);
        }
    }

    /**
     * 根据 角色 id 查询所有对应的 菜单 id
     * 可用于回显角色对应授权的菜单
     * @param roleId 角色 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findMenuByRoleId")
    public ResponseResult findMenuByRoleId(@RequestParam Integer roleId) {
        List<String> res = null;
        try {
            res = service.findMenuByRoleId(roleId);
            return new ResponseResult(true, 200, "根据角色 id 查询菜单列表成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "根据角色 id 查询菜单列表成功", res);
        }
    }

    /**
     * 根据前端传来的 菜单 id 集合，为指定角色授权菜单
     * 执行思路：先删除 角色 - 菜单 中间表中所有该角色已被分配的菜单，也就是解除该角色和菜单的关联，再进行菜单分配
     * @param roleMenuVo 参数封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/roleAssignMenu")
    public ResponseResult roleAssignMenu(@RequestBody RoleMenuVo roleMenuVo) {
        boolean b = service.roleAssignMenu(roleMenuVo);
        return new ResponseResult(b, 200, b ? "为角色授权菜单成功" : "为角色授权菜单失败", null);
    }

    /**
     * 删除角色（从 角色表 和 角色-菜单中间表 中删除）
     * @param roleId 角色 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/deleteRole")
    public ResponseResult deleteRole(@RequestParam("id") Integer roleId) {
        boolean b = service.deleteRole(roleId);
        return new ResponseResult(b, 200, b ? "删除角色成功" : "删除角色失败", null);
    }

    /**
     * 获取当前角色拥有的资源
     * @param roleId 角色 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findResourceListByRoleId")
    public ResponseResult findResourceListByRoleId(@RequestParam("id") Integer roleId) {
        List<Resource> resourceList = null;
        try {
            resourceList = service.findResourceListByRoleId(roleId);
            return new ResponseResult(true, 200, "获取当前角色拥有的资源成功", resourceList);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "获取当前角色拥有的资源失败", resourceList);
        }
    }

    /**
     * 根据前端传来的 资源 id 集合，为指定角色分配资源
     * 执行思路：先删除 角色 - 资源 中间表中所有该角色已被分配的资源，也就是解除该角色和资源的关联，再进行资源分配
     * @param roleResourceVo 参数封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/roleAssignResource")
    public ResponseResult roleAssignResource(@RequestBody RoleResourceVo roleResourceVo) {
        boolean b = service.roleAssignResource(roleResourceVo);
        return new ResponseResult(b, 200, b ? "为角色授权资源成功" : "为角色授权资源失败", null);
    }
}
