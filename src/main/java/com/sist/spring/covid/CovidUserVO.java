/**
 *<pre>
 * com.sist.spring.covid
 * Class Name : CovidVO.java
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
 * Covid 회원가입 VO
 */
public class CovidUserVO extends DTO {
	private String memberId;			//회원아이디
	private String passWord;		//비밀번호
	private String email;			//이메일
	private String phone;		//핸드폰번호
	
	public CovidUserVO() {}

	public CovidUserVO(String memberId, String passWord, String email, String phone) {
		super();
		this.memberId = memberId;
		this.passWord = passWord;
		this.email = email;
		this.phone = phone;
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
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
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

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "CovidUserVO [memberId=" + memberId + ", passWord=" + passWord + ", email=" + email + ", phone=" + phone
				+ ", toString()=" + super.toString() + "]";
	}

	
	
	
	
	
}
