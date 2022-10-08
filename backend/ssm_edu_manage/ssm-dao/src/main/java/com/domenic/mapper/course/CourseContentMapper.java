package com.domenic.mapper.course;

import com.domenic.domain.course.CourseLesson;
import com.domenic.domain.course.CourseSection;

import java.util.List;

/**
 * @author Domenic
 * @Description 课程内容信息 DAO
 * @Date 9/25/2022 7:30 PM
 */
public interface CourseContentMapper {

    /**
     * 根据课程 id 查询章节与课时信息
     * @param id 课程 id
     * @return 返回 CourseSection 的 List 集合，每个 CourseSection 中包含了一个 CourseLesson 的 List 集合
     */
    List<CourseSection> findSectionAndLessonByCourseId(Integer id);

    /**
     * 根据课程 id 查课程名称
     * 回显章节对应的课程名称
     * @param courseId 课程 id
     * @return String courseName
     */
    String findCourseByCourseId(Integer courseId);

    /**
     * 新建章节信息
     * @param courseSection 章节封装类
     * @return 是否成功
     */
    int saveCourseSection(CourseSection courseSection);

    /**
     * 修改章节信息
     * @param courseSection 章节封装类
     * @return 是否成功
     */
    int updateCourseSection(CourseSection courseSection);

    /**
     * 修改章节状态
     * @param courseSection 章节封装类
     * @return 是否成功
     */
    int updateSectionStatus(CourseSection courseSection);

    /**
     * 新建课时
     * @param courseLesson 课时封装类
     * @return 是否成功
     */
    int saveCourseLesson(CourseLesson courseLesson);

    /**
     * 修改课时
     * @param courseLesson 课时封装类
     * @return 是否成功
     */
    int updateCourseLesson(CourseLesson courseLesson);
}
