/**
 * 
 */
package com.sist.spring.portfolio.member;

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
import com.sist.spring.cmn.SearchVO;

/**
 * @author sist
 *
 */
@Repository
public class MemberDao implements Dao {
	//Logger
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	RowMapper<MemberVO> rowMapper = new RowMapper<MemberVO>() {

		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberVO outData=new MemberVO();
			outData.setMemberId(rs.getString("member_id"));
			outData.setPassword(rs.getString("password"));
			outData.setName(rs.getString("name"));
			outData.setEmail(rs.getString("email"));
			outData.setBirth(rs.getString("birth"));
			outData.setPhone(rs.getString("phone"));
			outData.setAuthority(rs.getString("authority"));
			outData.setInterestOption(rs.getString("interestOption"));
			outData.setOpen(rs.getString("open"));
			outData.setNum(rs.getInt("rnum"));
			outData.setTotalCnt(rs.getInt("total_cnt"));
			return outData;
		}

	};
	
	private final String NAMESPACE = "com.sist.spring.portfolio.member";
	//JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public MemberDao() {}
	
	public DTO doLogin(DTO dto) {
		MemberVO outVO = null;        //return UserVO
		MemberVO inVO  = (MemberVO) dto;//Param UserVO
		
		inVO.getMemberId();
		inVO.getPassword();

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		String statement = NAMESPACE+".doLogin";
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
	public int doInsert(DTO dto) {
		int flag = 0;
		MemberVO inVO = (MemberVO) dto;
		
		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
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
		MemberVO inVO = (MemberVO) dto;
		
		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

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
		MemberVO outVO = null;        //return UserVO
		MemberVO inVO  = (MemberVO) dto;//Param UserVO

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

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
		MemberVO inVO = (MemberVO) dto;
		StringBuilder  sb=new StringBuilder();
		sb.append(" DELETE FROM hr_member 		\n");
		sb.append(" WHERE member_id = ?        	\n");
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param="+inVO);
		
		Object[] args = {inVO.getMemberId()};
		flag = jdbcTemplate.update(sb.toString(), args);
		
		LOG.debug("=flag="+flag);		
		LOG.debug("==============================");	
		return flag;
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		SearchVO  inVO= (SearchVO) dto;
		//검색구분
		  //ID : 10
		  //이름: 20

		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");

		// namespace+id = com.sist.ehr.user.doInsert
		String statement = NAMESPACE+".doRetrieve";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");

		List<MemberVO> list = this.sqlSessionTemplate.selectList(statement, inVO);

		//hLevel -> Level전환
		List<MemberVO> outList=new ArrayList<MemberVO>();
		for(MemberVO vo: list) {
			outList.add(vo);
			LOG.debug("3=vo="+vo);

		}

		LOG.debug("3==============================");
		LOG.debug("3=outList="+outList);
		LOG.debug("3==============================");

		return outList;
	}

	
	
}
