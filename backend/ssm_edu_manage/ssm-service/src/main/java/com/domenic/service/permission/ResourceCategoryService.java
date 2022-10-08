package com.domenic.service.permission;

import com.domenic.domain.permission.ResourceCategory;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 5:08 PM
 */
public interface ResourceCategoryService {

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
    boolean saveResourceCategory(ResourceCategory resourceCategory);

    /**
     * 修改资源分类
     * @param resourceCategory 参数封装
     * @return 是否成功
     */
    boolean updateResourceCategory(ResourceCategory resourceCategory);

    /**
     * 删除资源分类接口
     * @param id 资源分类 id
     * @return 是否成功
     */
    boolean deleteResourceCategory(Integer id);
}
