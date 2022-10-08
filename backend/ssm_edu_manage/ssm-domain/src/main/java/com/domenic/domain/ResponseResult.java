package com.domenic.domain;

/**
 * @author Domenic
 * @Description 响应信息的封装实体类
 * @Date 9/22/2022 9:50 PM
 */
public class ResponseResult {
    private Boolean success;
    private Integer state;
    private String message;
    private Object content;

    public ResponseResult() {
    }

    public ResponseResult(Boolean success, Integer state, String message, Object content) {
        this.success = success;
        this.state = state;
        this.message = message;
        this.content = content;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ResponseResult{" +
                "success=" + success +
                ", state=" + state +
                ", message='" + message + '\'' +
                ", content=" + content +
                '}';
    }
}
