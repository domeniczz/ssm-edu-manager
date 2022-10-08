package com.domenic.controller.course.permission;

import com.domenic.domain.ResponseResult;
import com.domenic.domain.permission.ResourceCategory;
import com.domenic.service.permission.ResourceCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 5:11 PM
 */
@RestController
@RequestMapping("/resourceCategory")
public class ResourceCategoryController {

    @Autowired
    private ResourceCategoryService service;

    /**
     * 查询资源分类信息列表
     * @return ResponseResult 返回信息封装类
     */
    @RequestMapping("/findAllResourceCategory")
    public ResponseResult findAllResourceCategory(){
        List<ResourceCategory> res = service.findAllResourceCategory();
        return  new ResponseResult(true,200,"查询所有资源分类信息成功", res);
    }

    /**
     * 添加或修改资源分类
     * @param resourceCategory 参数封装
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdateResourceCategory")
    public ResponseResult saveOrUpdateResourceCategory(@RequestBody ResourceCategory resourceCategory) {
        boolean b;
        // 新增操作
        if (null == resourceCategory.getId()) {
            b = service.saveResourceCategory(resourceCategory);
            return new ResponseResult(b, 200, b ? "新建资源分类成功" : "新建资源分类失败", null);
        }
        // 修改操作
        else {
            b = service.updateResourceCategory(resourceCategory);
            return new ResponseResult(b, 200, b ? "修改资源分类成功" : "修改资源分类失败", null);
        }
    }

    /**
     * 删除资源分类接口
     * @param id 资源分类 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/deleteResourceCategory")
    public ResponseResult deleteResourceCategory(@RequestParam Integer id) {
        boolean b = service.deleteResourceCategory(id);
        return new ResponseResult(b, 200, b ? "删除资源分类成功" : "删除资源分类失败", null);
    }
}

