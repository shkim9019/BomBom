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
package com.sist.spring.portfolio.license;

import java.util.List;

import com.sist.spring.cmn.DTO;

/**
 * @author sist
 *
 */
public class LicenseVO extends DTO {
	private String lName ; /**자격증명 */
	private String lGroup; /**자격 분류(국가기술,국가전문,민간,외국 등) */
	private String lGrade ; /**자격증 종류(기사,기능사,1급,2급) */
	private String lNum  ; /**자격증 번호 */
	private String lDate  ; /**취득일 */
	private String lOrgan; /**발행기관 */
	private String memberId; /**회원ID */
	
	private List<LicenseVO> licenseList;
	
	

	/**
	 * @return the licenseList
	 */
	public List<LicenseVO> getLicenseList() {
		return licenseList;
	}

	/**
	 * @param licenseList the licenseList to set
	 */
	public void setLicenseList(List<LicenseVO> licenseList) {
		this.licenseList = licenseList;
	}

	public LicenseVO() {}

	public LicenseVO(String lName, String lGroup, String lGrade, String lNum, String lDate, String lOrgan,
			String memberId) {
		super();
		this.lName = lName;
		this.lGroup = lGroup;
		this.lGrade = lGrade;
		this.lNum = lNum;
		this.lDate = lDate;
		this.lOrgan = lOrgan;
		this.memberId = memberId;
	}

	/**
	 * @return the lName
	 */
	public String getlName() {
		return lName;
	}

	/**
	 * @param lName the lName to set
	 */
	public void setlName(String lName) {
		this.lName = lName;
	}

	/**
	 * @return the lGroup
	 */
	public String getlGroup() {
		return lGroup;
	}

	/**
	 * @param lGroup the lGroup to set
	 */
	public void setlGroup(String lGroup) {
		this.lGroup = lGroup;
	}

	/**
	 * @return the lGrade
	 */
	public String getlGrade() {
		return lGrade;
	}

	/**
	 * @param lGrade the lGrade to set
	 */
	public void setlGrade(String lGrade) {
		this.lGrade = lGrade;
	}

	/**
	 * @return the lNum
	 */
	public String getlNum() {
		return lNum;
	}

	/**
	 * @param lNum the lNum to set
	 */
	public void setlNum(String lNum) {
		this.lNum = lNum;
	}

	/**
	 * @return the lDate
	 */
	public String getlDate() {
		return lDate;
	}

	/**
	 * @param lDate the lDate to set
	 */
	public void setlDate(String lDate) {
		this.lDate = lDate;
	}

	/**
	 * @return the lOrgan
	 */
	public String getlOrgan() {
		return lOrgan;
	}

	/**
	 * @param lOrgan the lOrgan to set
	 */
	public void setlOrgan(String lOrgan) {
		this.lOrgan = lOrgan;
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

	@Override
	public String toString() {
		return "LicenseVO [lName=" + lName + ", lGroup=" + lGroup + ", lGrade=" + lGrade + ", lNum=" + lNum + ", lDate="
				+ lDate + ", lOrgan=" + lOrgan + ", memberId=" + memberId + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lDate == null) ? 0 : lDate.hashCode());
		result = prime * result + ((lGrade == null) ? 0 : lGrade.hashCode());
		result = prime * result + ((lGroup == null) ? 0 : lGroup.hashCode());
		result = prime * result + ((lName == null) ? 0 : lName.hashCode());
		result = prime * result + ((lNum == null) ? 0 : lNum.hashCode());
		result = prime * result + ((lOrgan == null) ? 0 : lOrgan.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LicenseVO other = (LicenseVO) obj;
		if (lDate == null) {
			if (other.lDate != null)
				return false;
		} else if (!lDate.equals(other.lDate))
			return false;
		if (lGrade == null) {
			if (other.lGrade != null)
				return false;
		} else if (!lGrade.equals(other.lGrade))
			return false;
		if (lGroup == null) {
			if (other.lGroup != null)
				return false;
		} else if (!lGroup.equals(other.lGroup))
			return false;
		if (lName == null) {
			if (other.lName != null)
				return false;
		} else if (!lName.equals(other.lName))
			return false;
		if (lNum == null) {
			if (other.lNum != null)
				return false;
		} else if (!lNum.equals(other.lNum))
			return false;
		if (lOrgan == null) {
			if (other.lOrgan != null)
				return false;
		} else if (!lOrgan.equals(other.lOrgan))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}

 	 
	 
}
