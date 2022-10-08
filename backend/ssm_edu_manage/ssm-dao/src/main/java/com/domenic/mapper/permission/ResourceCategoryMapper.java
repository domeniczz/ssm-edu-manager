package com.domenic.mapper.permission;

import com.domenic.domain.permission.ResourceCategory;

import java.util.List;

/**
 * @author Domenic
 * @Description 查询资源分类信息列表
 * @Date 10/1/2022 5:04 PM
 */
public interface ResourceCategoryMapper {

    /**
     * 查询资源分类信息列表
     * @return List&lt;ResourceCategory&gt;
     */
    List<ResourceCategory> findAllResourceCategory();

    /**
     * 添加资源分类
     * @param resourceCategory 参数封装
     * @return 是否成功
     */
    int saveResourceCategory(ResourceCategory resourceCategory);

    /**
     * 修改资源分类
     * @param resourceCategory 参数封装
     * @return 是否成功
     */
    int updateResourceCategory(ResourceCategory resourceCategory);

    /**
     * 删除资源分类
     * @param id 资源分类 id
     * @return 是否成功
     */
    int deleteResourceCategory(Integer id);
}
