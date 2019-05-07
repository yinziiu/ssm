package com.hz.model;

public class Hotel {
	
	private int id;
	private String hname;
	private String address;
	private String phone;
	private String hphoto;
	private String hotelintro;
	private String hoteltype;
	private int hreadnum;
	private float lowprice;
	private int htid;
	public String getHoteltype() {
		return hoteltype;
	}
	public void setHoteltype(String hoteltype) {
		this.hoteltype = hoteltype;
	}
	public int getHreadnum() {
		return hreadnum;
	}
	public void setHreadnum(int hreadnum) {
		this.hreadnum = hreadnum;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHphoto() {
		return hphoto;
	}
	public void setHphoto(String hphoto) {
		this.hphoto = hphoto;
	}
	public String getHotelintro() {
		return hotelintro;
	}
	public void setHotelintro(String hotelintro) {
		this.hotelintro = hotelintro;
	}
	@Override
	public String toString() {
		return "Hotel [id=" + id + ", hname=" + hname + ", address=" + address + ", phone=" + phone + ", hphoto="
				+ hphoto + ", hotelintro=" + hotelintro + ", hoteltype=" + hoteltype + ", hreadnum=" + hreadnum + "]";
	}
	public float getLowprice() {
		return lowprice;
	}
	public void setLowprice(float lowprice) {
		this.lowprice = lowprice;
	}
	public int getHtid() {
		return htid;
	}
	public void setHtid(int htid) {
		this.htid = htid;
	}
	
	
	
	

}
