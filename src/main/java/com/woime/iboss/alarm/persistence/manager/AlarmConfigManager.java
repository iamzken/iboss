package com.woime.iboss.alarm.persistence.manager;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmConfig;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmConfigManager extends HibernateEntityDao<AlarmConfig> {

    public List<AlarmConfig> queryAlarmConfigsByNeIdAndName(Long neId, String name) {
        return this.createCriteria(Restrictions.eq("neId", neId), Restrictions.like("name", name)).list();
    }

    public List<AlarmConfig> queryAlarmConfigsByName(String name) {
        return this.createCriteria(Restrictions.like("name", name)).list();
    }

    public List<AlarmConfig> queryAlarmConfigsByNeId(Long neId) {
        return this.createCriteria(Restrictions.eq("neId", neId)).list();
    }

}
