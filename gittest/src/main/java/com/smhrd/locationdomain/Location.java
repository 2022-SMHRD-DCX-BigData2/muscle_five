package com.smhrd.locationdomain;

public class Location {

	private String loc_add1;
	private String loc_add2;
	private String loc_name;
	private String loc_address;
	private String loc_phone;
	
	
	public String getLoc_add1() {
		return loc_add1;
	}
	public void setLoc_add1(String loc_add1) {
		this.loc_add1 = loc_add1;
	}
	public String getLoc_add2() {
		return loc_add2;
	}
	public void setLoc_add2(String loc_add2) {
		this.loc_add2 = loc_add2;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	public String getLoc_address() {
		return loc_address;
	}
	public void setLoc_address(String loc_address) {
		this.loc_address = loc_address;
	}
	public String getLoc_phone() {
		return loc_phone;
	}
	public void setLoc_phone(String loc_phone) {
		this.loc_phone = loc_phone;
	}
	
	public Location(String loc_add1, String loc_add2, String loc_name, String loc_address, String loc_phone) {
		super();
		this.loc_add1 = loc_add1;
		this.loc_add2 = loc_add2;
		this.loc_name = loc_name;
		this.loc_address = loc_address;
		this.loc_phone = loc_phone;
	}
	
	public Location(String loc_add1, String loc_add2) {
		super();
		this.loc_add1 = loc_add1;
		this.loc_add2 = loc_add2;
	}
	
	
	
	
	
}
