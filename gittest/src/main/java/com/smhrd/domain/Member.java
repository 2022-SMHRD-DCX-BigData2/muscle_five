package com.smhrd.domain;

public class Member {

	// 필드명 = 속성(property)
	private String email;
	private String pw;
	private String tel;
	private String address;
	
	
	// 생성자
	public Member(String email, String pw, String tel, String address) {
		super();
		this.email = email;
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}
	public Member(String email, String pw) {
		super();
		this.email = email;
		this.pw = pw;
	}
	
	
	// getter, setter
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	// 객체에 담김 정보를 출력해 볼 수 있는 메소드
	// toString
	@Override
	public String toString() {
		return "member [email=" + email + ", pw=" + pw + ", tel=" + tel + ", address=" + address + "]";
	}
	

}
