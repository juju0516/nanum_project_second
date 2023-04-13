package com.ict.goods.model.vo;

public class Goods_SaleVO {
	
	private int	goods_sale_idx;
	private int	goods_idx;
	private int	price;
	private int	amount;
	private int	total_price ;
	
	private String id;
	private String goods_code;
	private String goods_name;
	private String goods_f_name;
	private String sale_date;
	private String cancel_date;
	private String cancel_cmpl;
	private String g_s_state;
	private String manager_id;

	
	//getter/ setter
	
	public int getGoods_sale_idx() {
		return goods_sale_idx;
	}

	public void setGoods_sale_idx(int goods_sale_idx) {
		this.goods_sale_idx = goods_sale_idx;
	}

	public int getGoods_idx() {
		return goods_idx;
	}

	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_f_name() {
		return goods_f_name;
	}

	public void setGoods_f_name(String goods_f_name) {
		this.goods_f_name = goods_f_name;
	}

	public String getSale_date() {
		return sale_date;
	}

	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}

	public String getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}

	public String getCancel_cmpl() {
		return cancel_cmpl;
	}

	public void setCancel_cmpl(String cancel_cmpl) {
		this.cancel_cmpl = cancel_cmpl;
	}

	public String getG_s_state() {
		return g_s_state;
	}

	public void setG_s_state(String g_s_state) {
		this.g_s_state = g_s_state;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	

}
