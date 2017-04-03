package com.woime.iboss.pim.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.pim.persistence.domain.PimNote;

@Service
public class PimNoteManager extends HibernateEntityDao<PimNote>
{
}
