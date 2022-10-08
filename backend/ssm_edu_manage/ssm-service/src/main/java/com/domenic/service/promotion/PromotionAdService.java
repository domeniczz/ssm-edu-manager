package com.domenic.service.promotion;

import com.domenic.domain.promotion.PromotionAd;
import com.github.pagehelper.PageInfo;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 5:17 PM
 */
public interface PromotionAdService {

    /**
     * 分页获取所有广告列表数据
     * @return PageInfo
     */
    PageInfo<PromotionAd> findAllPromotionAd(Integer currentPage, Integer pageSize, Integer navigatePages) throws Exception;

    /**
     * 新建广告信息成功
     * @param promotionAd PromotionAd 封装类
     * @return 是否成功
     */
    boolean savePromotionAd(PromotionAd promotionAd);

    /**
     * 修改广告信息成功
     * @param promotionAd PromotionAd 封装类
     * @return 是否成功
     */
    boolean UpdatePromotionAd(PromotionAd promotionAd);

    /**
     * 通过 id 查询广告信息
     * 可用于广告信息的回显
     * @param id 广告 id
     * @return PromotionAd 广告封装类
     */
    PromotionAd findPromotionAdById(Integer id) throws Exception;

    /**
     * 更新广告的上下线状态
     * @param id 广告 id
     * @param status 要更新为的状态
     * @return 是否成功
     */
    boolean updatePromotionAdStatus(Integer id, Integer status);
}
