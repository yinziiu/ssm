package com.hz.model;

import org.springframework.web.multipart.MultipartFile;

public class ViewComment {
	private int id;
	private int vid;
	private int uid;
	
	private String username;
	private String photo;
	
	private String vname;
	private int vreadnum;
	private String viewphoto;
	
	private String vcomment;
	private String vcommenttime;
	private String vphoto;
	private MultipartFile vphotopic;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVcomment() {
		return vcomment;
	}
	public void setVcomment(String vcomment) {
		this.vcomment = vcomment;
	}
	public String getVcommenttime() {
		return vcommenttime;
	}
	public void setVcommenttime(String vcommenttime) {
		this.vcommenttime = vcommenttime;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public int getVreadnum() {
		return vreadnum;
	}
	public void setVreadnum(int vreadnum) {
		this.vreadnum = vreadnum;
	}
	public String getViewphoto() {
		return viewphoto;
	}
	public void setViewphoto(String viewphoto) {
		this.viewphoto = viewphoto;
	}
	@Override
	public String toString() {
		return "ViewComment [id=" + id + ", vid=" + vid + ", username=" + username + ", photo=" + photo + ", vname="
				+ vname + ", vreadnum=" + vreadnum + ", vcomment=" + vcomment + ", vcommenttime=" + vcommenttime
				+ ", viewphoto=" + viewphoto + "]";
	}
	public String getVphoto() {
		return vphoto;
	}
	public void setVphoto(String vphoto) {
		this.vphoto = vphoto;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public MultipartFile getVphotopic() {
		return vphotopic;
	}
	public void setVphotopic(MultipartFile vphotopic) {
		this.vphotopic = vphotopic;
	}
	
	
	
	
}
