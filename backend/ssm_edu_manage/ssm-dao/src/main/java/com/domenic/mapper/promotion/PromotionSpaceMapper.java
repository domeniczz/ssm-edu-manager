package com.domenic.mapper.promotion;

import com.domenic.domain.promotion.PromotionSpace;

import java.util.List;

/**
 * @author Domenic
 * @Description 广告位 DAO
 * @Date 9/27/2022 2:57 PM
 */
public interface PromotionSpaceMapper {

    /**
     * 查询所有广告位
     * @return List&lt;PromotionSpace&gt;
     */
    List<PromotionSpace> findAllPromotionSpace();

    /**
     * 添加广告位
     * @param promotionSpace 广告位封装类
     * @return 是否成功
     */
    int savePromotionSpace(PromotionSpace promotionSpace);

    /**
     * 更新广告位信息
     * @param promotionSpace 广告位封装类
     * @return 是否成功
     */
    int updatePromotionSpace(PromotionSpace promotionSpace);

    /**
     * 根据广告位 id 查询广告位名称
     * 用于广告位名称回显
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
