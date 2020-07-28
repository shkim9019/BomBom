package com.sist.spring.portfolio.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Service;

@org.springframework.stereotype.Service
public class ProjectService implements Service {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public ProjectService() {
	}
	
	@Autowired
	ProjectDao pjtDao;
	
	
	@Override
	public int doInsert(DTO dto) {
		return this.pjtDao.doInsert(dto);
	}

	@Override
	public int doUpdate(DTO dto) {
		return this.pjtDao.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		return this.pjtDao.doSelectOne(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return this.pjtDao.doDelete(dto);
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		LOG.debug("==========================");
		LOG.debug("ProjectService/doRetrieve");
		LOG.debug("==========================");
		return this.pjtDao.doRetrieve(dto);

	}
	
	public int springInsert(DTO dto) {
		return this.pjtDao.springInsert(dto);
	}

}
