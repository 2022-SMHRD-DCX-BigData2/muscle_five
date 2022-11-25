package com.smhrd.domain;

public class compositionMember {
	
	private String weight;
	private String muscle;
	private String fat;
	private String id;
	
	public compositionMember(String weight, String muscle, String fat, String id) {
		this.weight = weight;
		this.muscle = muscle;
		this.fat = fat;
		this.id = id;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getMuscle() {
		return muscle;
	}

	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}

	public String getFat() {
		return fat;
	}

	public void setFat(String fat) {
		this.fat = fat;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	

}
