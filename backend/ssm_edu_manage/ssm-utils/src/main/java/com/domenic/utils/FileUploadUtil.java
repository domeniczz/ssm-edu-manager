package com.domenic.utils;

import com.domenic.exception.FileSaveFailedException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 7:11 PM
 */
public class FileUploadUtil {

    /**
     * 文件上传工具类
     * @param file 文件，MultiPart 类型
     * @param session
     * @return Map 集合，包含上传后的 文件名 和 文件路径
     */
    public static Map<String, String> fileupload(MultipartFile file, HttpSession session) throws FileSaveFailedException {
        try {
            // 若文件为空
            if(file.isEmpty()){
                throw new RuntimeException();
            }

            // 获取文件名
            String filename = file.getOriginalFilename();
            // 生成文件名，UUID + 后缀名 拼接
            filename = filename.substring(0, filename.lastIndexOf("."))
                    + UUID.randomUUID()
                    + filename.substring(filename.lastIndexOf("."));

            // D:\Program\apache-tomcat\webapp\ssm_web\asset
            String path = session.getServletContext().getRealPath("asset");
            System.out.println(path);
            // "D:\Program\apache-tomcat\webapp\" + "asset"
            // String path = realPath.substring(0, realPath.indexOf("ssm_web")) + "asset";
            File f = new File(path);

            // 若 asset 目录不存在则创建
            if (!f.exists()) {
                boolean res = f.mkdir();
            }

            // 保存文件
            final String filePath = path + File.separator + filename;
            file.transferTo(new File(filePath));

            // effectively final, to be accessed in inner class
            String finalFilename = filename;

            return new HashMap<String, String>() {{
                put("fileName", finalFilename);
                put("filePath", filePath);
            }};
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileSaveFailedException("文件保存出错");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
