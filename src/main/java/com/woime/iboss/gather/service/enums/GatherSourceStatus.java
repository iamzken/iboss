package com.woime.iboss.gather.service.enums;

import java.util.Objects;

/**
 * 采集源状态
 * Created by Chen Yujian on 2015/11/27 17:50.
 */
public enum GatherSourceStatus {
    DISABLED(0, "停用"),
    ENABLED(1, "启用");

    private Integer code;

    private String desc;

    GatherSourceStatus(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static GatherSourceStatus getByCode(Integer code) {
        for(GatherSourceStatus cs : GatherSourceStatus.values()) {
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
