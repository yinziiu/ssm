package com.hz.model;

public class ViewImages {
	
	private int id;
	private int vid;
	private String viewimg;
	private String vname;
	private String location;
	private String intro;
	private String usertime;
	private String ticket;
	private String tips;
	private String opentime;
	private String traffic;
	private String viewphoto;
	private String viewtype;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getUsertime() {
		return usertime;
	}
	public void setUsertime(String usertime) {
		this.usertime = usertime;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getViewphoto() {
		return viewphoto;
	}
	public void setViewphoto(String viewphoto) {
		this.viewphoto = viewphoto;
	}
	public String getViewtype() {
		return viewtype;
	}
	public void setViewtype(String viewtype) {
		this.viewtype = viewtype;
	}
	public String getViewimg() {
		return viewimg;
	}
	public void setViewimg(String viewimg) {
		this.viewimg = viewimg;
	}
	@Override
	public String toString() {
		return "ViewImages [id=" + id + ", vid=" + vid + ", viewimg=" + viewimg + ", vname=" + vname + ", location="
				+ location + ", intro=" + intro + ", usertime=" + usertime + ", ticket=" + ticket + ", tips=" + tips
				+ ", opentime=" + opentime + ", traffic=" + traffic + ", viewphoto=" + viewphoto + ", viewtype="
				+ viewtype + "]";
	}
	
	

}
