package com.domenic.domain.permission;

import java.util.List;

/**
 * @author Domenic
 * @Description 接收参数
 * @Date 9/29/2022 10:07 PM
 */
public class RoleMenuVo {

    private Integer roleId;

    private List<Integer> menuIdList;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public List<Integer> getMenuIdList() {
        return menuIdList;
    }

    public void setMenuIdList(List<Integer> menuIdList) {
        this.menuIdList = menuIdList;
    }

    @Override
    public String toString() {
        return "RoleMenuVo{" +
                "roleId=" + roleId +
                ", menuIdList=" + menuIdList +
                '}';
    }
}
