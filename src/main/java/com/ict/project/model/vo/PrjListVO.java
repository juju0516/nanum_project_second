package com.ict.project.model.vo;

public class PrjListVO {
	
	// 카테고리별로 리스트보기 위해 선언 
	private int begin = 0;
	private int end = 0;
	private String prj_category;
	
	
	
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getPrj_category() {
		return prj_category;
	}
	public void setPrj_category(String prj_category) {
		this.prj_category = prj_category;
	}
	
	

}
