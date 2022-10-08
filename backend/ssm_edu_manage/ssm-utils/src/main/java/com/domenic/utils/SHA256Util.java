package com.domenic.utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author Domenic
 * @Description SHA-256 工具类
 * @Date 10/3/2022 4:44 AM
 */
public class SHA256Util {

    /**
     * SHA-256 with Apache Commons Codecs
     * @param plainText 明文
     * @return cipherText 密文
     * @throws Exception
     */
    public static String sha256(String plainText) throws Exception {
        if (plainText == null || plainText.length() <= 0) {
            return null;
        }
        // 加密字符串
        String cipherText = DigestUtils.sha256Hex(plainText);
        System.out.println("SHA-256 cipherText: " + cipherText);
        return cipherText;
    }

    /**
     * 校验密码的是否正确
     * @param plainText 密码明文
     * @param cipherPassword 密码密文
     * @return 是否校验通过
     * @throws Exception
     */
    public static boolean verify(String plainText, String cipherPassword) throws Exception {
        String res = sha256(plainText);
        return res.equals(cipherPassword);
    }

    /**
     * SHA-256 with Guava
     */
    /*public static String sha256Digest(String plainText) {
        return Hashing.sha256().hashString(plainText, StandardCharsets.UTF_8).toString();
    }*/

    /**
     * SHA-256 with MessageDigest
     */
    /*public static String sha256(String plainText) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] msgDigest = digest.digest(plainText.getBytes(StandardCharsets.UTF_8));
        System.out.println(msgDigest.length);

        StringBuilder hexString = new StringBuilder(msgDigest.length * 2);
        for (byte b : msgDigest) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        return hexString.toString();
    }*/
}
