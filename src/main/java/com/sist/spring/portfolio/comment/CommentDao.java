package com.sist.spring.portfolio.comment;

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
@Repository
public class CommentDao implements Dao {
	
private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	private final String NAMESPACE= "com.sist.spring.portfolio.comment";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	
	public CommentDao() {}
	
	
	RowMapper<CommentVO> rowMapper = new RowMapper<CommentVO>() {

		@Override
		public CommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentVO outData = new CommentVO();
			outData.setcNo(rs.getInt("c_No"));
			outData.setcContent(rs.getString("c_Cont"));
			outData.setRegDt(rs.getString("reg_Dt"));
			outData.setModDt(rs.getString("mod_Dt"));
			outData.setRegId(rs.getString("reg_Id"));
			outData.setPortfolioId(rs.getString("portfolio_Id"));
			
			return outData;
		}
	};

	@Override
	public int doInsert(DTO dto) {
		int flag = 0;
		CommentVO inVO = (CommentVO)dto;

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
		int flag=0;
		CommentVO inVO=(CommentVO)dto;
		StringBuilder sb=new StringBuilder();
		
		
		sb.append("UPDATE COMMENTS       ");
		sb.append("SET                  ");
		sb.append("    reg_dt =  TO_DATE(SYSDATE, 'YYYY/MM/DD')    ");
		sb.append("    ,c_cont = ?   ");
		
		sb.append("WHERE                ");
		sb.append("    c_no = ?     ");
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param= "+inVO.toString());
		
		
		Object[] args= {inVO.getcContent()
						,inVO.getcNo()
						
					};
		flag=this.jdbcTemplate.update(sb.toString(),args);
		LOG.debug("==============================");
		LOG.debug("=flag: "+flag);
		LOG.debug("==============================");
		
		return flag;
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		CommentVO inVO = (CommentVO)dto;
		CommentVO outVO = new CommentVO();
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT               ");
		sb.append("		     c_no,      \n");
		sb.append("		     c_cont,     \n");
		sb.append("		     reg_dt,     \n");
		sb.append("		     mod_dt,     \n");
		sb.append("		     reg_id,     \n");
		sb.append("		     portfolio_Id     \n");
		sb.append("FROM                 ");
		sb.append("    Comments          ");
		sb.append("WHERE                ");
		sb.append("    portfolio_Id=?          ");
		sb.append("AND 	reg_id=?          ");
		
		
		Object args[] = {
						  inVO.getPortfolioId(),
						  inVO.getRegId()
						};
		
		outVO = this.jdbcTemplate.queryForObject(sb.toString(),
												 args,
												 rowMapper);
		LOG.debug("======================================");
		LOG.debug("===========doSelectOne===========");
		LOG.debug("QEURY =\n"+sb.toString());
		LOG.debug("Param ="+inVO.getcNo());
		LOG.debug("outVO ="+outVO);
		LOG.debug("======================================");
		return outVO;
	}

	@Override
	public int doDelete(DTO dto) {
		int flag=0;
		CommentVO inVO=(CommentVO) dto;
		
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

	@Override
	public List<?> doRetrieve(DTO dto) {
		CommentVO  inVO= (CommentVO) dto;

		  LOG.debug("1==============================");
	      LOG.debug("1=inVO="+inVO);
	      LOG.debug("1==============================");
	      
	      // namespace+id = com.sist.spring.portfolio.license.doInsert 
	      String statement = NAMESPACE+".doRetrieve";
	      LOG.debug("2==============================");
	      LOG.debug("2=statement="+statement);
	      LOG.debug("2==============================");   
	     //param set
		List<CommentVO> retlist = this.sqlSessionTemplate.selectList(statement, inVO);
		LOG.debug("==================================");
		LOG.debug("============doRetrieve============");
		LOG.debug("result: "+retlist);
		LOG.debug("==================================");
		return retlist;
	
	}


}
