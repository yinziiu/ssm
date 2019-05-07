package com.hz.model;

import org.springframework.web.multipart.MultipartFile;

public class HotelRoomType {
	
	private int id;
	private String htype;
	private int hnum;
	private float hprice;
	private int roomtotal;
	private String roomphoto;
	private MultipartFile roomphotoFile;
	
	private int uid;
	private String username;
	private String photo;
	private String resume;
	private String sex;
	private String  birthday;
	private String city;
	private String email;
	
	private int hid;
	private String hname;
	private String address;
	private String phone;
	private String hphoto;
	
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
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	
	public float getHprice() {
		return hprice;
	}
	public void setHprice(float hprice) {
		this.hprice = hprice;
	}
	public int getRoomtotal() {
		return roomtotal;
	}
	public void setRoomtotal(int roomtotal) {
		this.roomtotal = roomtotal;
	}
	public String getRoomphoto() {
		return roomphoto;
	}
	public void setRoomphoto(String roomphoto) {
		this.roomphoto = roomphoto;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public MultipartFile getRoomphotoFile() {
		return roomphotoFile;
	}
	public void setRoomphotoFile(MultipartFile roomphotoFile) {
		this.roomphotoFile = roomphotoFile;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	@Override
	public String toString() {
		return "HotelRoomType [id=" + id + ", htype=" + htype + ", hnum=" + hnum + ", hprice=" + hprice + ", roomtotal="
				+ roomtotal + ", roomphoto=" + roomphoto + ", roomphotoFile=" + roomphotoFile + ", uid=" + uid
				+ ", username=" + username + ", photo=" + photo + ", resume=" + resume + ", sex=" + sex + ", birthday="
				+ birthday + ", city=" + city + ", email=" + email + ", hid=" + hid + ", hname=" + hname + ", address="
				+ address + ", phone=" + phone + ", hphoto=" + hphoto + "]";
	}
	
	
}
