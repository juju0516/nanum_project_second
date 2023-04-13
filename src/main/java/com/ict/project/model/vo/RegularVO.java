package com.ict.project.model.vo;

public class RegularVO {
	private String id, prj_name, r_dnt_date, begin_date;
	private int regular_idx, project_idx, dnt_point, dnt_count;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPrj_name() {
		return prj_name;
	}
	public void setPrj_name(String prj_name) {
		this.prj_name = prj_name;
	}
	public String getR_dnt_date() {
		return r_dnt_date;
	}
	public void setR_dnt_date(String r_dnt_date) {
		this.r_dnt_date = r_dnt_date;
	}
	public String getBegin_date() {
		return begin_date;
	}
	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}
	public int getRegular_idx() {
		return regular_idx;
	}
	public void setRegular_idx(int regular_idx) {
		this.regular_idx = regular_idx;
	}
	public int getProject_idx() {
		return project_idx;
	}
	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}
	public int getDnt_point() {
		return dnt_point;
	}
	public void setDnt_point(int dnt_point) {
		this.dnt_point = dnt_point;
	}
	public int getDnt_count() {
		return dnt_count;
	}
	public void setDnt_count(int dnt_count) {
		this.dnt_count = dnt_count;
	}
	
}
