package com.woime.iboss.user.persistence.manager;

import com.woime.iboss.user.persistence.domain.PersonInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.user.persistence.domain.AccountInfo;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountInfoManager extends HibernateEntityDao<AccountInfo> {

    @Autowired
    private PersonInfoManager personInfoManager;

    @Transactional(readOnly = false)
    public void save(AccountInfo entity) {
        super.save(entity);
        PersonInfo pi = entity.getInfo();
        pi.setId(entity.getId());
        personInfoManager.save(pi);
    }
}
