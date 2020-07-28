package com.sist.spring.portfolio.member.file;

import com.sist.spring.cmn.DTO;

public class FileMemberVO extends DTO{

	private String saveNm; 		//저장파일명
	private String orgNm; 		//원본파일명
	private long fileSize; 		//파일사이즈
	private String ext; 		//확장자
	private String memberId; 	//사용자 아이디
	
	public FileMemberVO() {
	}
	
	public String getSaveNm() {
		return saveNm;
	}
	public void setSaveNm(String saveNm) {
		this.saveNm = saveNm;
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
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "FileMemberVO [saveNm=" + saveNm + ", orgNm=" + orgNm + ", fileSize=" + fileSize + ", ext=" + ext
				+ ", memberId=" + memberId + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
