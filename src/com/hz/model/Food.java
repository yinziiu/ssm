package com.hz.model;

public class Food {
	
	private int id;
	private String fname;
	private String address;
	private String fcontent;
	private String expense;
	private String fphoto;
	private int freadnum;
	
	private String username;
	private String photo;
	
	private String fcomment;
	private String fcommenttime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public String getFphoto() {
		return fphoto;
	}
	public void setFphoto(String fphoto) {
		this.fphoto = fphoto;
	}
	public int getFreadnum() {
		return freadnum;
	}
	public void setFreadnum(int freadnum) {
		this.freadnum = freadnum;
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
	public String getFcomment() {
		return fcomment;
	}
	public void setFcomment(String fcomment) {
		this.fcomment = fcomment;
	}
	public String getFcommenttime() {
		return fcommenttime;
	}
	public void setFcommenttime(String fcommenttime) {
		this.fcommenttime = fcommenttime;
	}
	@Override
	public String toString() {
		return "Food [id=" + id + ", fname=" + fname + ", address=" + address + ", fcontent=" + fcontent + ", expense="
				+ expense + ", fphoto=" + fphoto + ", freadnum=" + freadnum + ", username=" + username + ", photo="
				+ photo + ", fcomment=" + fcomment + ", fcommenttime=" + fcommenttime + "]";
	}
	
	

}
