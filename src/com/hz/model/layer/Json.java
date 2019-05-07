package com.hz.model.layer;

/**
 * JSON模型
 * <p>
 * 用户后台向前台返回的JSON对象
 */
@SuppressWarnings("serial")
public class Json implements java.io.Serializable {

    private boolean success = false;

    private String msg = "";

    private Object obj = null;

    private Object object = null;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}