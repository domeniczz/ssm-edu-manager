package com.domenic.service.course.impl;

import com.domenic.domain.course.Course;
import com.domenic.domain.course.CourseVo;
import com.domenic.domain.course.Teacher;
import com.domenic.mapper.course.CourseMapper;
import com.domenic.service.course.CourseService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/23/2022 3:17 PM
 */
@Service
public class CourseServiceImpl implements CourseService {

    // 创建 logback 日志对象，代表了日志技术
    private static final Logger LOGGER = LoggerFactory.getLogger("CourseServiceImpl.class");

    @Autowired
    CourseMapper mapper;

    @Override
    public List<Course> findCourseByConditions(CourseVo courseVo) throws Exception {
        LOGGER.info("多条件查询课程");
        return mapper.findCourseByConditions(courseVo);
    }

    @Override
    public boolean saveCourseAndTeacher(CourseVo courseVo) {
        // 课程
        Course course = new Course();
        BeanUtils.copyProperties(courseVo, course);
        LOGGER.info("保存课程开始");
        boolean bc = ServiceOperationsUtil.operate(course, mapper, "save");
        if (!bc) {
            LOGGER.info("保存课程失败");
            return false;
        }
        LOGGER.info("保存课程结束");

        // 讲师
        Teacher teacher = new Teacher();
        BeanUtils.copyProperties(courseVo, teacher);
        teacher.setCourseId(course.getId());
        teacher.setIsDel(0);
        LOGGER.info("保存讲师开始");
        boolean bt = ServiceOperationsUtil.operate(teacher, mapper, "save");
        LOGGER.info(bt ? "保存讲师结束" : "保存讲师失败");
        return bt;
    }

    @Override
    public boolean updateCourseAndTeacher(CourseVo courseVo) {
        // 课程
        Course course = new Course();
        BeanUtils.copyProperties(courseVo, course);
        LOGGER.info("更新课程开始");
        boolean bc = ServiceOperationsUtil.operate(course, mapper, "update");
        if (!bc) {
            LOGGER.info("修改课程失败");
            return false;
        }
        LOGGER.info("修改课程结束");

        // 讲师
        Teacher teacher = new Teacher();
        BeanUtils.copyProperties(courseVo, teacher);
        teacher.setCourseId(course.getId());
        LOGGER.info("更新讲师开始");
        boolean bt = ServiceOperationsUtil.operate(teacher, mapper, "update");
        LOGGER.info(bt ? "修改讲师结束" : "修改讲师失败");
        return bt;
    }

    @Override
    public CourseVo findCourseById(Integer courseId) throws Exception {
        LOGGER.info("根据课程 id 查询课程及对应讲师");
        return mapper.findCourseById(courseId);
    }

    @Override
    public boolean updateCourseStatus(Integer id, Integer status) throws Exception {
        Course course = new Course();
        course.setId(id);
        course.setStatus(status);
        course.setUpdateTime(LocalDateTime.now(ZoneId.of("Asia/Shanghai")));
        LOGGER.info("更新课程状态开始，status 要更改为 " + status);
        int res = mapper.updateCourseStatus(course);

        if (res > 0) {LOGGER.info("更新课程状态成功！");}
        else {LOGGER.error("更新课程状态出错！");}

        return res > 0;
    }

}
