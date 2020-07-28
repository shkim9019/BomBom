package com.sist.spring.portfolio.project;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

@Repository
public class PjtFileDao implements Dao {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//주입을 위한 Default 생성자
	public PjtFileDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	RowMapper<PjtFileVO> rowMapper = new RowMapper<PjtFileVO>() {

		public PjtFileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			PjtFileVO outData=new PjtFileVO();
			outData.setDivFile(rs.getInt("div_file"));
			outData.setMemberId(rs.getString("member_id"));
			outData.setExt(rs.getString("ext"));
			outData.setFileSize(rs.getLong("file_size"));
			outData.setGitAddress(rs.getString("git_address"));
			outData.setOrgNm(rs.getString("org_nm"));
			outData.setSavePNm(rs.getString("save_pnm"));
			
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
	public int doInsert(DTO dto) {
		LOG.debug("==========================================");
		LOG.debug("PjtFileDao - doInsert");
		LOG.debug("==========================================");

		int flag=0;
		PjtFileVO inVO=(PjtFileVO)dto;
		StringBuilder sb=new StringBuilder();
		sb.append("INSERT INTO file_project (       \n");
		sb.append("    save_pnm,                    \n");
		sb.append("    org_nm,                      \n");
		sb.append("    file_size,                   \n");
		sb.append("    ext,                         \n");
		sb.append("    div_file,                    \n");
		sb.append("    git_address,                  \n");
		sb.append("    member_id                    \n");
		sb.append(") VALUES (                       \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?,                           \n");
		sb.append("    ?                            \n");
		sb.append(")								\n");	
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param=\n"+inVO.toString());
		Object[] args= {inVO.getSavePNm()
						,inVO.getOrgNm()
						,inVO.getFileSize()
						,inVO.getExt()
						,inVO.getDivFile()
						,inVO.getGitAddress()
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
		int flag=0;
		PjtFileVO inVO=(PjtFileVO)dto;
		StringBuilder sb=new StringBuilder();
		
		
		sb.append("UPDATE file_project          \n");
		sb.append("SET                          \n");
		sb.append("    ORG_NM = ?               \n");
		sb.append("    ,file_size=?             \n");
		sb.append("    ,ext=?                   \n");
		sb.append("    ,div_file=?              \n");
		sb.append("WHERE                        \n");
		sb.append("    save_pnm = ?           \n");
		sb.append("    AND git_address = ?       \n");
		sb.append("    AND member_id=?			\n");
		
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param= "+inVO.toString());
		
		
		Object[] args= {inVO.getOrgNm()
						,inVO.getFileSize()
						,inVO.getExt()
						,inVO.getDivFile()
						,inVO.getSavePNm()
						,inVO.getGitAddress()
						,inVO.getMemberId()
					};
		flag=this.jdbcTemplate.update(sb.toString(),args);
		LOG.debug("==============================");
		LOG.debug("=flag: "+flag);
		LOG.debug("==============================");
		
		return flag;
	
	}
	public DTO doSearchVideo(DTO dto) {
		
		LOG.debug("=============================================");
		LOG.debug("PjtFileDao");
		LOG.debug("doSearchVideo");
		LOG.debug("=============================================");
		
		
		PjtFileVO inVO=(PjtFileVO)dto;
		PjtFileVO outVO=new PjtFileVO();
		StringBuilder sb=new StringBuilder();
		sb.append("SELECT               \n");
		sb.append("    save_pnm,        \n");
		sb.append("    org_nm,          \n");
		sb.append("    file_size,       \n");
		sb.append("    ext,             \n");
		sb.append("    div_file,        \n");
		sb.append("    git_address,      \n");
		sb.append("    member_id        \n");
		sb.append("FROM                 \n");
		sb.append("    file_project     \n");
		sb.append("WHERE                \n");
		sb.append("	git_address=?		\n");
		
		Object args[]= {
					inVO.getGitAddress()
						};
		outVO=this.jdbcTemplate.queryForObject(sb.toString()
										, args
										, rowMapper);
		LOG.debug("=outVO=\n"+outVO);
		LOG.debug("==============================");
		return outVO;
	}
	
	@Override
	public DTO doSelectOne(DTO dto) {
		PjtFileVO inVO=(PjtFileVO)dto;
		PjtFileVO outVO=new PjtFileVO();
		StringBuilder sb=new StringBuilder();
		sb.append("SELECT               \n");
		sb.append("    save_pnm,        \n");
		sb.append("    org_nm,          \n");
		sb.append("    file_size,       \n");
		sb.append("    ext,             \n");
		sb.append("    div_file,        \n");
		sb.append("    git_address,      \n");
		sb.append("    member_id        \n");
		sb.append("FROM                 \n");
		sb.append("    file_project     \n");
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
	public int doDelete(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	/***
	 * 사용자가 등록한 프로젝트의 개수만큼 List.size를 반환
	 */
	@Override
	public List<?> doRetrieve(DTO dto) {
		
		LOG.debug("============================");
		LOG.debug("=doRetrieve/ProjectDao");
		LOG.debug("============================");
		
		
		PjtFileVO inVO=(PjtFileVO)dto;
		List<PjtFileVO> outList=new ArrayList<PjtFileVO>();
		StringBuilder sb=new StringBuilder();
		
		LOG.debug("============================");
		LOG.debug("=doRetrieve/param"+inVO);
		LOG.debug("============================");
		
		
		sb.append("SELECT               \n");
		sb.append("    save_pnm,        \n");
		sb.append("    org_nm,          \n");
		sb.append("    file_size,       \n");
		sb.append("    ext,             \n");
		sb.append("    div_file,        \n");
		sb.append("    git_address,      \n");
		sb.append("    member_id        \n");
		sb.append("FROM                 \n");
		sb.append("    file_project     \n");
		sb.append("WHERE                \n");
		sb.append("	member_id=?			\n");
		sb.append("ORDER BY git_address	\n");
		
		//		Object args[]= {inVO.getMemberId()};
		
		//Param setting
		List<Object> listArgs = new ArrayList<Object>();
				
		listArgs.add(inVO.getMemberId());
				
		
		
		outList=this.jdbcTemplate.query(sb.toString(),listArgs.toArray(), rowMapper);
		LOG.debug("=outList=\n"+outList);
		LOG.debug("==============================");
		
		return outList;
	}

}
