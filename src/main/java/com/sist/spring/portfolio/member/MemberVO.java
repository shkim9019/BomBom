package com.sist.spring.portfolio.member;

import com.sist.spring.cmn.DTO;

public class MemberVO extends DTO {
	
	/** 아이디 */ 
	private String memberId;
	/** 비밀번호 */
	private String password;
	/** 이름 */
	private String name;
	/** 이메일 */
	private String email;
	/** 생년월일 */
	private String birth;
	/** 핸드폰번호 */
	private String phone;
	/** 권한 */
	private String authority;
	/** 관심분야 */
	private String interestOption;
	/** 공개여부 */
	private String open;
	
	public MemberVO () {}

	public MemberVO(String memberId, String password, String name, String email, String birth, String phone,
			String authority, String interestOption, String open) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.authority = authority;
		this.interestOption = interestOption;
		this.open = open;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}

	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
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

	/**
	 * @return the authority
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * @param authority the authority to set
	 */
	public void setAuthority(String authority) {
		this.authority = authority;
	}

	/**
	 * @return the interestOption
	 */
	public String getInterestOption() {
		return interestOption;
	}

	/**
	 * @param interestOption the interestOption to set
	 */
	public void setInterestOption(String interestOption) {
		this.interestOption = interestOption;
	}

	/**
	 * @return the open
	 */
	public String getOpen() {
		return open;
	}

	/**
	 * @param open the open to set
	 */
	public void setOpen(String open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", birth=" + birth + ", phone=" + phone + ", authority=" + authority + ", interestOption="
				+ interestOption + ", open=" + open + ", toString()=" + super.toString() + "]";
	}

	

	
	
}
