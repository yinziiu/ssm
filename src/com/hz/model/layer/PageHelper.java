package com.hz.model.layer;

public class PageHelper implements java.io.Serializable {

	private int page;			// 当前页
	private int rows;			// 每页显示记录数
	private String sort = null ;// 排序字段名
	private String order = "asc" ;// 按什么排序(asc,desc)
	private int start ;			// 起始页
	private int end ;			// 最终页
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}
