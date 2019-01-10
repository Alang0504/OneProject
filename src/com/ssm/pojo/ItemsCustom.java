package com.ssm.pojo;

import org.springframework.web.multipart.MultipartFile;

public class ItemsCustom extends Items{
	private String queryName;
	private String queryMin;
	private String queryMax;
	private MultipartFile pictureFile;
	public MultipartFile getPictureFile() {
		return pictureFile;
	}
	public void setPictureFile(MultipartFile pictureFile) {
		this.pictureFile = pictureFile;
	}
	public String getQueryName() {
		return queryName;
	}
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	public String getQueryMin() {
		return queryMin;
	}
	public void setQueryMin(String queryMin) {
		this.queryMin = queryMin;
	}
	public String getQueryMax() {
		return queryMax;
	}
	public void setQueryMax(String queryMax) {
		this.queryMax = queryMax;
	}
	
	
}
