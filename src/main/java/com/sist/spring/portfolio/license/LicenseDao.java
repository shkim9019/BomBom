package com.sist.spring.portfolio.license;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Dao;

@Repository
public class LicenseDao implements Dao {
   
private final Logger LOG = LoggerFactory.getLogger(this.getClass());
   
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   private final String NAMESPACE= "com.sist.spring.portfolio.license";
   

   @Override
   public int doInsert(DTO dto) {
      
      LicenseVO inVO = (LicenseVO)dto;
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      // namespace+id = com.sist.spring.portfolio.license.doInsert 
      String statement = NAMESPACE+".doInsert";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");   
      
      int  flag = this.sqlSessionTemplate.insert(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=flag="+flag);
      LOG.debug("3==============================");         
      
      return flag;
   }

   @Override
   public int doUpdate(DTO dto) {
      LicenseVO inVO = (LicenseVO) dto;
      
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      
      // namespace+id = com.sist.spring.portfolio.license.doUpdate 
      String statement = NAMESPACE+".doUpdate";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");   
      
      int  flag = this.sqlSessionTemplate.update(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=flag="+flag);
      LOG.debug("3==============================");         
      
      
      return flag;
   }
   

   @Override
   public DTO doSelectOne(DTO dto) {
      LicenseVO inVO = (LicenseVO)dto;
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      // namespace+id = com.sist.spring.portfolio.license.doSelectOne 
      String statement = NAMESPACE+".doSelectOne";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");   
      
      LicenseVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=outVO="+outVO);
      LOG.debug("3==============================");         
      
      return outVO;
      
   }

   public DTO doSelectOneLic(DTO dto) {
	      LicenseVO inVO = (LicenseVO)dto;
	      LOG.debug("1==============================");
	      LOG.debug("1=inVO="+inVO);
	      LOG.debug("1==============================");
	      
	      // namespace+id = com.sist.spring.portfolio.license.doSelectOneLic 
	      String statement = NAMESPACE+".doSelectOneLic";
	      LOG.debug("2==============================");
	      LOG.debug("2=statement="+statement);
	      LOG.debug("2==============================");   
	      
	      LicenseVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
	      LOG.debug("3==============================");
	      LOG.debug("3=outVO="+outVO);
	      LOG.debug("3==============================");         
	      
	      return outVO;
	      
	   }
   
   //회원 탈퇴시
   @Override
   public int doDelete(DTO dto) {
      
      LicenseVO inVO=(LicenseVO) dto;
      
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      // namespace+id = com.sist.spring.portfolio.license.doDelete 
      String statement = NAMESPACE+".doDeleteAll";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");   
      
      int  flag = this.sqlSessionTemplate.delete(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=flag="+flag);
      LOG.debug("3==============================");         
            
      return flag;
   }
   
   //단순 자격내용 삭제
   public int doDeleteLicense(DTO dto) {
      
      LicenseVO inVO=(LicenseVO) dto;
      
      
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      // namespace+id = com.sist.spring.portfolio.license.doDeleteLicense 
      String statement = NAMESPACE+".doDeleteLicense";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");
      
      int  flag = this.sqlSessionTemplate.delete(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=flag="+flag);
      LOG.debug("3==============================");         
            
      return flag;
      
   }
   
   @Override
   public List<?> doRetrieve(DTO dto) {
      //member_id로만 조회
      LicenseVO  inVO= (LicenseVO) dto;
      
      LOG.debug("1==============================");
      LOG.debug("1=inVO="+inVO);
      LOG.debug("1==============================");
      
      // namespace+id = com.sist.spring.portfolio.license.doRetrieve 
      String statement = NAMESPACE+".doRetrieve";
      LOG.debug("2==============================");
      LOG.debug("2=statement="+statement);
      LOG.debug("2==============================");   
      
      List<LicenseVO> licList = this.sqlSessionTemplate.selectList(statement, inVO);
      LOG.debug("3==============================");
      LOG.debug("3=licList="+licList);
      LOG.debug("3==============================");         
      
      
      return licList;
   }
}