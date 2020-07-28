package com.sist.spring.portfolio.comment;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Service;

@org.springframework.stereotype.Service
public class CommentService implements Service {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public CommentService() {
	}
	
	@Autowired
	CommentDao cmtDao;
	
	
	@Override
	public int doInsert(DTO dto) {
		return this.cmtDao.doInsert(dto);
	}

	@Override
	public int doUpdate(DTO dto) {
		return this.cmtDao.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		return this.cmtDao.doSelectOne(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return this.cmtDao.doDelete(dto);
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		return this.cmtDao.doRetrieve(dto);

	}

}
