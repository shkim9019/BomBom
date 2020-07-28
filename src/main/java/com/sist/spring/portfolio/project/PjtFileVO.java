package com.sist.spring.portfolio.project;

import java.util.List;

import com.sist.spring.cmn.DTO;

public class PjtFileVO extends DTO {
	private String savePNm;//저장이름
	private String orgNm;//원본이름
	private long fileSize;//
	private String ext;
	/**
	 * divFile 파일 구분
	 * 1- 동영상 
	 * 0- 사진
	 */
	private int divFile;
	private String gitAddress;
	private String memberId;
	
	private List<PjtFileVO> projectList;
	
	
	/**
	 * @return the projectList
	 */
	public List<PjtFileVO> getProjectList() {
		return projectList;
	}


	/**
	 * @param projectList the projectList to set
	 */
	public void setProjectList(List<PjtFileVO> projectList) {
		this.projectList = projectList;
	}


	public PjtFileVO() {
	}
	
	
	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getSavePNm() {
		return savePNm;
	}
	public void setSavePNm(String savePNm) {
		this.savePNm = savePNm;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDivFile() {
		return divFile;
	}
	public void setDivFile(int divFile) {
		this.divFile = divFile;
	}
	public String getGitAddress() {
		return gitAddress;
	}
	public void setGitAddress(String gitAddress) {
		this.gitAddress = gitAddress;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "PjtFileVO [savePNm=" + savePNm + ", orgNm=" + orgNm + ", fileSize=" + fileSize + ", ext=" + ext
				+ ", divFile=" + divFile + ", gitAddress=" + gitAddress + ", memberId=" + memberId + "]";
	}
	
	
	
	
}
