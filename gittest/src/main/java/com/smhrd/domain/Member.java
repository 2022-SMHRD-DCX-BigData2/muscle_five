package com.smhrd.domain;

public class Member {

	// 필드명 = 속성(property)
	
	private String id;
	private String pw;
	private String gender;
	private String birth_yy;
	private String birth_mm;
	private String birth_dd;
	private String mail;
	private String mail1;
	private String mail2;
	//private String mag;
	
	
	
	public Member(String id, String pw, String gender, String birth_yy, String birth_mm, String birth_dd, String mail1, String mail2) {
		
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.birth_yy = birth_yy;
		this.birth_mm = birth_mm;
		this.birth_dd = birth_dd;
		this.mail1 = mail1;
		this.mail2 = mail2;
	}


	public Member(String pw, String gender, String birth_yy, String birth_mm, String birth_dd, String mail1, String mail2) {
			
		this.pw = pw;
		this.gender = gender;
		this.birth_yy = birth_yy;
		this.birth_mm = birth_mm;
		this.birth_dd = birth_dd;
		this.mail1 = mail1;
		this.mail2 = mail2;
	}


	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	
	public Member(String id) {
		this.id = id;
	}

	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirth_yy() {
		return birth_yy;
	}


	public void setBirth_yy(String birth_yy) {
		this.birth_yy = birth_yy;
	}


	public String getBirth_mm() {
		return birth_mm;
	}


	public void setBirth_mm(String birth_mm) {
		this.birth_mm = birth_mm;
	}


	public String getBirth_dd() {
		return birth_dd;
	}


	public void setBirth_dd(String birth_dd) {
		this.birth_dd = birth_dd;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMail1() {
		return mail1;
	}


	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}


	public String getMail2() {
		return mail2;
	}


	public void setMail2(String mail2) {
		this.mail2 = mail2;
	}


	
	
	
	// 객체에 담김 정보를 출력해 볼 수 있는 메소드
	// toString
	//@Override
	//public String toString() {
	//	return "member [email=" + email + ", pw=" + pw + ", tel=" + tel + ", address=" + address + "]";
	//}
	

}
