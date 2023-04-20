package com.ict.manager.model.vo;

public class MngrSearchVO {
	private int begin, end;
	private String s_range, s_word, s_type, s_state, b_date, e_date;
	
	public void init() {
		s_range = "";
		s_word = "";
		s_type = "";
		s_state = "";
		b_date = "";
		e_date = "";
	}
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
	
	public String getS_range() {
		return s_range;
	}
	public void setS_range(String s_range) {
		this.s_range = s_range;
	}
	public String getS_word() {
		return s_word;
	}
	public void setS_word(String s_word) {
		this.s_word = s_word;
	}
	public String getS_type() {
		return s_type;
	}
	public void setS_type(String s_type) {
		this.s_type = s_type;
	}
	public String getS_state() {
		return s_state;
	}
	public void setS_state(String s_state) {
		this.s_state = s_state;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
}
