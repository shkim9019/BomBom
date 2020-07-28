package com.sist.spring.portfolio.project;

import java.util.List;

import com.sist.spring.cmn.DTO;

public class ProjectVO extends DTO {
	private String pjtName;
	private String memberId;
	/**
	 * 추가한 멤버변수 프로젝트 설명
	 */
	private String pjtInfo;
	private String pjtStart;
	private String pjtEnd;
	private String pjtLanguage;
	private String pjtTool;
	private String gitAddress;
	
	private List<ProjectVO> projectList;
	
	/**
	 * @return the projectList
	 */
	public List<ProjectVO> getProjectList() {
		return projectList;
	}

	/**
	 * @param projectList the projectList to set
	 */
	public void setProjectList(List<ProjectVO> projectList) {
		this.projectList = projectList;
	}

	public String getPjtName() {
		return pjtName;
	}

	public void setPjtName(String pjtName) {
		this.pjtName = pjtName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPjtInfo() {
		return pjtInfo;
	}

	public void setPjtInfo(String pjtInfo) {
		this.pjtInfo = pjtInfo;
	}

	public String getPjtStart() {
		return pjtStart;
	}

	public void setPjtStart(String pjtStart) {
		this.pjtStart = pjtStart;
	}

	public String getPjtEnd() {
		return pjtEnd;
	}

	public void setPjtEnd(String pjtEnd) {
		this.pjtEnd = pjtEnd;
	}

	public String getPjtLanguage() {
		return pjtLanguage;
	}

	public void setPjtLanguage(String pjtLanguage) {
		this.pjtLanguage = pjtLanguage;
	}

	public String getPjtTool() {
		return pjtTool;
	}

	public void setPjtTool(String pjtTool) {
		this.pjtTool = pjtTool;
	}

	public String getGitAddress() {
		return gitAddress;
	}

	public void setGitAddress(String gitAddress) {
		this.gitAddress = gitAddress;
	}

	@Override
	public String toString() {
		return "ProjectVO [pjtName=" + pjtName + ", memberId=" + memberId + ", pjtInfo=" + pjtInfo + ", pjtStart="
				+ pjtStart + ", pjtEnd=" + pjtEnd + ", pjtLanguage=" + pjtLanguage + ", pjtTool=" + pjtTool
				+ ", gitAddress=" + gitAddress + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
