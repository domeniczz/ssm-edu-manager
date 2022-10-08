package com.domenic.mapper.permission;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.ResourceVo;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 4:10 PM
 */
public interface ResourceMapper {

    /**
     * 查找所有资源和条件查询
     * @param resourceVo Resource 相关操作参数的封装类
     * @return List&lt;Resource&gt;
     */
    List<Resource> findAllResource(ResourceVo resourceVo);

    /**
     * 新建资源
     * @param resource 资源封装类
     * @return 是否成功
     */
    int saveResource(Resource resource);

    /**
     * 修改资源
     * @param resource 资源封装类
     * @return 是否成功
     */
    int updateResource(Resource resource);

    /**
     * 删除资源
     * @param id 资源 id
     * @return 是否成功
     */
    int deleteResource(Integer id);
}
