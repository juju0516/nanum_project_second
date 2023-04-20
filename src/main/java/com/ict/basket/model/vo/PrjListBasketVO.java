package com.ict.basket.model.vo;

public class PrjListBasketVO {
	
	//Project_BasketVO
	private int project_basket_idx;
	private String id;
	private String dnt_flag;
	private String vlt_flag;
	private String prj_f_name;
	private int project_idx;
	private int p_dnt_point;
	
	
	//project VO에 있는 부분,
	private String	prj_title;
	private int		r_cur_point;
	private int		goal_point;
	private int		cur_point;
	private String	prj_end_date;
	private String	prj_begin_date;
	public int getProject_basket_idx() {
		return project_basket_idx;
	}
	public void setProject_basket_idx(int project_basket_idx) {
		this.project_basket_idx = project_basket_idx;
	}
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
	public String getPrj_f_name() {
		return prj_f_name;
	}
	public void setPrj_f_name(String prj_f_name) {
		this.prj_f_name = prj_f_name;
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
	public String getPrj_title() {
		return prj_title;
	}
	public void setPrj_title(String prj_title) {
		this.prj_title = prj_title;
	}
	public int getR_cur_point() {
		return r_cur_point;
	}
	public void setR_cur_point(int r_cur_point) {
		this.r_cur_point = r_cur_point;
	}
	public int getGoal_point() {
		return goal_point;
	}
	public void setGoal_point(int goal_point) {
		this.goal_point = goal_point;
	}
	public int getCur_point() {
		return cur_point;
	}
	public void setCur_point(int cur_point) {
		this.cur_point = cur_point;
	}
	public String getPrj_end_date() {
		return prj_end_date;
	}
	public void setPrj_end_date(String prj_end_date) {
		this.prj_end_date = prj_end_date;
	}
	public String getPrj_begin_date() {
		return prj_begin_date;
	}
	public void setPrj_begin_date(String prj_begin_date) {
		this.prj_begin_date = prj_begin_date;
	}

	
	
}
