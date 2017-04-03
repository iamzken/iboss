package com.woime.iboss.gather.persistence.domain;

import java.util.List;
import java.util.Map;

/**
 * @author Chen Yujian on 2017/2/16 11:31.
 */
public class GatherResultQueryModel {

    private Long targetId;
    private List<Map<String, String>> conditions;
    private List<Map<String, String>> sorts;

    public Long getTargetId() {
        return targetId;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    public List<Map<String, String>> getConditions() {
        return conditions;
    }

    public void setConditions(List<Map<String, String>> conditions) {
        this.conditions = conditions;
    }

    public List<Map<String, String>> getSorts() {
        return sorts;
    }

    public void setSorts(List<Map<String, String>> sorts) {
        this.sorts = sorts;
    }
}
