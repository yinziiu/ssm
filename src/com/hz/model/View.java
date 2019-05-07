package com.hz.model;

public class View {

	private int id;
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
	private int vreadnum;

	private String tname;
	private String booktime;
	private String orderpricerange;
	private int sales;

	private String typename;
	private String price;
	private int vtid;

	public String getViewtype() {
		return viewtype;
	}

	public void setViewtype(String viewtype) {
		this.viewtype = viewtype;
	}

	public int getVreadnum() {
		return vreadnum;
	}

	public void setVreadnum(int vreadnum) {
		this.vreadnum = vreadnum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getViewphoto() {
		return viewphoto;
	}

	public void setViewphoto(String viewphoto) {
		this.viewphoto = viewphoto;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getBooktime() {
		return booktime;
	}

	public void setBooktime(String booktime) {
		this.booktime = booktime;
	}

	public String getOrderpricerange() {
		return orderpricerange;
	}

	public void setOrderpricerange(String orderpricerange) {
		this.orderpricerange = orderpricerange;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "View [id=" + id + ", vname=" + vname + ", location=" + location + ", intro=" + intro + ", usertime="
				+ usertime + ", ticket=" + ticket + ", tips=" + tips + ", opentime=" + opentime + ", viewphoto="
				+ viewphoto + ", viewtype=" + viewtype + ", vreadnum=" + vreadnum + "]";
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public int getVtid() {
		return vtid;
	}

	public void setVtid(int vtid) {
		this.vtid = vtid;
	}

}
