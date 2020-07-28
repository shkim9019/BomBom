package com.sist.spring.portfolio.skill;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//import org.mybatis.spring.SqlSessionTemplate;
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

@Repository
public class SkillDaoImple implements Dao {
	// Logger
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	private final String NAMESPACE= "com.sist.spring.portfolio";

	// JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SkillDaoImple() {
	}

	@Override
	public int doInsert(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;

		StringBuilder sb = new StringBuilder();
		sb.append(" INSERT INTO skill (  \n");
		sb.append("     s_name,          \n");
		sb.append("     member_id,       \n");
		sb.append("     s_marstery,      \n");
		sb.append("     s_content        \n");
		sb.append(" ) VALUES (           \n");
		sb.append("     ?,             \n");
		sb.append("     ?,             \n");
		sb.append("     ?,             \n");
		sb.append("     ?              \n");
		sb.append(" )                   \n");

		// Query수행
		LOG.debug("==============================");
		LOG.debug("=Query=\n" + sb.toString());
		LOG.debug("=Param=\n" + inVO.toString());
		Object[] args = { inVO.getsName()
						, inVO.getMemberId()
						, inVO.getsMarstery()
						, inVO.getsContent() 
						};
		flag = this.jdbcTemplate.update(sb.toString(), args);

		LOG.debug("==============================");

		return flag;
	}

	@Override
	public int doUpdate(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;
		StringBuilder sb=new StringBuilder();
		sb.append( " UPDATE skill             \n");
		sb.append( " SET                      \n");
		sb.append( "     s_marstery = ?      \n");
		sb.append( "     , s_content = ?      \n");
		sb.append( " WHERE                    \n");
		sb.append( "     s_name = ?           \n");
		sb.append( "     AND member_id = ?    \n");
		
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param= "+inVO.toString());
		Object[] args= {
				       inVO.getsMarstery()
				      ,inVO.getsContent()
				      ,inVO.getsName()
				      ,inVO.getMemberId()};
		flag = this.jdbcTemplate.update(sb.toString(), args);
		LOG.debug("=flag= "+flag);
		LOG.debug("==============================");
		return flag;
		
		
	}

	@Override
	public DTO doSelectOne(DTO dto) {

		SkillVO outVO = null; // return UserVO
		SkillVO inVO = (SkillVO) dto; // Param UserVO

		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT               \n");
		sb.append("     s_name,          \n");
		sb.append("     member_id,       \n");
		sb.append("     s_marstery,      \n");
		sb.append("     s_content,        \n");
		sb.append("     1 rnum,       \n"); 
		sb.append("     1 total_cnt   \n");
		sb.append(" FROM                 \n");
		sb.append("     skill            \n");
		sb.append(" WHERE  member_id  = ?   \n");
		sb.append(" AND    s_name = ? \n");

		// Query수행
		LOG.debug("==============================");
		LOG.debug("=Query=\n" + sb.toString());
		LOG.debug("=Param=\n" + inVO.getMemberId());


		return outVO;

	}

	@Override
	public int doDelete(DTO dto) {
		int flag = 0;
		SkillVO inVO = (SkillVO) dto;
		StringBuilder  sb=new StringBuilder();
		sb.append(" DELETE FROM skill 			\n");
		sb.append(" WHERE member_id = ?         \n");
		sb.append(" AND    s_name = ? 			\n");
		
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param="+inVO);
		LOG.debug("==============================");
		
		Object[] args = {inVO.getMemberId(), inVO.getsName()};
		flag = jdbcTemplate.update(sb.toString(), args);
		

		LOG.debug("==============================");
		LOG.debug("=flag="+flag);		
		LOG.debug("==============================");	
		
		return flag;
	}
	
	public int doDeleteAll( ) {
		
		LOG.debug("1==============================");
		LOG.debug("1=doDeleteAll");
		LOG.debug("1==============================");
		
		int flag = 0;
	
		StringBuilder  sb=new StringBuilder();
		sb.append(" DELETE FROM skill 			\n");
		
		LOG.debug("==============================");
		LOG.debug("=2.Query=\n"+sb.toString());
		
		
		
		flag = jdbcTemplate.update(sb.toString());
		

		LOG.debug("3==============================");
		LOG.debug("3=flag="+flag);		
		LOG.debug("3==============================");	
		return flag;
		
	}

	
	public List<?> doRetrieve(DTO dto) {
//		SkillVO inVO=(SkillVO)dto;
//		
//		LOG.debug("1==============================");
//		LOG.debug("1=inVO="+inVO);
//		LOG.debug("1==============================");
//		
//		// namespace+id = com.sist.ehr.board.doInsert 
//		String statement = NAMESPACE+".doRetrieve";
//		
//		LOG.debug("2==============================");
//		LOG.debug("2=statement="+statement);
//		LOG.debug("2==============================");	
//		
//		List<SkillVO> outList = this.sqlSessionTemplate.selectList(statement, inVO);
//		LOG.debug("3==============================");
//		LOG.debug("3=outList="+outList);
//		LOG.debug("3==============================");			
//		
//		return outList;
		return null;
	}

}
