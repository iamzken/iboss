package com.woime.iboss.work.constant;

import java.util.Objects;

/**
 * @author Chen Yujian on 2017/2/26 15:40.
 */
public enum WorkOrderSource {

    BUG(1, "运维告警"),
    DATA_PROCESS(2, "监控告警"),
    NE_ALARM(3, "客服"),
    CUSTOM_SERVICE(4, "投诉");

    private Integer code;

    private String desc;

    WorkOrderSource(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static WorkOrderSource getByCode(Integer code) {
        for(WorkOrderSource cs : WorkOrderSource.values()) {
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
