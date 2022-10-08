package com.domenic.exception;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/24/2022 7:06 PM
 */
public class DaoNotSuccessException extends Exception {

    public DaoNotSuccessException() {}

    public DaoNotSuccessException(String message) {
        super(message);
    }
}
