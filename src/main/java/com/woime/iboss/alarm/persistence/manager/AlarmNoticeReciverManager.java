package com.woime.iboss.alarm.persistence.manager;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmNoticeReciver;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmNoticeReciverManager extends HibernateEntityDao<AlarmNoticeReciver>
{
    public void deleteAlarmNoticeReciverByConfig(long configId){
        this.removeAll(this.findBy("configId", configId));
    }

    public List<AlarmNoticeReciver> findByConfigIdAndType(long configId, String type){
        return this.createCriteria(Restrictions.eq("configId", configId), Restrictions.eq("type", type)).list();
    }
}
