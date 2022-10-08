package com.domenic.service.permission.impl;

import com.domenic.domain.permission.ResourceCategory;
import com.domenic.mapper.permission.ResourceCategoryMapper;
import com.domenic.service.permission.ResourceCategoryService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 5:09 PM
 */
@Service
public class ResourceCategoryServiceImpl implements ResourceCategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger("ResourceCategoryImpl.class");

    @Autowired
    ResourceCategoryMapper mapper;

    @Override
    public List<ResourceCategory> findAllResourceCategory() {
        LOGGER.info("查询资源分类信息列表");
        return mapper.findAllResourceCategory();
    }

    @Override
    public boolean saveResourceCategory(ResourceCategory resourceCategory) {
        // 设置默认值
        if (null == resourceCategory.getCreatedBy()) {
            resourceCategory.setCreatedBy("system");
        }
        if (null == resourceCategory.getUpdatedBy()) {
            resourceCategory.setUpdatedBy("system");
        }
        LOGGER.info("新增资源分类开始");
        boolean b = ServiceOperationsUtil.operate(resourceCategory, mapper, "save");
        LOGGER.info(b ? "新增资源分类结束" : "新增资源分类失败");
        return b;
    }

    @Override
    public boolean updateResourceCategory(ResourceCategory resourceCategory) {
        // 设置默认值
        if (null == resourceCategory.getUpdatedBy()) {
            resourceCategory.setUpdatedBy("system");
        }
        LOGGER.info("修改资源分类开始");
        boolean b = ServiceOperationsUtil.operate(resourceCategory, mapper, "update");
        LOGGER.info(b ? "修改资源分类结束" : "修改资源分类失败");
        return b;
    }

    @Override
    public boolean deleteResourceCategory(Integer id) {
        LOGGER.info("删除资源分类（id = " + id + "）开始");
        boolean b = mapper.deleteResourceCategory(id) > 0;
        LOGGER.info(b ? "删除资源分类（id = " + id + "）结束" : "删除资源分类（id = " + id + "）失败！");
        return b;
    }
}
