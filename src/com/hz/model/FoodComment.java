package com.hz.model;

public class FoodComment {
	
	private int uid;
	private String username;
	private String photo;
	
	private int fid;
	private String fname;
	private String fphoto;
	
	private int id;
	private String fcomment;
	private String fcommenttime;
	private String fcphoto;
	
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
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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
	public String getFphoto() {
		return fphoto;
	}
	public void setFphoto(String fphoto) {
		this.fphoto = fphoto;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFcphoto() {
		return fcphoto;
	}
	public void setFcphoto(String fcphoto) {
		this.fcphoto = fcphoto;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "FoodComment [uid=" + uid + ", username=" + username + ", photo=" + photo + ", fid=" + fid + ", fname="
				+ fname + ", fphoto=" + fphoto + ", id=" + id + ", fcomment=" + fcomment + ", fcommenttime="
				+ fcommenttime + ", fcphoto=" + fcphoto + "]";
	}
	
	
	
}
