package com.woime.iboss.work.constant;

import java.util.Objects;

/**
 * @author Chen Yujian on 2017/2/26 15:40.
 */
public enum WorkOrderType {

    HARDWARE(1, "硬件网络"),
    SOFTWARE(2, "软件"),
    BUSINESS(3, "业务");

    private Integer code;

    private String desc;

    WorkOrderType(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static WorkOrderType getByCode(Integer code) {
        for(WorkOrderType cs : WorkOrderType.values()) {
            if(Objects.equals(cs.getCode(), code)) {
                return cs;
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
