package com.domenic.domain.user;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Domenic
 * @Description 用户模块，用户相关前台参数封装类
 * @Date 9/28/2022 11:05 AM
 */
public class UserVo {

    // 用户 id
    private Integer userId;

    // 当前需要的页号
    private Integer currentPage;

    // 每页中记录的条数
    private Integer pageSize;

    // 多条件查询：用户名
    private String username;

    // 多条件查询：手机号
    private String phone;

    // 角色 id 列表，在给用户分配角色时，需要接收被分配到的角色的 id
    private List<Integer> roleIdList;

    // 注册起始时间
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME, pattern = "yyyy-MM-dd hh:mm:ss")
    private LocalDateTime startCreateTime;

    // 注册结束时间
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME, pattern = "yyyy-MM-dd hh:mm:ss")
    private LocalDateTime endCreateTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Integer> getRoleIdList() {
        return roleIdList;
    }

    public void setRoleIdList(List<Integer> roleIdList) {
        this.roleIdList = roleIdList;
    }

    public LocalDateTime getStartCreateTime() {
        return startCreateTime;
    }

    public void setStartCreateTime(LocalDateTime startCreateTime) {
        this.startCreateTime = startCreateTime;
    }

    public LocalDateTime getEndCreateTime() {
        return endCreateTime;
    }

    public void setEndCreateTime(LocalDateTime endCreateTime) {
        this.endCreateTime = endCreateTime;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "userId=" + userId +
                ", currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", roleIdList=" + roleIdList +
                ", startCreateTime=" + startCreateTime +
                ", endCreateTime=" + endCreateTime +
                '}';
    }
}
