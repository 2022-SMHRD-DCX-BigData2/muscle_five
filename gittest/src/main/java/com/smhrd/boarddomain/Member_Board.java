package com.smhrd.boarddomain;

import java.sql.Timestamp;

public class Member_Board {
	
	private int board_num;
	private String board_id;
	private String board_title;
	private String board_content;
	private String board_file;
	private int board_re_ref; // 글 그룹번호
	private int board_re_lev; // 답변글 깊이
	private int board_seq;// 답변글 순서
	private int board_count;
	private Timestamp board_date;
	private int id_num;
	private String user_comment;
	
	public Member_Board(int id_num, String user_comment) {
	
		this.id_num = id_num;
		this.user_comment = user_comment;
	}

	
	
	public Member_Board(int board_num, String board_id, String board_title, String board_content, String board_file,
			int board_re_ref, int board_re_lev, int board_seq, int board_count, Timestamp board_date, int id_num,
			String user_comment) {
		this.board_num = board_num;
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_seq = board_seq;
		this.board_count = board_count;
		this.board_date = board_date;
		this.id_num = id_num;
		this.user_comment = user_comment;
	}

	// 생성자
	public Member_Board(int board_num, String board_id, String board_title, String board_content, String board_file,
			int board_re_ref, int board_re_lev, int board_seq, int board_count, Timestamp board_date) {
		
		this.board_num = board_num;
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_seq = board_seq;
		this.board_count = board_count;
		this.board_date = board_date;
	}

	public Member_Board(int board_num, int id_num, String user_comment) {
		this.board_num = board_num;
		this.id_num = id_num;
		this.user_comment = user_comment;
	}
	
	public Member_Board(String user_comment, int id_num, int board_num) {
		this.user_comment = user_comment;
		this.id_num = id_num;
		this.board_num = board_num;	
	}
	



	public Member_Board( String user_comment, int id_num) {
		this.id_num = id_num;
		this.user_comment = user_comment;
	}



	public Member_Board() {
		super();
	}

	public Member_Board(String board_id, String board_title, String board_content, String board_file) {
		
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
	}

	public Member_Board(int board_num, String board_id, String board_title, String board_content, String board_file) {
		
		this.board_num = board_num;
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
	}

	public Member_Board(int board_num) {
		
		this.board_num = board_num;
	}
	

	public Member_Board(String board_id, String board_title, String board_content) {
		this.board_id = board_id;
		this.board_id = board_title;
		this.board_id = board_content;
	}

	public Member_Board(int board_num, String board_title, String board_content, String board_file) {
		this.board_num = board_num;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
	}

	// getter, setter
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public int getBoard_re_ref() {
		return board_re_ref;
	}

	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}

	public int getBoard_re_lev() {
		return board_re_lev;
	}

	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public Timestamp getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}

	public int getUserNum() {
		return id_num;
	}

	public void setUserNum(int id_num) {
		this.id_num = id_num;
	}

	public String getUserComment() {
		return user_comment;
	}

	public void setUserComment(String user_comment) {
		this.user_comment = user_comment;
	}
	
	
	
}
