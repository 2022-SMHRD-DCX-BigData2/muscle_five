package com.smhrd.domain;

public class Member {

	// 필드명 = 속성(property)
	
	private int id_num;
	private String id;
	private String pw;
	private String gender;
	private String birth;
	private String email;
	private String grade;
	

	public Member(int id_num, String id, String pw, String gender, String birth, String email, String grade) {
		this.id_num = id_num;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.grade = grade;
	}
	
	public Member(String id, String pw, String gender, String birth, String email, String grade) {
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.grade = grade;
	}
	
	public Member(String id, String pw, String gender, String birth, String email) {
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
	}

	public Member() {
		super();
	}


	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	
	public Member(String id, String pw, String grade) {
		this.id = id;
		this.pw = pw;
		this.grade = grade;
	}


	public int getId_num() {
		return id_num;
	}


	public void setId_num(int id_num) {
		this.id_num = id_num;
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


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}



	
	

}
