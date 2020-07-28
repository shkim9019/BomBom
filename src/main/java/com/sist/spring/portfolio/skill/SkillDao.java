package com.sist.spring.portfolio.skill;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Dao;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.project.ProjectVO;

@Repository("dao")
public class SkillDao implements Dao {
	// Logger
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE= "com.sist.spring.portfolio.skill";

	// JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SkillDao() {
	}

	@Override
	public int doInsert(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

		// namespace+id = com.sist.ehr.user.doInsert
		String statement = NAMESPACE+".doInsert";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");

		flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("3==============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");

		return flag;
	}

	@Override
	public int doUpdate(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

		// namespace+id = com.sist.ehr.user.doInsert
		String statement = NAMESPACE+".doUpdate";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");

		flag = this.sqlSessionTemplate.update(statement, inVO);
		LOG.debug("3==============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");

		return flag;
	}

	@Override
	public DTO doSelectOne(DTO dto) {

		SkillVO outVO = null; // return UserVO
		SkillVO inVO = (SkillVO) dto; // Param UserVO
		
		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

		// namespace+id = com.sist.ehr.user.doInsert
		String statement = NAMESPACE+".doSelectOne";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");

		outVO = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("3==============================");
		LOG.debug("3=outVO="+outVO);
		LOG.debug("3==============================");

		return outVO;
		
	}

	@Override
	public int doDelete(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

		// namespace+id = com.sist.ehr.user.doInsert
		String statement = NAMESPACE+".doDelete";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");

		flag = this.sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("3==============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");

		return flag;
	}
	
	
	public List<?> doRetrieve(DTO dto) {
		SkillVO inVO=(SkillVO)dto;
		
		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.sist.ehr.board.doInsert 
		String statement = NAMESPACE+".doRetrieve";
		
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		List<SkillVO> outList = this.sqlSessionTemplate.selectList(statement, inVO);
		LOG.debug("3==============================");
		LOG.debug("3=outList="+outList);
		LOG.debug("3==============================");			
		
		return outList;
	}

}
