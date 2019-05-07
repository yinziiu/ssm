package com.hz.model;

public class Notes {
	
	private int id;
	
	private int uid;
	private String username;
	private String photo;
	
	private String notesname;
	private String notescomment;
	private String notesphoto;
	private String notestime;
	private int nreadnum;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNotesname() {
		return notesname;
	}
	public void setNotesname(String notesname) {
		this.notesname = notesname;
	}
	public String getNotescomment() {
		return notescomment;
	}
	public void setNotescomment(String notescomment) {
		this.notescomment = notescomment;
	}
	public String getNotesphoto() {
		return notesphoto;
	}
	public void setNotesphoto(String notesphoto) {
		this.notesphoto = notesphoto;
	}
	public String getNotestime() {
		return notestime;
	}
	public void setNotestime(String notestime) {
		this.notestime = notestime;
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
	public int getNreadnum() {
		return nreadnum;
	}
	public void setNreadnum(int nreadnum) {
		this.nreadnum = nreadnum;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Notes [id=" + id + ", uid=" + uid + ", username=" + username + ", photo=" + photo + ", notesname="
				+ notesname + ", notescomment=" + notescomment + ", notesphoto=" + notesphoto + ", notestime="
				+ notestime + ", nreadnum=" + nreadnum + "]";
	}
	
	

}
