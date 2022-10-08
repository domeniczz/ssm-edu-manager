package com.domenic.mapper.permission;

import com.domenic.domain.permission.Menu;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/30/2022 4:14 AM
 */
public interface MenuMapper {

    /**
     * 查询菜单列表
     * @param parent_menu_id 父菜单的 id，若为 -1，就是查询根菜单和其下所有菜单
     * @return List&lt;Menu&gt;
     */
    List<Menu> findAllMenuByPid(Integer parent_menu_id);

    /**
     * 根据菜单 id 查询对应菜单
     * @param menuId 菜单 id
     * @return Menu 封装类
     */
    Menu findMenuById(Integer menuId);

    /**
     * 新增菜单
     * @param menu 菜单封装类
     * @return 是否成功
     */
    int saveMenu(Menu menu);

    /**
     * 修改菜单
     * @param menu 菜单封装类
     * @return 是否成功
     */
    int updateMenu(Menu menu);
}
