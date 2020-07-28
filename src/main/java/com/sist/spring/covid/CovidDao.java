package com.sist.spring.covid;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Dao;


@Repository
public class CovidDao implements Dao {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public CovidDao() {}
	
	private final String NAMESPACE = "com.sist.spring.covid";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public DTO doSelectOneUser(DTO dto) {
		
		CovidUserVO inVO = (CovidUserVO) dto;
		
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doSelectOneUser";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		CovidUserVO outVO = this.sqlSessionTemplate.selectOne(statement,inVO);
		LOG.debug("3======================");
		LOG.debug("3=outVO=" + outVO);
		LOG.debug("3======================");
		
		return outVO;
	}
	
	/**
	 * Covid User 회원등록
	 */
	@Override
	public int doInsert(DTO dto) {
		CovidUserVO inVO =(CovidUserVO) dto;
		
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doInsert";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		int flag = this.sqlSessionTemplate.insert(statement,inVO);
		LOG.debug("3======================");
		LOG.debug("3=flag=" + flag);
		LOG.debug("3======================");
		
		return flag;
	}
	
	/**
	 * 개인의 관심약국 등록 등록(회원가입 후 가능)
	 * @param dto
	 * @return
	 */
	public int doRxInsert(DTO dto) {
		RxJoinVO inVO = (RxJoinVO) dto;
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doRxInsert";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		int flag = this.sqlSessionTemplate.insert(statement,inVO);
		
		LOG.debug("3======================");
		LOG.debug("3=flag=" + flag);
		LOG.debug("3======================");
		
		return flag;
	}

	
	/**
	 * 개인 관심약국 수정(다른 약국 클릭시 팝업뜬 후 Update 수행)
	 */
	@Override
	public int doUpdate(DTO dto) {
		int flag = 0;
//		CovidParmVO inVO = (CovidParmVO) dto;
//		StringBuilder sb = new StringBuilder();
//		sb.append("UPDATE pharmacy		  \n");
//		sb.append("SET 		        	  \n");
//		sb.append("    p_name = ?,  	  \n");
//		sb.append("    p_addr = ?,  	  \n");
//		sb.append("    p_lng = ?,   	  \n");
//		sb.append("    p_lat = ?    	  \n");
//		sb.append("WHERE            	  \n");
//		sb.append("    member_id = ?	  \n");
//		sb.append("AND p_code = ?    	  \n");
//		
//		LOG.debug("=====================");
//		LOG.debug("Query:" + sb.toString());
//		LOG.debug("Param:" + inVO.toString());
//		LOG.debug("=====================");
//		
//		Object[] args = { inVO.getpName(),
//						inVO.getpAddr(),
//						inVO.getpLng(),
//						inVO.getpLat(),
//						inVO.getMemberId(),
//						inVO.getpCode()
//		};
//		flag = jdbcTemplate.update(sb.toString(), args);
//		
		return flag;
	}
	
	/**
	 * 개인 관심약국 조회(email정보 필요하므로 join 필요)
	 */
	@Override
	public DTO doSelectOne(DTO dto) {
		RxJoinVO inVO = (RxJoinVO) dto;
		
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doSelectOne";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		RxJoinVO outVO = this.sqlSessionTemplate.selectOne(statement,inVO);
		LOG.debug("3======================");
		LOG.debug("3=outVO=" + outVO);
		LOG.debug("3======================");
		
		return outVO;
	}
	
	/**
	 * 관심약국 여러개 선택 시 리스트 출력 - 나중에 사용할 가능성 있음(보류?)
	 */
	@Override
	public List<?> doRetrieve(DTO dto) {
		RxJoinVO inVO = (RxJoinVO) dto;
		
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doRetrieve";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		List<RxJoinVO> list = this.sqlSessionTemplate.selectList(statement,inVO);
		
		LOG.debug("3======================");
		LOG.debug("3=list=" + list);
		LOG.debug("3======================");
		
		return list;
	}
	
	@Override
	public int doDelete(DTO dto) {
		CovidParmVO inVO = (CovidParmVO) dto;
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doDelete";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		int flag = this.sqlSessionTemplate.delete(statement,inVO);
		LOG.debug("3======================");
		LOG.debug("3=flag=" + flag);
		LOG.debug("3======================");
		
		return flag;
	}
	
	public int doDeleteUser(DTO dto) {
		CovidUserVO inVO = (CovidUserVO) dto;
		LOG.debug("1======================");
		LOG.debug("1=inVO=" + inVO);
		LOG.debug("1======================");
		
		
		String statement = NAMESPACE + ".doDeleteUser";
		LOG.debug("2======================");
		LOG.debug("2=statement=" + statement);
		LOG.debug("2======================");
				
		int flag = this.sqlSessionTemplate.delete(statement,inVO);
		LOG.debug("3======================");
		LOG.debug("3=flag=" + flag);
		LOG.debug("3======================");
		
		return flag;
	}

}
