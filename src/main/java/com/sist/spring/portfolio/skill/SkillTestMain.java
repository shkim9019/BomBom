/**
 *<pre>
 * com.hr.board
 * Class Name : BoardTestMain.java
 * Description : 
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2020-02-03           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2020-02-03 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.sist.spring.portfolio.skill;

import java.util.List;

import com.sist.spring.cmn.SearchVO;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

/**
 * @author sist
 *
 */
public class SkillTestMain {
	private final Logger LOG = LoggerFactory.getLogger(SkillTestMain.class);

	// Test Data
	private SkillVO skillVO;
	private SkillDao dao;

	public SkillTestMain() {
		skillVO = new SkillVO("oracle",	"j_hr004",	99	,"내용004");
		dao = new SkillDao();
	}



//	// 등록
//	public void doInsert() {
//		int inFlag = dao.doInsert(skillVO); // dto : boardVO01
//		LOG.debug("Flag : " + inFlag);
//
//		if (inFlag == 1) {
//			LOG.debug("===========================");
//			LOG.debug("성공");
//			LOG.debug("===========================");
//		} else {
//			LOG.debug("===========================");
//			LOG.debug("실패");
//			LOG.debug("===========================");
//		}
//	}
//
//	// 삭제
//	public void doDelete() {
//		skillVO.setSeq(100055);
//		int delFlag = dao.doDelete(skillVO);
//
//		LOG.debug("Flag : " + delFlag);
//		if (delFlag == 1) {
//			LOG.debug("===========================");
//			LOG.debug("성공");
//			LOG.debug("===========================");
//		} else {
//			LOG.debug("===========================");
//			LOG.debug("실패");
//			LOG.debug("===========================");
//		}
//	}
//
//	// 수정
//	public void doUpdate() {
//		// 수정 조건
//		skillVO.setSeq(100064);
//		// 수정 데이터
//		skillVO.setTitle("지은_U");
//		skillVO.setContents("안녕하세유");
//		skillVO.setModId("admin");
//
//		int upFlag = dao.doUpdate(boardVO01);
//
//		LOG.debug("Flag : " + upFlag);
//		if (upFlag == 1) {
//			LOG.debug("===========================");
//			LOG.debug("성공");
//			LOG.debug("===========================");
//		} else {
//			LOG.debug("===========================");
//			LOG.debug("실패");
//			LOG.debug("===========================");
//		}
//	}
//
//	/**
//	 * 
//	 * @Method Name:do_selectOne
//	 * @작성일: 2020. 2. 4.
//	 * @작성자: sist
//	 * @설명:
//	 */
//	public void doSelectOne() {
//		skillVO.setSeq(100064);
//		SkillVO outVO = (SkillVO) dao.doSelectOne(skillVO);
//
//		if (outVO != null) {
//			LOG.debug("===========================");
//			LOG.debug("성공");
//			LOG.debug("===========================");
//		} else {
//			LOG.debug("===========================");
//			LOG.debug("실패");
//			LOG.debug("===========================");
//		}
//		LOG.debug("===========================");
//		LOG.debug("outVO : " + outVO);
//		LOG.debug("===========================");
//	}

	public void doRetrieve() {
		
		// 페이징
//		searchVO.setPageSize(10);
//		searchVO.setPageNum(1);
		// 검색 구분
		// searchVO.setSearchDiv("10");
		// 검색어
		// searchVO.setSearchWord("민지");

		List<SkillVO> list = (List<SkillVO>) dao.doRetrieve(skillVO);
		LOG.debug("===========================");
		// 데이터 출력
		for (SkillVO vo : list) {
			System.out.println(vo);
		}
		LOG.debug("===========================");
	}

	/**
	 * @Method Name:main
	 * @작성일: 2020. 2. 3.
	 * @작성자: sist
	 * @설명:
	 * @param args
	 */
	public static void main(String[] args) {
		SkillTestMain boardTest = new SkillTestMain();
		// boardTest.doInsert();
		// boardTest.doDelete();
		// boardTest.doUpdate();
		// boardTest.doSelectOne();
		boardTest.doRetrieve();
	}

}
