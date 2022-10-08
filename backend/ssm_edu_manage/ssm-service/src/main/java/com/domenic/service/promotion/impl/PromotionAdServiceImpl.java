package com.domenic.service.promotion.impl;

import com.domenic.domain.promotion.PromotionAd;
import com.domenic.exception.DaoNotSuccessException;
import com.domenic.mapper.promotion.PromotionAdMapper;
import com.domenic.service.promotion.PromotionAdService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 5:19 PM
 */
@Service
public class PromotionAdServiceImpl implements PromotionAdService {

    private static final Logger LOGGER = LoggerFactory.getLogger("PromotionAdServiceImpl.class");

    @Autowired
    PromotionAdMapper mapper;

    @Override
    public PageInfo<PromotionAd> findAllPromotionAd(Integer currentPage, Integer pageSize, Integer navigatePages) throws Exception {
        PageHelper.startPage(currentPage, pageSize);
        LOGGER.info("分页查找所有广告信息，查找第 " + currentPage + " 页，每页 " + pageSize + " 条记录");
        // 将结果封装进 PageInfo 类型中
        return new PageInfo<>(mapper.findAllPromotionAd(), navigatePages);
    }

    @Override
    public boolean savePromotionAd(PromotionAd promotionAd) {
        try {
            LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Shanghai"));
            promotionAd.setCreateTime(now);
            promotionAd.setUpdateTime(now);

            int res = mapper.savePromotionAd(promotionAd);
            // 异常处理
            if (0 == res) {
                try {
                    throw new DaoNotSuccessException("Save PromotionAd Failed!");
                } catch (DaoNotSuccessException e) {
                    e.printStackTrace();
                    System.out.println("\npromotionAd:\n" + promotionAd);
                    LOGGER.error("新增广告信息出错！DaoNotSuccessException");
                    return false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean UpdatePromotionAd(PromotionAd promotionAd) {
        try {
            promotionAd.setUpdateTime(LocalDateTime.now(ZoneId.of("Asia/Shanghai")));
            LOGGER.info("修改广告信息开始");
            int res = mapper.updatePromotionAd(promotionAd);
            // 异常处理
            if (0 == res) {
                try {
                    throw new DaoNotSuccessException("Update promotionAd Failed!");
                } catch (DaoNotSuccessException e) {
                    e.printStackTrace();
                    System.out.println("\npromotionAd:\n" + promotionAd);
                    LOGGER.error("修改广告信息出错！DaoNotSuccessException");
                    return false;
                }
            }
            LOGGER.info("修改广告信息结束");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public PromotionAd findPromotionAdById(Integer id) throws Exception {
        LOGGER.info("通过 id 查询广告信息，id = " + id);
        // 将结果封装进 PageInfo 类型中
        return mapper.findPromotionAdById(id);
    }

    @Override
    public boolean updatePromotionAdStatus(Integer id, Integer status) {
        PromotionAd promotionAd = new PromotionAd();
        promotionAd.setId(id);
        promotionAd.setStatus(status);
        promotionAd.setUpdateTime(LocalDateTime.now(ZoneId.of("Asia/Shanghai")));
        LOGGER.info("更新广告状态开始");
        int res = mapper.updatePromotionAdStatus(promotionAd);
        // 异常处理
        if (0 == res) {
            try {
                throw new DaoNotSuccessException("Update promotionAd status Failed!");
            } catch (DaoNotSuccessException e) {
                e.printStackTrace();
                System.out.println("\npromotionAd:\n" + promotionAd);
                LOGGER.error("更新广告状态出错！DaoNotSuccessException");
                return false;
            }
        }
        LOGGER.info("更新广告状态结束");
        return true;
    }
}
