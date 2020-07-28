/**
 *<pre>
 * com.sist.spring.portfolio.license
 * Class Name : LicenseVO.java
 * Description : 
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2020-04-26           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2020-04-26 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.sist.spring.portfolio.comment;

import com.sist.spring.cmn.DTO;

/**
 * @author sist
 *
 */
public class CommentVO extends DTO {
	 
	private int cNo  ; 
	private String cContent  ; 
	private String regDt ; 
	private String modDt; 
	private String regId; 
	private String portfolioId  ; 

	 public CommentVO() {}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(String portfolioId) {
		this.portfolioId = portfolioId;
	}

	public CommentVO(int cNo, String cContent, String regDt, String modDt, String regId, String portfolioId) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.regDt = regDt;
		this.modDt = modDt;
		this.regId = regId;
		this.portfolioId = portfolioId;
	}

	@Override
	public String toString() {
		return "CommentVO [cNo=" + cNo + ", cContent=" + cContent + ", regDt=" + regDt + ", modDt=" + modDt + ", regId="
				+ regId + ", portfolioId=" + portfolioId + ", toString()=" + super.toString() + "]";
	}

	 
	
	
}
