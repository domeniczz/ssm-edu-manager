package com.domenic.service.promotion;

import com.domenic.domain.promotion.PromotionSpace;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 3:22 PM
 */
public interface PromotionSpaceService {

    /**
     * 查询所有广告位
     * @return List&lt;PromotionSpace&gt;
     */
    List<PromotionSpace> findAllPromotionSpace() throws Exception;

    /**
     * 添加广告位
     * @param promotionSpace 广告位封装类
     * @return 是否成功
     */
    boolean savePromotionSpace(PromotionSpace promotionSpace);

    /**
     * 更新广告位信息
     * @param promotionSpace 广告位封装类
     * @return 是否成功
     */
    boolean updatePromotionSpace(PromotionSpace promotionSpace);

    /**
     * 根据广告位 id 查询广告位名称
     * 可用于广告位名称回显
     * @param id 广告位 id
     * @return String 广告位名称
     */
    String findPromotionSpaceNameById(Integer id);

    /**
     * 根据广告位 id 查询广告位信息
     * 可用于广告位信息回显
     * @param id 广告位 id
     * @return PromotionSpace 广告位封装类
     */
    PromotionSpace findPromotionSpaceById(Integer id);
}
