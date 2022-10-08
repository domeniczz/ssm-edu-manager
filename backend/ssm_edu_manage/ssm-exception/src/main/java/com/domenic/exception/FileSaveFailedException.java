package com.domenic.exception;

/**
 * @author Domenic
 * @Description TODO
 * @Date 9/27/2022 7:18 PM
 */
public class FileSaveFailedException extends Exception {

    public FileSaveFailedException() {}

    public FileSaveFailedException(String message) {
        super(message);
    }
}
