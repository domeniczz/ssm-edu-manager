package com.domenic.service.permission.impl;

import com.domenic.domain.permission.Menu;
import com.domenic.mapper.permission.MenuMapper;
import com.domenic.service.permission.MenuService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/30/2022 4:11 AM
 */
@Service
public class MenuServiceImpl implements MenuService {

    private static final Logger LOGGER = LoggerFactory.getLogger("MenuServiceImpl.class");

    @Autowired
    MenuMapper mapper;

    /**
     * 查询菜单列表
     * @param parent_menu_id 父菜单的 id，若为 -1，就是查询根菜单和其下所有菜单
     * @return List&lt;Menu&gt;
     */
    @Override
    public List<Menu> findAllMenuByPid(Integer parent_menu_id) {
        LOGGER.info("查询菜单列表");
        return mapper.findAllMenuByPid(parent_menu_id);
    }

    /**
     * 根据菜单 id 查询菜单
     * @param menuId 菜单 id
     * @return
     */
    @Override
    public Menu findMenuById(Integer menuId) {
        LOGGER.info("根据菜单 id 查询菜单，menuId = " + menuId);
        return mapper.findMenuById(menuId);
    }

    // 新增菜单
    @Override
    public boolean saveMenu(Menu menu) {
        // 设置默认值
        if (null == menu.getCreatedBy()) {
            menu.setCreatedBy("system");
        }
        if (null == menu.getUpdatedBy()) {
            menu.setUpdatedBy("system");
        }
        LOGGER.info("新增菜单开始");
        boolean b = ServiceOperationsUtil.operate(menu, mapper, "save");
        LOGGER.info(b ? "新增菜单结束" : "新增菜单失败");
        return b;
    }

    /**
     * 更新菜单
     * @param menu 菜单封装类
     * @return
     */
    @Override
    public boolean updateMenu(Menu menu) {
        // 设置默认值
        if (null == menu.getUpdatedBy()) {
            menu.setUpdatedBy("system");
        }
        LOGGER.info("修改菜单开始");
        boolean b = ServiceOperationsUtil.operate(menu, mapper, "update");
        LOGGER.info(b ? "修改菜单结束" : "修改菜单失败");
        return b;
    }
}
