package com.domenic.service.course;

import com.domenic.domain.course.CourseLesson;
import com.domenic.domain.course.CourseSection;

import java.util.List;

/**
 * @author Domenic
 * @Description 课程内容：章节、课时
 * @Date 9/25/2022 7:01 PM
 */
public interface CourseContentService {

    /**
     * 根据课程 id 查询章节与课时信息
     * @param courseId 课程 id
     * @return List&lt;CourseSection&gt; 章节信息的 List 集合，章节中包含了课时的 List 集合
     */
    List<CourseSection> findSectionAndLessonByCourseId(Integer courseId) throws Exception;

    /**
     * 根据课程 id 查课程名称
     * 回显章节对应的课程名称
     * @param courseId 课程 id
     * @return String courseName
     */
    String findCourseByCourseId(Integer courseId) throws Exception;

    /**
     * 新建章节信息
     * @param courseSection 章节封装类
     * @return 是否成功
     */
    boolean saveSection(CourseSection courseSection);

    /**
     * 修改章节信息
     * @param courseSection 章节封装类
     * @return 是否成功
     */
    boolean updateSection(CourseSection courseSection);

    /**
     * 修改章节状态
     * @param id 章节 id
     * @param status 章节需要更改为的状态
     * @return 是否成功
     */
    boolean updateSectionStatus(Integer id, Integer status);

    /**
     * 新建课时
     * @param courseLesson 课时封装类
     * @return 是否成功
     */
    boolean saveLesson(CourseLesson courseLesson);

    /**
     * 修改课时
     * @param courseLesson 课时封装类
     * @return 是否成功
     */
    boolean updateLesson(CourseLesson courseLesson);
}
