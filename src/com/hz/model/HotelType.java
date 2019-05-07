package com.hz.model;

public class HotelType {
	
	private int id;
	private String hoteltype;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHoteltype() {
		return hoteltype;
	}
	public void setHoteltype(String hoteltype) {
		this.hoteltype = hoteltype;
	}
	@Override
	public String toString() {
		return "HotelType [id=" + id + ", hoteltype=" + hoteltype + "]";
	}
	

}
