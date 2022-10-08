package com.domenic.controller.course.promotion;

import com.domenic.domain.promotion.PromotionAd;
import com.domenic.domain.ResponseResult;
import com.domenic.exception.FileSaveFailedException;
import com.domenic.service.promotion.PromotionAdService;
import com.domenic.utils.FileUploadUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 5:07 PM
 */
@RestController
@RequestMapping("/promotionAd")
public class PromotionAdController {

    @Autowired
    PromotionAdService service;

    /**
     * 分页获取所有广告列表数据
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findAllPromotionAd")
    public ResponseResult findAllPromotionAd(
            @RequestParam(required = false, defaultValue = "1") Integer currentPage,
            @RequestParam(required = false, defaultValue = "5") Integer pageSize) {
        PageInfo<PromotionAd> res = null;
        try {
            res = service.findAllPromotionAd(currentPage, pageSize, 3);
            return new ResponseResult(true, 200, "分页获取广告列表数据成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "分页获取广告列表数据出错！", res);
        }
    }

    /**
     * 广告图片上传
     * @param file 图片文件
     * @return ResponseResult 返回信息封装类，若出错则 content 为 null
     */
    @PostMapping("/PromotionAdUpload")
    public ResponseResult PromotionAdImageUpload(@RequestBody MultipartFile file, HttpSession session) {
        try {
            Map<String, String> res = FileUploadUtil.fileupload(file, session);
            return new ResponseResult(null != res, 200, "广告图片上传成功", res);
        } catch (FileSaveFailedException e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "广告图片上传失败，保存出错！", null);
        }
    }

    /**
     * 新建或更新广告信息
     * @param promotionAd PromotionAd 封装类
     * @return ResponseResult 返回信息封装类
     */
    @PostMapping("/saveOrUpdatePromotionAd")
    public ResponseResult saveOrUpdatePromotionAd(@RequestBody PromotionAd promotionAd) {
        System.out.println(promotionAd);
        // 添加操作
        if (null == promotionAd.getId()) {
            boolean b = service.savePromotionAd(promotionAd);
            return new ResponseResult(b, 200, b ? "新建广告信息成功" : "新建广告信息失败", null);
        }
        // 修改操作
        else {
            boolean b = service.UpdatePromotionAd(promotionAd);
            return new ResponseResult(b, 200, b ? "修改广告信息成功" : "修改广告信息失败", null);
        }
    }

    /**
     * 通过 id 查询广告信息
     * 可用于广告信息的回显
     * @param id 广告 id
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/findPromotionAdById")
    public ResponseResult findPromotionAdById(@RequestParam Integer id) {
        PromotionAd res = null;
        try {
            res = service.findPromotionAdById(id);
            return new ResponseResult(true, 200, "查询广告信息成功", res);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseResult(false, 200, "查询广告信息出错！", res);
        }
    }

    /**
     * 更新广告的上下线状态
     * @param id 广告 id
     * @param status 要更新为的状态
     * @return ResponseResult 返回信息封装类
     */
    @GetMapping("/updatePromotionAdStatus")
    public ResponseResult updatePromotionAdStatus(@RequestParam Integer id, @RequestParam Integer status) {
        boolean b = service.updatePromotionAdStatus(id,status);
        return new ResponseResult(b, 200, b ? "更新广告状态成功" : "更新广告状态失败", null);
    }

}
