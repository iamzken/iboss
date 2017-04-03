package com.woime.iboss.work.constant;

import java.util.Objects;

/**
 * @author Chen Yujian on 2017/2/26 15:40.
 */
public enum WorkOrderStatus {
    DRAFT(0, "草稿"),
    AUDITING(1, "审核中"),
    PASSED(2, "通过审核"),
    CANCELED(3, "已撤销"),
    EXECUTING(4, "执行中"),
    COMPLETED(5, "已完成");

    private Integer code;

    private String desc;

    WorkOrderStatus(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static WorkOrderStatus getByCode(Integer code) {
        for(WorkOrderStatus cs : WorkOrderStatus.values()) {
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
