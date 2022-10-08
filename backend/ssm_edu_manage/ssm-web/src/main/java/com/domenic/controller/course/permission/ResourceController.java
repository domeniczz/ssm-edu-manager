package com.domenic.controller.course.permission;

import com.domenic.domain.ResponseResult;
import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.ResourceVo;
import com.domenic.service.permission.ResourceService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 4:32 PM
 */
@RestController
@RequestMapping("/resource")
public class ResourceController {

    @Autowired
    ResourceService service;

    /**
     * 分页查找所有资源和条件查询
     * @param resourceVo Resource 相关操作参数的封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/findAllResource")
    public ResponseResult findAllResourceCategory(@RequestBody ResourceVo resourceVo) {
        PageInfo<Resource> res = null;
        try {
            // 导航处显示的页码数量
            Integer navigatePages = 5;
            res = service.findAllResourceByPage(resourceVo, navigatePages);
            return new ResponseResult(true, 200, "分页或条件查找所有资源成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "分页或条件查找所有资源出错", res);
        }
    }

    /**
     * 新建或修改资源
     * @param resource 资源封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateResource")
    public ResponseResult saveOrUpdateResource(@RequestBody Resource resource) {
        // 添加操作
        if (null == resource.getId()) {
            boolean b = service.saveResource(resource);
            return new ResponseResult(b, 200, b ? "新建资源成功" : "新建资源失败", null);
        }
        // 修改操作
        else {
            boolean b = service.updateResource(resource);
            return new ResponseResult(b, 200, b ? "修改资源成功" : "修改资源失败", null);
        }
    }

    /**
     * 删除资源
     * @param id 资源 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/deleteResource")
    public ResponseResult deleteResource(@RequestParam Integer id) {
        boolean b = service.deleteResource(id);
        return new ResponseResult(b, 200, b ? "删除资源成功" : "删除资源失败", null);
    }
}
