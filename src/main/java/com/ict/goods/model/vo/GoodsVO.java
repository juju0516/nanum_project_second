package com.ict.goods.model.vo;

public class GoodsVO {
	
	
	private String goods_code;
	private String goods_name;
	private String goods_content;
	private String open_date;
	private String close_date;
	private String g_state, manager_id ;
	
	private String goods_f_name1;
	private String goods_f_name2;
	private String goods_f_name3;
	private String goods_soldout_img;
	private String goods_main_img;

	private int goods_idx;
	private int price;
	private int init_amount;
	private int cur_amount;
	private int goods_hit;
	private int delivery_charge;
	private int delivery_charge_l;

	
	//getter/setter

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

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public String getClose_date() {
		return close_date;
	}

	public void setClose_date(String close_date) {
		this.close_date = close_date;
	}

	public String getG_state() {
		return g_state;
	}

	public void setG_state(String g_state) {
		this.g_state = g_state;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getGoods_f_name1() {
		return goods_f_name1;
	}

	public void setGoods_f_name1(String goods_f_name1) {
		this.goods_f_name1 = goods_f_name1;
	}

	public String getGoods_f_name2() {
		return goods_f_name2;
	}

	public void setGoods_f_name2(String goods_f_name2) {
		this.goods_f_name2 = goods_f_name2;
	}

	public String getGoods_f_name3() {
		return goods_f_name3;
	}

	public void setGoods_f_name3(String goods_f_name3) {
		this.goods_f_name3 = goods_f_name3;
	}

	public String getGoods_soldout_img() {
		return goods_soldout_img;
	}

	public void setGoods_soldout_img(String goods_soldout_img) {
		this.goods_soldout_img = goods_soldout_img;
	}

	public String getGoods_main_img() {
		return goods_main_img;
	}

	public void setGoods_main_img(String goods_main_img) {
		this.goods_main_img = goods_main_img;
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

	public int getInit_amount() {
		return init_amount;
	}

	public void setInit_amount(int init_amount) {
		this.init_amount = init_amount;
	}

	public int getCur_amount() {
		return cur_amount;
	}

	public void setCur_amount(int cur_amount) {
		this.cur_amount = cur_amount;
	}

	public int getGoods_hit() {
		return goods_hit;
	}

	public void setGoods_hit(int goods_hit) {
		this.goods_hit = goods_hit;
	}

	public int getDelivery_charge() {
		return delivery_charge;
	}

	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}

	public int getDelivery_charge_l() {
		return delivery_charge_l;
	}

	public void setDelivery_charge_l(int delivery_charge_l) {
		this.delivery_charge_l = delivery_charge_l;
	}
}
