package com.domenic.controller.course.promotion;

import com.domenic.domain.promotion.PromotionSpace;
import com.domenic.domain.ResponseResult;
import com.domenic.service.promotion.PromotionSpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 3:24 PM
 */
@RestController
@RequestMapping("/promotionSpace")
public class PromotionSpaceController {

    @Autowired
    PromotionSpaceService service;

    /**
     * 查询所有广告位
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findAllPromotionSpace")
    public ResponseResult findAllPromotionSpace() {
        List<PromotionSpace> allPromotionSpace = null;
        try {
            allPromotionSpace = service.findAllPromotionSpace();
            return new ResponseResult(true, 200, "查询所有广告位成功", allPromotionSpace);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询所有广告位出错！", allPromotionSpace);
        }
    }

    /**
     * 新增或更新广告位
     * @param promotionSpace 广告位封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdatePromotionSpace")
    public ResponseResult saveOrUpdatePromotionSpace(@RequestBody PromotionSpace promotionSpace) {
        // 新增操作
        if (promotionSpace.getId() == null) {
            boolean b = service.savePromotionSpace(promotionSpace);
            return new ResponseResult(b, 200, b ? "新增广告位成功" : "新增广告位出错！", null);
        }
        // 更新操作
        else {
            boolean b = service.updatePromotionSpace(promotionSpace);
            return new ResponseResult(b, 200, b ? "修改广告位信息成功" : "修改广告位信息出错！", null);
        }
    }

    /**
     * 根据广告位 id 查询广告位名称
     * 可用于广告位名称回显
     * @param id 广告位 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findPromotionSpaceById")
    public ResponseResult findPromotionSpaceNameById(@RequestParam Integer id) {
        return new ResponseResult(true, 200, "查询广告位名称成功", service.findPromotionSpaceNameById(id));
    }
}
