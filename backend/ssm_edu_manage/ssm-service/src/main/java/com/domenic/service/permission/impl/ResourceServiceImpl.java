package com.domenic.service.permission.impl;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.ResourceVo;
import com.domenic.mapper.permission.ResourceMapper;
import com.domenic.service.permission.ResourceService;
import com.domenic.utils.ServiceOperationsUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 4:25 PM
 */
@Service
public class ResourceServiceImpl implements ResourceService {

    private static final Logger LOGGER = LoggerFactory.getLogger("ResourceServiceImpl.class");

    @Autowired
    ResourceMapper mapper;

    @Override
    public PageInfo<Resource> findAllResourceByPage(ResourceVo resourceVo, Integer navigatePages) {
        LOGGER.info("分页查找所有资源和条件查询");
        LOGGER.info("resourceVo: " + resourceVo);
        PageHelper.startPage(resourceVo.getCurrentPage(), resourceVo.getPageSize());
        return new PageInfo<>(mapper.findAllResource(resourceVo), navigatePages);
    }

    @Override
    public boolean saveResource(Resource resource) {
        // 设置默认值
        if (null == resource.getCreatedBy()) {
            resource.setCreatedBy("system");
        }
        if (null == resource.getUpdatedBy()) {
            resource.setUpdatedBy("system");
        }
        LOGGER.info("新增资源开始");
        boolean b = ServiceOperationsUtil.operate(resource, mapper, "save");
        LOGGER.info(b ? "新增资源结束" : "新增资源失败");
        return b;
    }

    @Override
    public boolean updateResource(Resource resource) {
        // 设置默认值
        if (null == resource.getUpdatedBy()) {
            resource.setUpdatedBy("system");
        }
        LOGGER.info("修改资源开始");
        boolean b = ServiceOperationsUtil.operate(resource, mapper, "update");
        LOGGER.info(b ? "修改资源结束" : "修改资源失败");
        return b;
    }

    @Override
    public boolean deleteResource(Integer id) {
        LOGGER.info("删除资源（id = " + id + "）开始");
        boolean b = mapper.deleteResource(id) > 0;
        LOGGER.info(b ? "删除资源（id = " + id + "）结束" : "删除资源（id = " + id + "）失败！");
        return b;
    }
}
