package com.hz.model;

public class ViewOrder {
	
	//用户
	private int uid;
	private String username;
	private String photo;
	private String resume;
	private String sex;
	private String  birthday;
	private String city;
	private String email;
	
	//景点
	private int vid;
	private String vname;
	private String viewphoto;
	
	//门票
	private int vtid;
	private String tname;
	private String ttype;
	private float tprice;
	private int sales;
	
	//订单
	private int id;
	private String tratime;
	private String booktime;
	private int ordertotal;
	private String bookname;
	private String bookphone;
	private String remark;
	private String ordernumber;
	private String status;
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
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getViewphoto() {
		return viewphoto;
	}
	public void setViewphoto(String viewphoto) {
		this.viewphoto = viewphoto;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
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
	public float getTprice() {
		return tprice;
	}
	public void setTprice(float tprice) {
		this.tprice = tprice;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTratime() {
		return tratime;
	}
	public void setTratime(String tratime) {
		this.tratime = tratime;
	}
	public String getBooktime() {
		return booktime;
	}
	public void setBooktime(String booktime) {
		this.booktime = booktime;
	}
	public int getOrdertotal() {
		return ordertotal;
	}
	public void setOrdertotal(int ordertotal) {
		this.ordertotal = ordertotal;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookphone() {
		return bookphone;
	}
	public void setBookphone(String bookphone) {
		this.bookphone = bookphone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getVtid() {
		return vtid;
	}
	public void setVtid(int vtid) {
		this.vtid = vtid;
	}
	
	
	
}
