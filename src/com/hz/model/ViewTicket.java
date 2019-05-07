package com.hz.model;

public class ViewTicket {
	
	private int id;
	private String tname;
	private String ttype;
	private Float tprice;
	private int sales;
	
	private String viewphoto;
	private String vname;
	private String location;
	private int vreadnum;
	private int vid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	public Float getTprice() {
		return tprice;
	}
	public void setTprice(Float tprice) {
		this.tprice = tprice;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getViewphoto() {
		return viewphoto;
	}
	public void setViewphoto(String viewphoto) {
		this.viewphoto = viewphoto;
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
	public int getVreadnum() {
		return vreadnum;
	}
	public void setVreadnum(int vreadnum) {
		this.vreadnum = vreadnum;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	@Override
	public String toString() {
		return "ViewTicket [id=" + id + ", tname=" + tname + ", ttype=" + ttype + ", tprice=" + tprice + ", sales="
				+ sales + ", viewphoto=" + viewphoto + ", vname=" + vname + ", location=" + location + ", vreadnum="
				+ vreadnum + ", vid=" + vid + "]";
	}
	
	

}
