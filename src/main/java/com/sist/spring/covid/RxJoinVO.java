/**
 *<pre>
 * com.sist.spring.covid
 * Class Name : RxJoinVO.java
 * Description : 
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2020-04-25           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2020-04-25 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.sist.spring.covid;

import com.sist.spring.cmn.DTO;

/**
 * @author 82104
 * 관심약국 조인VO
 */
public class RxJoinVO extends DTO {
	private String memberId;	//회원아이디
	private String pCode;		//일련번호
	private String pName;		//약국명
	private String pAddr;		//약국주소
	private double pLng;		//위도
	private double pLat;		//경도
	private String pRemainStat;	//재고량
	private String email;		//이메일
	
	public RxJoinVO() {}

	public RxJoinVO(String memberId, String pCode, String pName, String pAddr, double pLng, double pLat,
			String pRemainStat, String email) {
		super();
		this.memberId = memberId;
		this.pCode = pCode;
		this.pName = pName;
		this.pAddr = pAddr;
		this.pLng = pLng;
		this.pLat = pLat;
		this.pRemainStat = pRemainStat;
		this.email = email;
	}

	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}

	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	/**
	 * @return the pCode
	 */
	public String getpCode() {
		return pCode;
	}

	/**
	 * @param pCode the pCode to set
	 */
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pAddr
	 */
	public String getpAddr() {
		return pAddr;
	}

	/**
	 * @param pAddr the pAddr to set
	 */
	public void setpAddr(String pAddr) {
		this.pAddr = pAddr;
	}

	/**
	 * @return the pLng
	 */
	public double getpLng() {
		return pLng;
	}

	/**
	 * @param pLng the pLng to set
	 */
	public void setpLng(double pLng) {
		this.pLng = pLng;
	}

	/**
	 * @return the pLat
	 */
	public double getpLat() {
		return pLat;
	}

	/**
	 * @param pLat the pLat to set
	 */
	public void setpLat(double pLat) {
		this.pLat = pLat;
	}

	/**
	 * @return the pRemainStat
	 */
	public String getpRemainStat() {
		return pRemainStat;
	}

	/**
	 * @param pRemainStat the pRemainStat to set
	 */
	public void setpRemainStat(String pRemainStat) {
		this.pRemainStat = pRemainStat;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "RxJoinVO [memberId=" + memberId + ", pCode=" + pCode + ", pName=" + pName + ", pAddr=" + pAddr
				+ ", pLng=" + pLng + ", pLat=" + pLat + ", pRemainStat=" + pRemainStat + ", email=" + email
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
