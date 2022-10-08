package com.domenic.utils;

import org.apache.commons.codec.digest.DigestUtils;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author Domenic
 * @Description MD5 工具类
 * @Date 10/2/2022 8:28 PM
 */
public class MD5Util {

    /**
     * MD5 with apache.commons.codec
     * @param plainText 明文
     * @return cipherText 密文
     * @throws Exception 异常
     */
    public static String md5(String plainText) throws Exception {
        if (plainText == null || plainText.length() <= 0) {
            return null;
        }
        // 加密字符串
        String cipherText = DigestUtils.md5Hex(plainText);
        System.out.println("MD5 cipherText: " + cipherText);
        return cipherText;
    }

    /**
     * MD5 验证方法
     * @param plainText 明文
     * @param cipherText 密文
     * @return 是否验证通过
     * @throws Exception 异常
     */
    public static boolean verify(String plainText, String cipherText) throws Exception {
        // 根据传入的密钥进行验证
        String md5Text = md5(plainText);
        if (md5Text.equals(cipherText)) {
            System.out.println("MD5 verified!");
            return true;
        }
        return false;
    }

    /**
     * MD5 with MessageDigest
     * @param plainText 明文
     * @return cipherText 密文
     * @throws NoSuchAlgorithmException
     */
    public static String md5Digest(String plainText) throws NoSuchAlgorithmException {
        // Static getInstance method is called with hashing MD5
        MessageDigest md = MessageDigest.getInstance("MD5");

        // digest() method is called to calculate message digest of plainText, returns array of byte
        // the length of messageDigest is 16
        byte[] messageDigest = md.digest(plainText.getBytes(StandardCharsets.UTF_8));

        // Convert byte array into signum representation
        BigInteger bigInt = new BigInteger(1, messageDigest);

        // Convert message digest into hex value
        StringBuilder hashTest = new StringBuilder(bigInt.toString(16));
        while (hashTest.length() < 32) {
            hashTest.insert(0, "0");
        }
        return hashTest.toString();
    }

    public static boolean verifyDigest(String plainText, String cipherText) throws NoSuchAlgorithmException {
        String res = md5Digest(plainText);
        if (res.equals(cipherText)) {
            System.out.println("MD5 verified!");
            return true;
        }
        return false;
    }

}
