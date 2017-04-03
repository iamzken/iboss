package com.woime.iboss.gather.service.enums;

import java.util.Map;
import java.util.Objects;

import com.google.common.collect.Maps;

/**
 * @author Chen Yujian on 2017/2/7 17:29.
 */
public enum DBType {

    MYSQL(1, "MYSQL"),
    SQLSERVER(2, "SQLSERVER"),
    ORACLE(3, "ORACLE");

    private Integer code;

    private String desc;

    DBType(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static DBType getByCode(Integer code) {
        for(DBType type : DBType.values()) {
            if(Objects.equals(type.getCode(), code)) {
                return type;
            }
        }
        return null;
    }

    public static Map<Integer, String> map(){
        Map<Integer, String> map = Maps.newLinkedHashMap();
//        for(DBType type : DBType.values()) {
//            map.put(type.getCode(), type.getDesc());
//        }
        map.put(3, "ORACLE");
        return map ;
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
