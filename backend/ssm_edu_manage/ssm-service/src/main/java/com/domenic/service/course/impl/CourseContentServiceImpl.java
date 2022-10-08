package com.domenic.service.course.impl;

import com.domenic.domain.course.CourseLesson;
import com.domenic.domain.course.CourseSection;
import com.domenic.mapper.course.CourseContentMapper;
import com.domenic.service.course.CourseContentService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/25/2022 7:02 PM
 */
@Service
public class CourseContentServiceImpl implements CourseContentService {

    // 创建 logback 日志对象，代表了日志技术
    private static final Logger LOGGER = LoggerFactory.getLogger("CourseContentServiceImpl.class");

    @Autowired
    CourseContentMapper mapper;

    @Override
    public List<CourseSection> findSectionAndLessonByCourseId(Integer courseId) throws Exception {
        LOGGER.info("根据 id 查询章节与课时信息，courseId = " + courseId);
        return mapper.findSectionAndLessonByCourseId(courseId);
    }

    @Override
    public String findCourseByCourseId(Integer courseId) throws Exception {
        LOGGER.info("根据课程 id 查询章节对应的课程名称，courseId = " + courseId);
        return mapper.findCourseByCourseId(courseId);
    }

    @Override
    public boolean saveSection(CourseSection courseSection) {
        LOGGER.info("新增章节开始");
        boolean b = ServiceOperationsUtil.operate(courseSection, mapper, "save");
        LOGGER.info(b ? "新增章节结束" : "新增章节失败");
        return b;
    }

    @Override
    public boolean updateSection(CourseSection courseSection) {
        LOGGER.info("修改章节开始");
        boolean b = ServiceOperationsUtil.operate(courseSection, mapper, "update");
        LOGGER.info(b ? "修改章节结束" : "修改章节失败");
        return b;
    }

    @Override
    public boolean updateSectionStatus(Integer id, Integer status) {
        CourseSection courseSection = new CourseSection();
        courseSection.setStatus(status);
        courseSection.setUpdateTime(LocalDateTime.now(ZoneId.of("Asia/Shanghai")));
        courseSection.setId(id);
        int res = mapper.updateSectionStatus(courseSection);

        if (res > 0) {LOGGER.info("更新章节状态成功！");}
        else {LOGGER.error("更新章节状态出错！");}

        return res > 0;
    }

    @Override
    public boolean saveLesson(CourseLesson courseLesson) {
        LOGGER.info("新增课时开始");
        boolean b = ServiceOperationsUtil.operate(courseLesson, mapper, "save");
        LOGGER.info(b ? "新增课时结束" : "新增课时失败");
        return b;
    }

    @Override
    public boolean updateLesson(CourseLesson courseLesson) {
        LOGGER.info("修改课时开始");
        boolean b = ServiceOperationsUtil.operate(courseLesson, mapper, "update");
        LOGGER.info(b ? "修改课时结束" : "修改课时失败");
        return b;
    }

}
