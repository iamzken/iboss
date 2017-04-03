package com.woime.iboss.work.constant;

import java.util.Objects;

/**
 * @author Chen Yujian on 2017/2/26 15:40.
 */
public enum WorkOrderSystem {

    SYSTEM_CONTROL_MANAGEMENT(1, "总控管理系统");

    private Integer code;

    private String desc;

    WorkOrderSystem(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static WorkOrderSystem getByCode(Integer code) {
        for(WorkOrderSystem cs : WorkOrderSystem.values()) {
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
