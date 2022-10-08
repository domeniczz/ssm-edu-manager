package com.domenic.service.promotion.impl;

import com.domenic.domain.promotion.PromotionSpace;
import com.domenic.mapper.promotion.PromotionSpaceMapper;
import com.domenic.service.promotion.PromotionSpaceService;
import com.domenic.utils.ServiceOperationsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 3:23 PM
 */
@Service
public class PromotionSpaceServiceImpl implements PromotionSpaceService {

    // 创建 logback 日志对象，代表了日志技术
    private static final Logger LOGGER = LoggerFactory.getLogger("PromotionSpaceServiceImpl.class");

    @Autowired
    PromotionSpaceMapper mapper;

    @Override
    public List<PromotionSpace> findAllPromotionSpace() throws Exception {
        LOGGER.info("查询所有广告位");
        return mapper.findAllPromotionSpace();
    }

    @Override
    public boolean savePromotionSpace(PromotionSpace promotionSpace) {
        LOGGER.info("新增广告位开始");
        boolean b = ServiceOperationsUtil.operate(promotionSpace, mapper, "save");
        LOGGER.info(b ? "新增广告位结束" : "新增广告位失败");
        return b;
    }

    @Override
    public boolean updatePromotionSpace(PromotionSpace promotionSpace) {
        LOGGER.info("修改广告位信息开始");
        boolean b = ServiceOperationsUtil.operate(promotionSpace, mapper, "update");
        LOGGER.info(b ? "修改广告位信息结束" : "修改广告位信息失败");
        return b;
    }

    @Override
    public String findPromotionSpaceNameById(Integer id) {
        return mapper.findPromotionSpaceNameById(id);
    }

    @Override
    public PromotionSpace findPromotionSpaceById(Integer id) {
        return mapper.findPromotionSpaceById(id);
    }
}
