package com.domenic.mapper.course;

import com.domenic.domain.course.Course;
import com.domenic.domain.course.CourseVo;
import com.domenic.domain.course.Teacher;

import java.util.List;

/**
 * @author Domenic
 * @Description 课程信息 DAO
 * @Date 9/22/2022 9:55 PM
 */
public interface CourseMapper {

    /**
     * 多条件查询 course 表
     * @param courseVo 请求参数
     * @return
     */
    List<Course> findCourseByConditions(CourseVo courseVo);

    /**
     * 保存课程到 course 表
     * @param course 课程封装类
     * @return 执行是否成功
     */
    int saveCourse(Course course);

    /**
     * 保存老师到 teacher 表
     * @param teacher 老师封装类
     * @return 执行是否成功
     */
    int saveTeacher(Teacher teacher);

    /**
     * 更新课程到 course 表
     * @param course 课程封装类
     * @return 执行是否成功
     */
    int updateCourse(Course course);

    /**
     * 更新老师到 teacher 表
     * @param teacher 老师封装类
     * @return 执行是否成功
     */
    int updateTeacher(Teacher teacher);

    /**
     * 根据课程 id 查询课程及对应讲师的信息
     * 可以用于信息回显
     * @param courseId 课程 id
     * @return
     */
    CourseVo findCourseById(Integer courseId);

    /**
     * 更新课程状态
     * @param course 课程封装类
     * @return 执行是否成功
     */
    int updateCourseStatus(Course course);
}
