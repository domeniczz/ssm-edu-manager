package com.domenic.controller.course.course;

import com.domenic.domain.course.CourseLesson;
import com.domenic.domain.course.CourseSection;
import com.domenic.domain.ResponseResult;
import com.domenic.service.course.CourseContentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/25/2022 5:03 PM
 */
@RestController
@RequestMapping("/courseContent")
public class CourseContentController {

    private static final Logger LOGGER = LoggerFactory.getLogger("CourseContentController.class");

    @Autowired
    CourseContentService service;

    /**
     * 根据课程 id 查询章节与课时信息
     * @param id 课程 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findSectionAndLesson")
    public ResponseResult findSectionAndLesson(@RequestParam Integer id) {
        List<CourseSection> res = null;
        try {
            res = service.findSectionAndLessonByCourseId(id);
            return new ResponseResult(true, 200, "查询章节与课时信息成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error("查询章节与课时信息出错！");
            return new ResponseResult(false, 200, "查询章节与课时信息出错！", res);
        }
    }

    /**
     * 根据课程 id 查课程名称
     * 用于回显章节对应的课程名称
     * @param courseId 课程 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findCourseByCourseId")
    public ResponseResult findCourseByCourseId(@RequestParam("id") Integer courseId) {
        String courseName = null;
        try {
            courseName = service.findCourseByCourseId(courseId);
            return new ResponseResult(true, 200, "查询课程信息成功", courseName);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询课程信息出错！", courseName);
        }
    }

    /**
     * 新建或修改章节信息
     * @param courseSection 前端传递来的数据
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateSection")
    public ResponseResult saveOrUpdateSection(@RequestBody CourseSection courseSection) {
        // 新增
        if (null == courseSection.getId()) {
            boolean b = service.saveSection(courseSection);
            return new ResponseResult(b, 200, b ? "新建章节信息成功" : "新建章节信息出错！", null);
        }
        // 修改
        else {
            boolean b = service.updateSection(courseSection);
            return new ResponseResult(b, 200, b ? "修改章节信息成功" : "修改章节信息出错！", null);
        }
    }

    /**
     * 修改章节状态
     * @param id 章节 id
     * @param status 章节需要更改为的状态
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/updateSectionStatus")
    public ResponseResult updateSectionStatus(
            @RequestParam("id") Integer id, @RequestParam("status") Integer status) {

        Map<String, Integer> map = new HashMap<String, Integer>(){{
            put("status", status);
        }};

        try {
            boolean b = service.updateSectionStatus(id, status);
            return new ResponseResult(b, 200, b ? "修改章节信息成功" : "修改章节信息出错！", map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "修改章节信息出错！", map);
        }
    }

    /**
     * 新建或修改章节信息
     * @param courseLesson 前端传递来的数据
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateLesson")
    public ResponseResult saveOrUpdateLesson(@RequestBody CourseLesson courseLesson) {
        // 新增
        if (null == courseLesson.getId()) {
            boolean b = service.saveLesson(courseLesson);
            return new ResponseResult(b, 200, b ? "新建课时成功" : "新建课时出错！", null);
        }
        // 修改
        else {
            boolean b = service.updateLesson(courseLesson);
            return new ResponseResult(b, 200, b ? "修改课时成功" : "修改课时出错！", null);
        }
    }
}
