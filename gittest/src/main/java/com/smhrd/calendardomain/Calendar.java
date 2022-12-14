package com.smhrd.calendardomain;

public class Calendar {
	
	private String id; // 이벤트 고유 번호
	private String title; // 이벤트 내용
	private String allDay; // 이벤트가 하루종일 일정인지 확인
	private String start; // 이벤트 시작시간
	private String end; // 이벤트 끝시간
	private String startStr; // 이벤트 시작
	private String endStr; // 이벤트 끝
	private String backgroundColor; // 이벤트 배경색
	private String borderColor; // 이벤트 박스 라인색
	private String textColor; // 이벤트 글자색
	private int id_num;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getStartStr() {
		return startStr;
	}
	public void setStartStr(String startStr) {
		this.startStr = startStr;
	}
	public String getEndStr() {
		return endStr;
	}
	public void setEndStr(String endStr) {
		this.endStr = endStr;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public int getId_num() {
		return id_num;
	}
	public void setId_num(int id_num) {
		this.id_num = id_num;
	}
	public Calendar(String id, String title, String allDay, String start, String end, String startStr, String endStr,
			String backgroundColor, String borderColor, String textColor, int id_num) {
		this.id = id;
		this.title = title;
		this.allDay = allDay;
		this.start = start;
		this.end = end;
		this.startStr = startStr;
		this.endStr = endStr;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
		this.textColor = textColor;
		this.id_num = id_num;
	}
	
	
	
	public Calendar(String title, String allDay, String start, String end, String startStr, String endStr,
			String backgroundColor, String borderColor, String textColor, int id_num) {
		super();
		this.title = title;
		this.allDay = allDay;
		this.start = start;
		this.end = end;
		this.startStr = startStr;
		this.endStr = endStr;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
		this.textColor = textColor;
		this.id_num = id_num;
	}
	public Calendar(String id, String start, String end, String startStr, String endStr) {
		this.id = id;
		this.start = start;
		this.end = end;
		this.startStr = startStr;
		this.endStr = endStr;
	}
	public Calendar(String id, String title, String allDay, String start, String end, String backgroundColor,
			String borderColor, String textColor) {
		super();
		this.id = id;
		this.title = title;
		this.allDay = allDay;
		this.start = start;
		this.end = end;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
		this.textColor = textColor;
	}

	
	
}