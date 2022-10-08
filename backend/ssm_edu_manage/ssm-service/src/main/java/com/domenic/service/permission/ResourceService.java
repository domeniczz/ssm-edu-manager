package com.domenic.service.permission;

import com.domenic.domain.permission.Resource;
import com.domenic.domain.permission.ResourceVo;
import com.github.pagehelper.PageInfo;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/1/2022 4:24 PM
 */
public interface ResourceService {

    /**
     * 分页查找所有资源和条件查询
     * @param resourceVo Resource 相关操作参数的封装类
     * @param navigatePages 导航处显示的页码数量
     * @return PageInfo&lt;Resource&gt;
     */
    PageInfo<Resource> findAllResourceByPage(ResourceVo resourceVo, Integer navigatePages);

    /**
     * 新建资源
     * @param resource 资源封装类
     * @return 是否成功
     */
    boolean saveResource(Resource resource);

    /**
     * 修改资源
     * @param resource 资源封装类
     * @return 是否成功
     */
    boolean updateResource(Resource resource);

    /**
     * 删除资源
     * @param id 资源 id
     * @return 是否成功
     */
    boolean deleteResource(Integer id);
}
