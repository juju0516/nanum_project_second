package com.ict.basket.model.vo;

public class Project_BasketVO {
	
	private String id;
	private String dnt_flag;
	private String vlt_flag;
	private String prj_f_name;
	
	private int project_basket_idx;
	private int project_idx;
	private int p_dnt_point;
	

	// getter / setter

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDnt_flag() {
		return dnt_flag;
	}

	public void setDnt_flag(String dnt_flag) {
		this.dnt_flag = dnt_flag;
	}

	public String getVlt_flag() {
		return vlt_flag;
	}

	public void setVlt_flag(String vlt_flag) {
		this.vlt_flag = vlt_flag;
	}

	public int getProject_basket_idx() {
		return project_basket_idx;
	}

	public void setProject_basket_idx(int project_basket_idx) {
		this.project_basket_idx = project_basket_idx;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public int getP_dnt_point() {
		return p_dnt_point;
	}

	public void setP_dnt_point(int p_dnt_point) {
		this.p_dnt_point = p_dnt_point;
	}

	public String getPrj_f_name() {
		return prj_f_name;
	}

	public void setPrj_f_name(String prj_f_name) {
		this.prj_f_name = prj_f_name;
	}
}
