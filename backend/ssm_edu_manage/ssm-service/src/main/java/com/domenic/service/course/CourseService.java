package com.domenic.service.course;

import com.domenic.domain.course.Course;
import com.domenic.domain.course.CourseVo;

import java.util.List;

/**
 * @author Domenic
 * @Description 课程信息
 * @Date 9/23/2022 2:51 PM
 */
public interface CourseService {

    /**
     * 多条件查询
     * @param courseVo 请求参数封装类
     * @return
     */
    List<Course> findCourseByConditions(CourseVo courseVo) throws Exception;

    /**
     * 保存课程和讲师的信息
     * @param courseVo 请求参数封装类
     * @return 执行是否成功
     */
    boolean saveCourseAndTeacher(CourseVo courseVo);

    /**
     * 更新课程和讲师的信息
     * @param courseVo 请求参数封装类
     * @return 执行是否成功
     */
    boolean updateCourseAndTeacher(CourseVo courseVo);

    /**
     * 根据课程 id 查询课程及对应讲师的信息
     * 可以用于信息回显
     * @param courseId 课程 id
     * @return
     */
    CourseVo findCourseById(Integer courseId) throws Exception;

    /**
     * 更新课程状态
     * @param id 课程 id
     * @param status 课程需要更改为的状态
     * @return 执行是否成功
     */
    boolean updateCourseStatus(Integer id, Integer status) throws Exception;
}
