package com.domenic.controller.course.permission;

import com.domenic.domain.ResponseResult;
import com.domenic.domain.permission.Menu;
import com.domenic.service.permission.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/30/2022 4:06 AM
 */
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService service;

    /**
     * 查询菜单列表
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findAllMenu")
    public ResponseResult findAllMenu() {
        List<Menu> res = null;
        try {
            // -1 表示查询根菜单及其下的所有菜单
            Integer parent_menu_id = -1;
            res = service.findAllMenuByPid(parent_menu_id);
            return new ResponseResult(true, 200, "查询菜单列表成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询菜单列表出错", res);
        }
    }

    /**
     * 根据菜单 id 查询当前菜单的上级菜单信息
     * 用于 添加页面 和 修改页面 的回显
     * - 添加页面只需回显所有菜单
     * - 修改页面需要回显所有信息
     * @param menuId 菜单 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findMenuInfoById")
    public ResponseResult findMenuInfoById(@RequestParam("id") Integer menuId) {
        // 新增操作
        if (-1 == menuId) {
            List<Menu> res = service.findAllMenuByPid(-1);
            // 封装数据
            Map<String, Object> map = new HashMap<>();
            map.put("menuInfo", null);
            map.put("parentMenuList", res);
            return new ResponseResult(true,200,"添加操作页面回显成功", map);
        }
        // 修改操作
        else {
            Menu menu = service.findMenuById(menuId);

            if (null == menu) {
                return new ResponseResult(false, 200, "根据菜单 id 查询该菜单出错", null);
            }

            List<Menu> res = service.findAllMenuByPid(-1);
            // 封装数据
            Map<String, Object> map = new HashMap<>();
            map.put("menuInfo", menu);
            map.put("parentMenuList", res);
            return new ResponseResult(true,200,"修改操作页面回显成功", map);
        }
    }

    /**
     * 新增或修改菜单
     * @param menu 菜单封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateMenu")
    public ResponseResult saveOrUpdateMenu(@RequestBody Menu menu) {
        boolean b;
        // 添加操作
        if (null == menu.getId()) {
            b = service.saveMenu(menu);
            return new ResponseResult(b, 200, b ? "新建菜单成功" : "新建菜单失败", null);
        }
        // 修改操作
        else {
            b = service.updateMenu(menu);
            return new ResponseResult(b, 200, b ? "修改菜单成功" : "修改菜单失败", null);
        }
    }
}
