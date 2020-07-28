package com.sist.spring.portfolio.member.file;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Service;

@org.springframework.stereotype.Service
public class FileMemberService  implements Service {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public FileMemberService() {
	}
	
	@Autowired
	FileMemberDao fmdao;
	
	@Override
	public int doInsert(DTO dto) {
		LOG.debug("==========================================");
		LOG.debug("PjtFileService - doInsert");
		LOG.debug("==========================================");
		return this.fmdao.doInsert(dto);
	}

	@Override
	public int doUpdate(DTO dto) {
		return this.fmdao.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		
		LOG.debug("==========================");
		LOG.debug("FileMemberService/doSelectOne");
		LOG.debug("==========================");
		return this.fmdao.doSelectOne(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return this.fmdao.doDelete(dto);
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		LOG.debug("==========================");
		LOG.debug("ProjectService/doRetrieve");
		LOG.debug("==========================");
		return this.fmdao.doRetrieve(dto);

	}

}
