package com.domenic.controller.course.course;

import com.domenic.domain.course.Course;
import com.domenic.domain.course.CourseVo;
import com.domenic.domain.ResponseResult;
import com.domenic.exception.FileSaveFailedException;
import com.domenic.service.course.CourseService;
import com.domenic.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Domenic
 * @Classname TestController
 * @Description TODO
 * @Date 9/21/2022 8:28 PM
 * @Created by Domenic
 */
@RestController
@RequestMapping(value = "/course")
public class CourseController {

    @Autowired
    CourseService service;

    /**
     * 多条件查询课程信息
     * @param courseVo 请求参数封装类
     * @return ResponseResult 返回信息封装类，content 可能为 null
     */
    @GetMapping("/findCourseByCondition")
    public ResponseResult findCourseByConditions(@RequestBody CourseVo courseVo) {
        List<Course> res = null;
        try {
            res = service.findCourseByConditions(courseVo);
            return new ResponseResult(true, 200, "查询成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询出错", res);
        }
    }

    /**
     * 新建或修改课程
     * @param courseVo 请求参数封装类
     * @return ResponseResult 返回信息封装类，content 为 null
     */
    @PostMapping("/saveOrUpdateCourse")
    public ResponseResult saveOrUpdateCourse(@RequestBody CourseVo courseVo) {
        // 添加操作
        if (null == courseVo.getId()) {
            boolean b = service.saveCourseAndTeacher(courseVo);
            return new ResponseResult(b, 200, b ? "新建课程成功" : "新建课程失败", null);
        }
        // 修改操作
        else {
            boolean b = service.updateCourseAndTeacher(courseVo);
            return new ResponseResult(b, 200, b ? "修改课程成功" : "修改课程失败", null);
        }
    }

    /**
     * 课程图片上传
     * @param file 图片文件
     * @return ResponseResult 返回信息封装类，若出错则 content 为 null
     */
    @RequestMapping(value = "/courseImageUpload", method = RequestMethod.POST)
    public ResponseResult courseImageUpload(@RequestParam("file") MultipartFile file, HttpSession session) {
        try {
            Map<String, String> res = FileUploadUtil.fileupload(file, session);
            return new ResponseResult(null != res, 200, "课程图片上传成功", res);
        } catch (FileSaveFailedException e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "课程图片失败，保存出错！", null);
        }
    }

    /**
     * 根据课程 id 查询课程及对应的讲师信息
     * @return ResponseResult 返回信息封装类，content 可能为 null
     */
    @GetMapping("/findCourseById")
    public ResponseResult findCourseById(@RequestParam Integer id) {
        CourseVo res = null;
        try {
            res = service.findCourseById(id);
            return new ResponseResult(true, 200, "根据课程 id 查询成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "根据课程 id 查询出错", res);
        }
    }

    /**
     * 更新课程状态
     * @param id 课程 id
     * @param status 课程需要更改为的状态
     * @return ResponseResult 返回信息封装类，content 为参数 status 的值
     */
    @GetMapping("/updateCourseStatus")
    public ResponseResult updateCourseStatus(@RequestParam Integer id, @RequestParam Integer status) {

        Map<String, Integer> map = new HashMap<String, Integer>(){{
            put("status", status);
        }};

        try {
            boolean b = service.updateCourseStatus(id, status);
            return new ResponseResult(b, 200, b ? "更新课程状态成功" : "更新课程状态出错！", map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "更新课程状态出错！", map);
        }
    }

}
