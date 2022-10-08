package com.domenic.domain.course;

import java.time.LocalDateTime;

/**
 * @author Domenic
 * @Description 讲师类
 * @Date 9/24/2022 3:01 PM
 */
public class Teacher {

    // id
    private Integer id;

    // 课程id
    private Integer courseId;

    // 讲师姓名
    private String teacherName;

    // 讲师职务
    private String position;

    // 介绍
    private String description;

    // 创建时间
    private LocalDateTime createTime;

    // 修改时间
    private LocalDateTime updateTime;

    // 是否删除
    private Integer isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", courseId=" + courseId +
                ", teacherName='" + teacherName + '\'' +
                ", position='" + position + '\'' +
                ", description='" + description + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", isDel=" + isDel +
                '}';
    }
}
