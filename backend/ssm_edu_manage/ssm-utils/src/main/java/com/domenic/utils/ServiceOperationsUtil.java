package com.domenic.utils;

import com.domenic.exception.DaoNotSuccessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * @author Domenic
 * @Description
 * 提取 Service 层中的常用操作到此工具类
 * 在调用 operate 方法时需要传入要执行方法的类型
 *
 * 使用需注意：
 * - 本工具类是通过 操作类型 和 被操作的类的名称 拼接的方式，获取 mapper 代理接口中的方法的名称（如：update + Menu = updateMenu）
 * - mapper 代理接口中的方法的形参，需要是被操作的类
 *
 * 支持的功能：
 * - 添加创建、修改日期
 * - 执行结果检测，目前只支持 int 类型返回值
 * @Date 10/1/2022 2:04 AM
 */
public class ServiceOperationsUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger("ServiceOperationsUtil.class");

    // 该工具类支持的所有操作类型
    private static final String[] OperationTypes = {"save", "update"};

    // 待执行操作的对象的 class 对象
    private static Class<?> oClass = null;

    // 待执行操作的对象的类名
    private static String oName = null;

    /**
     * 执行方法，执行参数指定类型的操作
     * @param o 被执行操作的对象
     * @param mapper Mybatis 的 mapper 映射对象
     * @param operationType 操作类型，如 save、update
     * @return 是否成功
     */
    public static boolean operate(Object o, Object mapper, String operationType) {
        try {
            oClass = o.getClass();
            oName = oClass.getName();
            LOGGER.info("Start performing " + operationType + " operation for " + oName);
            boolean b;
            if (operationType.equalsIgnoreCase(OperationTypes[0])) {
                b = saveOperation(o, mapper);
            } else if (operationType.equalsIgnoreCase(OperationTypes[1])) {
                b = updateOperation(o, mapper);
            } else {
                LOGGER.error("Oops, the operation type (" + operationType.toLowerCase() + ") is not supported!");
                return false;
            }
            return b;
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error("Oops, Unexpected error happened in ServiceOperationsUtil while doing " + operationType);
            return false;
        }
    }

    /**
     * 执行 save 操作
     * @param o 被执行操作的对象
     * @param mapper Mybatis 的 mapper 映射对象
     * @return
     */
    public static boolean saveOperation(Object o, Object mapper) {
        Object obj = saveSetTimesUtil(o);
        try {
            String className = oName.substring(oName.lastIndexOf(".") + 1);
            LOGGER.info("Invoke method " + OperationTypes[0].concat(className) + " in " + className + "Mapper and check the result");
            // 执行 mapper 映射对象中的 save 方法
            return checkIfOperationSucceeded(
                    mapper.getClass().getMethod(OperationTypes[0].concat(className), o.getClass()).invoke(mapper, obj));
        } catch (Exception e) {
            LOGGER.error("Oops, " + e.getMessage() + "\nTrigger " + oName.substring(oName.lastIndexOf(".") + 1) + "Mapper for save method FAIL!");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 执行 update 操作
     * @param o 被执行操作的对象
     * @param mapper Mybatis 的 mapper 映射对象
     * @return
     */
    public static boolean updateOperation(Object o, Object mapper) {
        Object obj = updateSetTimesUtil(o);
        try {
            String className = oName.substring(oName.lastIndexOf(".") + 1);
            LOGGER.info("Invoke method " + OperationTypes[1].concat(className) + " in " + className + "Mapper and check the result");
            // 执行 mapper 映射对象中的 update 方法
            return checkIfOperationSucceeded(
                    mapper.getClass().getMethod(OperationTypes[1].concat(className), o.getClass()).invoke(mapper, obj));
        } catch (Exception e) {
            LOGGER.error("Oops, " + e.getMessage() + "\nTrigger " + oName.substring(oName.lastIndexOf(".") + 1) + "Mapper for update method FAIL!");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 为新建操作设置创建时间和修改时间
     * @param o 要新增的对象
     * @return 对象
     */
    public static Object saveSetTimesUtil(Object o) {
        try {
            // 设置时间
            LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Shanghai"));
            oClass.getMethod("setCreateTime", LocalDateTime.class).invoke(o, now);
            oClass.getMethod("setUpdateTime", LocalDateTime.class).invoke(o, now);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            LOGGER.error("Oops, " + e.getMessage() + "\nNoSuchMethodException, SetTimes for save operation FAIL!!");
        }
        return o;
    }

    /**
     * 为修改操作设置修改时间
     * @param o 要修改的对象
     * @return 对象
     */
    public static Object updateSetTimesUtil(Object o) {
        try {
            // 设置时间
            oClass.getMethod("setUpdateTime", LocalDateTime.class).invoke(o, LocalDateTime.now(ZoneId.of("Asia/Shanghai")));
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            LOGGER.error("Oops, " + e.getMessage() + "\nNoSuchMethodException, SetTimes for update operation FAIL!!");
        }
        return o;
    }

    /**
     * 检查操作是否成功
     * @param res Integer 类型的操作的结果
     * @return 成功与否
     */
    public static boolean checkIfOperationSucceeded(Object res) {
        LOGGER.info("Check the result, result = " + res);
        // res 是 int 类型的返回值，若是 0 则代表数据表没有任何改变
        if (res instanceof Integer && 0 == (Integer) res) {
            try {
                throw new DaoNotSuccessException("Operation Failed!");
            } catch (DaoNotSuccessException e) {
                e.printStackTrace();
                LOGGER.info("Oops, The result is invalid!");
                LOGGER.error("DaoNotSuccessException, result is 0, Operation Failed!");
                return false;
            }
        }
        LOGGER.info("The result is valid");
        return true;
    }

}
