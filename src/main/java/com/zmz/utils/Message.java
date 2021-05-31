package com.zmz.utils;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 朱铭泽
 */
public class Message {
    private int code;
    private String msg;
    private Map<String,Object> extend=new HashMap<String, Object>();
    public static Message sucess(){
        Message message = new Message();
        message.setMsg("处理成功");
        message.setCode(100);
        return message;
    }
    public static Message fail(){
        Message message = new Message();
        message.setMsg("处理失败");
        message.setCode(200);
        return message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Message add(String pageinfo, PageInfo page) {
        this.getExtend().put(pageinfo,page);
        return this;
    }
}
