package com.smhrd.domain;

public class compositionMember {
	
	private int id_num;
	private int weight;
	private int muscle;
	private int fat;
	private int weeks;
	private int pushup;
	private int pullup;
	private int type;
	private String first_exercise;
	private String second_exercise;
	private String third_exercise;
	private String fourth_exercise;
	
	
	public compositionMember(int id_num, int weight, int muscle, int fat, int weeks, int pushup, int pullup, int type) {
		this.id_num = id_num;
		this.weight = weight;
		this.muscle = muscle;
		this.fat = fat;
		this.weeks = weeks;
		this.pushup = pushup;
		this.pullup = pullup;
		this.type = type;
	}


	
	
	public compositionMember() {
		super();
	}




	public int getId_num() {
		return id_num;
	}


	public void setId_num(int id_num) {
		this.id_num = id_num;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public int getMuscle() {
		return muscle;
	}


	public void setMuscle(int muscle) {
		this.muscle = muscle;
	}


	public int getFat() {
		return fat;
	}


	public void setFat(int fat) {
		this.fat = fat;
	}


	public int getWeeks() {
		return weeks;
	}


	public void setWeeks(int weeks) {
		this.weeks = weeks;
	}


	public int getPushup() {
		return pushup;
	}


	public void setPushup(int pushup) {
		this.pushup = pushup;
	}


	public int getPullup() {
		return pullup;
	}


	public void setPullup(int pullup) {
		this.pullup = pullup;
	}




	public int getType() {
		return type;
	}




	public void setType(int type) {
		this.type = type;
	}




	public String getFirst_exercise() {
		return first_exercise;
	}




	public void setFirst_exercise(String first_exercise) {
		this.first_exercise = first_exercise;
	}




	public String getSecond_exercise() {
		return second_exercise;
	}




	public void setSecond_exercise(String second_exercise) {
		this.second_exercise = second_exercise;
	}




	public String getThird_exercise() {
		return third_exercise;
	}




	public void setThird_exercise(String third_exercise) {
		this.third_exercise = third_exercise;
	}




	public String getFourth_exercise() {
		return fourth_exercise;
	}




	public void setFourth_exercise(String fourth_exercise) {
		this.fourth_exercise = fourth_exercise;
	}
	
	
	
	
	
	
	

}
