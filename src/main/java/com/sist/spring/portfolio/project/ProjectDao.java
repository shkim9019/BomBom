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
public class ProjectDao implements Dao {

   private final Logger LOG = LoggerFactory.getLogger(this.getClass());
   
   @Autowired
   private JdbcTemplate jdbcTemplate;
   
   //주입을 위한 Default 생성자
   public ProjectDao() {
      // TODO Auto-generated constructor stub
   }
   
   
   RowMapper<ProjectVO> rowMapper = new RowMapper<ProjectVO>() {

      public ProjectVO mapRow(ResultSet rs, int rowNum) throws SQLException {
         ProjectVO outData=new ProjectVO();
         outData.setPjtName(rs.getString("pjt_name"));
         outData.setMemberId(rs.getString("member_id"));
         outData.setPjtInfo(rs.getString("pjt_info"));
         outData.setPjtStart(rs.getString("pjt_start"));
         outData.setPjtEnd(rs.getString("pjt_end"));
         outData.setGitAddress(rs.getString("git_address"));
         
//         if(rs.getInt("rnum")==0) {
//            outData.setNum(1);
//         }else {
//            outData.setNum(rs.getInt("rnum"));
//         }
//         outData.setTotalCnt(rs.getInt("total_cnt"));
         return outData;
      }

   };

   
   
   @Override
   public int doInsert(DTO dto) {
      int flag=0;
      ProjectVO inVO=(ProjectVO)dto;
      StringBuilder sb=new StringBuilder();
      sb.append("INSERT INTO projects (      \n");
      sb.append("    pjt_name,                \n");
      sb.append("    member_id,               \n");
      sb.append("    pjt_info,                \n");
      sb.append("    pjt_start,               \n");
      sb.append("    pjt_end,                 \n");
      sb.append("    git_address              \n");
      sb.append(") VALUES (                   \n");
      sb.append("    ?,                       \n");
      sb.append("    ?,                       \n");
      sb.append("    ?,                       \n");
      sb.append("    TO_DATE(?,'YYYY-MM-DD'), \n");       
      sb.append("    TO_DATE(?,'YYYY-MM-DD'), \n");         
      sb.append("    ?                        \n");
      sb.append(")                      \n");

      LOG.debug("==============================");
      LOG.debug("=Query=\n"+sb.toString());
      LOG.debug("=Param=\n"+inVO.toString());
      Object[] args= {inVO.getPjtName()
                  ,inVO.getMemberId()
                  ,inVO.getPjtInfo()
                  ,inVO.getPjtTool()
                  ,inVO.getPjtLanguage()
                  ,inVO.getPjtStart()
                  ,inVO.getPjtEnd()
                  ,inVO.getGitAddress()
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
      ProjectVO inVO=(ProjectVO)dto;
      StringBuilder sb=new StringBuilder();
      
      
      sb.append("UPDATE projects       ");
      sb.append("SET                  ");
      sb.append("    pjt_info = ?     ");
      sb.append("    ,pjt_start = TO_DATE(?,'YYYY/MM/DD')   "); 
      sb.append("    ,pjt_end = TO_DATE(?,'YYYY/MM/DD')     ");
      sb.append("    ,git_address = ? ");
      sb.append("WHERE                ");
      sb.append("    pjt_name = ?     ");
      sb.append("    AND member_id = ?");

      LOG.debug("==============================");
      LOG.debug("=Query=\n"+sb.toString());
      LOG.debug("=Param= "+inVO.toString());
      
      System.out.println(inVO.getPjtStart());
      
      
      Object[] args= {inVO.getPjtInfo()
				 ,inVO.getPjtStart() 
				 ,inVO.getPjtEnd()
                  ,inVO.getGitAddress()
                  ,inVO.getPjtName()
                  ,inVO.getMemberId()
               };
      flag=this.jdbcTemplate.update(sb.toString(),args);
      LOG.debug("==============================");
      LOG.debug("=flag: "+flag);
      LOG.debug("==============================");
      
      return flag;
   
   }

   @Override
   public DTO doSelectOne(DTO dto) {
      ProjectVO inVO=(ProjectVO)dto;
      ProjectVO outVO=new ProjectVO();
      StringBuilder sb=new StringBuilder();
      
      sb.append("SELECT               ");
      sb.append("    pjt_name,        ");
      sb.append("    member_id,       ");
      sb.append("    pjt_info,        ");
      sb.append("    pjt_start,       ");
      sb.append("    pjt_end,         ");
      sb.append("    git_address      ");
      sb.append("FROM                 ");
      sb.append("    projects          ");
      sb.append("WHERE                ");
      sb.append("    pjt_name=?       ");
      sb.append("    AND member_id= ? ");
      
      Object args[]= {
               inVO.getPjtName()
               ,inVO.getMemberId()
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
      int flag=0;
      ProjectVO inVO=(ProjectVO)dto;
      StringBuilder sb=new StringBuilder();
      sb.append("  DELETE FROM projects   ");
      sb.append("  WHERE                  ");
      sb.append("  git_address = ?         ");
      sb.append("  AND member_id = ?      ");
      LOG.debug("==============================");
      LOG.debug("=Query=\n"+sb.toString());
      LOG.debug("=Param=\n"+inVO.toString());
      Object[] args= {
                   inVO.getGitAddress()
                  ,inVO.getMemberId()
                  };
      
      flag=this.jdbcTemplate.update(sb.toString(),args);
      LOG.debug("==============================");
      LOG.debug("=flag: "+flag);
      LOG.debug("==============================");
      
      return flag;
   }

   /***
    * 사용자가 등록한 프로젝트의 개수만큼 List.size를 반환
    */
   @Override
   public List<?> doRetrieve(DTO dto) {
      
      LOG.debug("============================");
      LOG.debug("=doRetrieve/ProjectDao");
      LOG.debug("============================");
      
      
      ProjectVO inVO=(ProjectVO)dto;
      List<ProjectVO> outList=new ArrayList<ProjectVO>();
      StringBuilder sb=new StringBuilder();
      
      LOG.debug("============================");
      LOG.debug("=doRetrieve/param"+inVO);
      LOG.debug("============================");
      
      
      sb.append("SELECT               ");
      sb.append("    pjt_name,        ");
      sb.append("    member_id,       ");
      sb.append("    pjt_info,        ");
      sb.append("    TO_CHAR(pjt_start,'YYYY-MM-DD') as pjt_start,       ");
      sb.append("    TO_CHAR(pjt_end,'YYYY-MM-DD') as pjt_end,       ");
      sb.append("    git_address      ");
      sb.append("FROM                 ");
      sb.append("    projects          ");
      sb.append("WHERE                ");
      sb.append("    member_id=?      ");
      sb.append("ORDER BY git_address");
      
//      Object args[]= {inVO.getMemberId()};
      
      //Param setting
      List<Object> listArgs = new ArrayList<Object>();
            
      listArgs.add(inVO.getMemberId());
            
      
      
      outList=this.jdbcTemplate.query(sb.toString(),listArgs.toArray(), rowMapper);
      LOG.debug("=outList=\n"+outList);
      LOG.debug("==============================");
      
      return outList;
   }
   
   public int springInsert(DTO dto) {
      int flag=0;
      ProjectVO inVO=(ProjectVO)dto;
      LOG.debug("================================");
      LOG.debug("springInsert/springInsert");
      LOG.debug(inVO.toString());
      LOG.debug(inVO.getGitAddress());
      LOG.debug("================================");
      
      StringBuilder sb=new StringBuilder();

      sb.append("INSERT INTO projects (      \n");
      sb.append("    pjt_name,                \n");
      sb.append("    member_id,               \n");
      sb.append("    pjt_info,                \n");
      sb.append("    pjt_start,               \n");
      sb.append("    pjt_end,                 \n");
      sb.append("    git_address              \n");
      sb.append(") VALUES (                   \n");
      sb.append("    ?,                       \n");
      sb.append("    ?,                       \n");
      sb.append("    ?,                       \n");
      sb.append("    TO_DATE(?,'YYYY-MM-DD'), \n");       
      sb.append("    TO_DATE(?,'YYYY-MM-DD'), \n");         
      sb.append("    ?                        \n");
      sb.append(")                      \n");
      
      
      LOG.debug("==============================");
      LOG.debug("=Query=\n"+sb.toString());
      LOG.debug("=Param=\n"+inVO.toString());
      Object[] args= {inVO.getPjtName()
                  ,inVO.getMemberId()
                  ,inVO.getPjtInfo()
                  ,inVO.getPjtStart()
                  ,inVO.getPjtEnd()
                  ,inVO.getGitAddress()
                  };
      
      flag=this.jdbcTemplate.update(sb.toString(),args);
      LOG.debug("==============================");
      LOG.debug("=flag: "+flag);
      LOG.debug("==============================");
      
      return flag;
   }

}