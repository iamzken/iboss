package com.woime.iboss.work.constant;

import java.util.Objects;

/**
 * @author Chen Yujian on 2017/2/26 15:40.
 */
public enum WorkOrderPriority {

    BUG(1, "一般"),
    DATA_PROCESS(2, "中"),
    NE_ALARM(3, "高");

    private Integer code;

    private String desc;

    WorkOrderPriority(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static WorkOrderPriority getByCode(Integer code) {
        for(WorkOrderPriority cs : WorkOrderPriority.values()) {
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
