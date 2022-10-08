package com.domenic.mapper.promotion;

import com.domenic.domain.promotion.PromotionAd;

import java.util.List;

/**
 * @author Domenic
 * @Description 广告 DAO
 * @Date 9/27/2022 5:20 PM
 */
public interface PromotionAdMapper {

    /**
     * 获取所有广告列表数据
     * @return List&lt;PromotionAd&gt;
     */
    List<PromotionAd> findAllPromotionAd();

    /**
     * 新建广告信息成功
     * @param promotionAd 广告封装类
     * @return 是否成功
     */
    int savePromotionAd(PromotionAd promotionAd);

    /**
     * 修改广告信息成功
     * @param promotionAd 广告封装类
     * @return 是否成功
     */
    int updatePromotionAd(PromotionAd promotionAd);

    /**
     * 通过 id 查询广告信息
     * 可用于广告信息的回显
     * @param id 广告 id
     * @return PromotionAd 广告封装类
     */
    PromotionAd findPromotionAdById(Integer id);

    /**
     * 更新广告的上下线状态
     * @param promotionAd 广告封装类
     * @return 是否成功
     */
    int updatePromotionAdStatus(PromotionAd promotionAd);
}
