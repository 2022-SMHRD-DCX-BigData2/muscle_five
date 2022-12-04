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
	private String mfirst_exercise;
	private String msecond_exercise;
	private String mthird_exercise;
	private String mfourth_exercise;
	private String wfirst_exercise;
	private String wsecond_exercise;
	private String wthird_exercise;
	private String wfourth_exercise;
	private String ffirst_exercise;
	private String fsecond_exercise;
	private String fthird_exercise;
	private String ffourth_exercise;
	
	
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

	
	
	
	public compositionMember(int type, int id_num) {
		this.id_num = id_num;
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




	public String getMfirst_exercise() {
		return mfirst_exercise;
	}




	public void setMfirst_exercise(String mfirst_exercise) {
		this.mfirst_exercise = mfirst_exercise;
	}




	public String getMsecond_exercise() {
		return msecond_exercise;
	}




	public void setMsecond_exercise(String msecond_exercise) {
		this.msecond_exercise = msecond_exercise;
	}




	public String getMthird_exercise() {
		return mthird_exercise;
	}




	public void setMthird_exercise(String mthird_exercise) {
		this.mthird_exercise = mthird_exercise;
	}




	public String getMfourth_exercise() {
		return mfourth_exercise;
	}




	public void setMfourth_exercise(String mfourth_exercise) {
		this.mfourth_exercise = mfourth_exercise;
	}




	public String getWfirst_exercise() {
		return wfirst_exercise;
	}




	public void setWfirst_exercise(String wfirst_exercise) {
		this.wfirst_exercise = wfirst_exercise;
	}




	public String getWsecond_exercise() {
		return wsecond_exercise;
	}




	public void setWsecond_exercise(String wsecond_exercise) {
		this.wsecond_exercise = wsecond_exercise;
	}




	public String getWthird_exercise() {
		return wthird_exercise;
	}




	public void setWthird_exercise(String wthird_exercise) {
		this.wthird_exercise = wthird_exercise;
	}




	public String getWfourth_exercise() {
		return wfourth_exercise;
	}




	public void setWfourth_exercise(String wfourth_exercise) {
		this.wfourth_exercise = wfourth_exercise;
	}




	public String getFfirst_exercise() {
		return ffirst_exercise;
	}




	public void setFfirst_exercise(String ffirst_exercise) {
		this.ffirst_exercise = ffirst_exercise;
	}




	public String getFsecond_exercise() {
		return fsecond_exercise;
	}




	public void setFsecond_exercise(String fsecond_exercise) {
		this.fsecond_exercise = fsecond_exercise;
	}




	public String getFthird_exercise() {
		return fthird_exercise;
	}




	public void setFthird_exercise(String fthird_exercise) {
		this.fthird_exercise = fthird_exercise;
	}




	public String getFfourth_exercise() {
		return ffourth_exercise;
	}




	public void setFfourth_exercise(String ffourth_exercise) {
		this.ffourth_exercise = ffourth_exercise;
	}




	
	
	
	
	
	
	
	

}
