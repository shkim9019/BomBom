package com.sist.spring.portfolio.member.file;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Dao;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.project.PjtFileVO;

@Repository
public class FileMemberDao implements Dao {

	private final Logger LOG=LoggerFactory.getLogger(FileMemberDao.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<FileMemberVO> rowMapper = new RowMapper<FileMemberVO>() {

		public FileMemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			FileMemberVO outData=new FileMemberVO();
			outData.setMemberId(rs.getString("member_id"));
			outData.setExt(rs.getString("ext"));
			outData.setFileSize(rs.getLong("file_size"));
			outData.setOrgNm(rs.getString("org_nm"));
			outData.setSaveNm(rs.getString("save_nm"));
			
//			if(rs.getInt("rnum")==0) {
//				outData.setNum(1);
//			}else {
//				outData.setNum(rs.getInt("rnum"));
//			}
//			outData.setTotalCnt(rs.getInt("total_cnt"));
			return outData;
		}

	};
	
	
	@Override
	public DTO doSelectOne(DTO dto) {
				
		FileMemberVO inVO=(FileMemberVO)dto;
		FileMemberVO outVO=new FileMemberVO();
		StringBuilder sb=new StringBuilder();
		LOG.debug("==========================");
		LOG.debug("FileMemberService/doSelectOne");
		LOG.debug("FileMemberVO/param/ID: "+inVO.getMemberId());
		LOG.debug("==========================");
		
		sb.append("SELECT               \n");
		sb.append("    save_nm,        \n");
		sb.append("    org_nm,          \n");
		sb.append("    file_size,       \n");
		sb.append("    ext,             \n");
		sb.append("    member_id        \n");
		sb.append("FROM                 \n");
		sb.append("    file_member     \n");
		sb.append("WHERE                \n");
		sb.append("	member_id=?		\n");
		
		Object args[]= {
					inVO.getMemberId()
						};
		outVO=this.jdbcTemplate.queryForObject(sb.toString()
										, args
										, rowMapper);
		LOG.debug("=outVO=\n"+outVO);
		LOG.debug("==============================");
		return outVO;
	}


	@Override
	public int doInsert(DTO dto) {
		StringBuilder sb=new StringBuilder();
		int flag=0;
		FileMemberVO inVO=(FileMemberVO)dto;
		sb.append("INSERT INTO file_member (        \n");
		sb.append("    save_nm,                     \n");
		sb.append("    org_nm,                      \n");
		sb.append("    file_size,                   \n");
		sb.append("    ext,                         \n");
		sb.append("    member_id                    \n");
		sb.append(") VALUES (                       \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?                            \n");
		sb.append(")								\n");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param=\n"+inVO.toString());
		Object[] args= {inVO.getSaveNm()
						,inVO.getOrgNm()
						,inVO.getFileSize()
						,inVO.getExt()
						,inVO.getMemberId()
						};
		
		flag=this.jdbcTemplate.update(sb.toString(),args);
		LOG.debug("==============================");
		LOG.debug("=flag: "+flag);
		LOG.debug("==============================");
		
		return flag;
	}


	@Override
	public int doUpdate(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}


	


	@Override
	public int doDelete(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<?> doRetrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
