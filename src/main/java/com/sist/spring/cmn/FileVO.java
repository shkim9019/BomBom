package com.sist.spring.cmn;


public class FileVO extends DTO {

	private String orgFileNm; 	//원본파일명
	private String saveFileNm;	//저장파일명
	private long   fileSize;	//파일사이즈
	private String ext;			//확장자
	
	public FileVO() {}

	/**
	 * @return the orgFileNm
	 */
	public String getOrgFileNm() {
		return orgFileNm;
	}

	/**
	 * @param orgFileNm the orgFileNm to set
	 */
	public void setOrgFileNm(String orgFileNm) {
		this.orgFileNm = orgFileNm;
	}

	/**
	 * @return the saveFileNm
	 */
	public String getSaveFileNm() {
		return saveFileNm;
	}

	/**
	 * @param saveFileNm the saveFileNm to set
	 */
	public void setSaveFileNm(String saveFileNm) {
		this.saveFileNm = saveFileNm;
	}

	/**
	 * @return the fileSize
	 */
	public long getFileSize() {
		return fileSize;
	}

	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	/**
	 * @return the ext
	 */
	public String getExt() {
		return ext;
	}

	/**
	 * @param ext the ext to set
	 */
	public void setExt(String ext) {
		this.ext = ext;
	}

	@Override
	public String toString() {
		return "FileVO [orgFileNm=" + orgFileNm + ", saveFileNm=" + saveFileNm + ", fileSize=" + fileSize + ", ext="
				+ ext + ", toString()=" + super.toString() + "]";
	}
	
	

	
}
