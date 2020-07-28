package com.sist.spring.portfolio.license;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.spring.cmn.DTO;

@Service
public class LicenseService implements com.sist.spring.cmn.Service{

	@Autowired
	private LicenseDao licenseDao;

	public LicenseService() {}
	
	@Override
	public int doInsert(DTO dto) {
		return licenseDao.doInsert(dto);
	}

	@Override
	public int doUpdate(DTO dto) {
		return licenseDao.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		return licenseDao.doSelectOne(dto);
	}
	public DTO doSelectOneLic(DTO dto) {
		return licenseDao.doSelectOneLic(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return licenseDao.doDelete(dto);
	}

	//자격증 개별 삭제
	public int doDeleteLicense(DTO dto) {
		return licenseDao.doDeleteLicense(dto);
	}
	
	@Override
	public List<?> doRetrieve(DTO dto) {
		return licenseDao.doRetrieve(dto);
	}

}
