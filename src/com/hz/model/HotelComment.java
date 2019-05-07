package com.hz.model;

public class HotelComment {
	
	private int id;
	private String username;
	private String photo;
	
	private int hid;
	private String hname;
	private String hphoto;
	
	private String hcomment;
	private String hcommenttime;
	private String hcphoto;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHcomment() {
		return hcomment;
	}
	public void setHcomment(String hcomment) {
		this.hcomment = hcomment;
	}
	public String getHcommenttime() {
		return hcommenttime;
	}
	public void setHcommenttime(String hcommenttime) {
		this.hcommenttime = hcommenttime;
	}
	public String getHphoto() {
		return hphoto;
	}
	public void setHphoto(String hphoto) {
		this.hphoto = hphoto;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHcphoto() {
		return hcphoto;
	}
	public void setHcphoto(String hcphoto) {
		this.hcphoto = hcphoto;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	
}
