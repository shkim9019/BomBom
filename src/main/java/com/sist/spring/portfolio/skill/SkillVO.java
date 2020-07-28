package com.sist.spring.portfolio.skill;

import java.util.List;

import com.sist.spring.cmn.DTO;

public class SkillVO extends DTO {

	/** 언어명 */
	private String sName;
	/** 아이디 */
	private String memberId;
	/** 숙련도 */
	private int sMarstery;
	/** 활용내용 */
	private String sContent;
	
	private List<SkillVO> skillList;
	
	

	/**
	 * @return the skillList
	 */
	public List<SkillVO> getSkillList() {
		return skillList;
	}

	/**
	 * @param skillList the skillList to set
	 */
	public void setSkillList(List<SkillVO> skillList) {
		this.skillList = skillList;
	}

	public SkillVO() {}

	public SkillVO(String sName, String memberId, int sMarstery, String sContent) {
		super();
		this.sName = sName;
		this.memberId = memberId;
		this.sMarstery = sMarstery;
		this.sContent = sContent;
	}

	/**
	 * @return the sName
	 */
	public String getsName() {
		return sName;
	}

	/**
	 * @param sName the sName to set
	 */
	public void setsName(String sName) {
		this.sName = sName;
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
	 * @return the sMarstery
	 */
	public int getsMarstery() {
		return sMarstery;
	}

	/**
	 * @param sMarstery the sMarstery to set
	 */
	public void setsMarstery(int sMarstery) {
		this.sMarstery = sMarstery;
	}

	/**
	 * @return the sContent
	 */
	public String getsContent() {
		return sContent;
	}

	/**
	 * @param sContent the sContent to set
	 */
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	@Override
	public String toString() {
		return "SkillVO [sName=" + sName + ", memberId="
				+ memberId + ", sMarstery=" + sMarstery + ", sContent="
				+ sContent + ", toString()=" + super.toString() + "]";
	}

	
	
}