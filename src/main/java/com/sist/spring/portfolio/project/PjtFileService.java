package com.sist.spring.portfolio.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Service;

@org.springframework.stereotype.Service
public class PjtFileService implements Service {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public PjtFileService() {
	}
	
	@Autowired
	PjtFileDao pjtFileDao;
	
	
	@Override
	public int doInsert(DTO dto) {
		LOG.debug("==========================================");
		LOG.debug("PjtFileService - doInsert");
		LOG.debug("==========================================");
		return this.pjtFileDao.doInsert(dto);
	}

	@Override
	public int doUpdate(DTO dto) {
		return this.pjtFileDao.doUpdate(dto);
	}
	
	public DTO doSearchVideo(DTO dto) {
		return this.pjtFileDao.doSearchVideo(dto);
	}
	
	@Override
	public DTO doSelectOne(DTO dto) {
		return this.pjtFileDao.doSelectOne(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return this.pjtFileDao.doDelete(dto);
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		LOG.debug("==========================");
		LOG.debug("ProjectService/doRetrieve");
		LOG.debug("==========================");
		return this.pjtFileDao.doRetrieve(dto);

	}

}
