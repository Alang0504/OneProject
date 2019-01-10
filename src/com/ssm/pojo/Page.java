package com.ssm.pojo;

import java.util.List;

public class Page<T> {
	

	private int pageNum;//当前页码
	private int itemPerPage=5;//查询当前一页中的项数
	private int totalPage;//总的页数
	private int totalItem;//查询处理的总的个数
	private int fromItem;//从那一项开始查询
	private String selectContent;
	private String selectKey;//查询的关键字，暂时不用
	private List<T> items;//查询出来的数据，T=Custom
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getItemPerPage() {
		return itemPerPage;
	}
	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}
	public String getSelectContent() {
		return selectContent;
	}
	public void setSelectContent(String selectContent) {
		this.selectContent = selectContent;
	}
	public String getSelectKey() {
		return selectKey;
	}
	public void setSelectKey(String selectKey) {
		this.selectKey = selectKey;
	}
	public int getFromItem() {
		return fromItem;
	}
	public void setFromItem(int fromItem) {
		this.fromItem = fromItem;
	}
	public List<T> getItems() {
		return items;
	}
	public void setItems(List<T> items) {
		this.items = items;
	}
	
	
}
