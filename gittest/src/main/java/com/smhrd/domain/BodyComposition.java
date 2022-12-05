package com.smhrd.domain;

public class BodyComposition {
	
	private int id_num;
	private int weight;
	private int muscle;
	private int fat;
	private int weeks;
	private int pushup;
	private int pullup;
	private String insertdate;
	private int type;
	
	public BodyComposition(int id_num, int weight, int muscle, int fat, int weeks, int pushup, int pullup,
			String insertdate, int type) {
		
		this.id_num = id_num;
		this.weight = weight;
		this.muscle = muscle;
		this.fat = fat;
		this.weeks = weeks;
		this.pushup = pushup;
		this.pullup = pullup;
		this.insertdate = insertdate;
		this.type = type;
	}
	
	public BodyComposition() {
	
	}

	public BodyComposition(int id_num, int weight, int muscle, int fat, String insertdate) {
		this.id_num = id_num;
		this.weight = weight;
		this.muscle = muscle;
		this.fat = fat;
		this.insertdate = insertdate;
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

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
}


