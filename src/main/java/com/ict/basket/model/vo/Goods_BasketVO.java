package com.ict.basket.model.vo;

public class Goods_BasketVO {
	
	private String id;  
	private String goods_code;
	private String goods_name;
	private String goods_f_name;
	
	private int goods_basket_idx;
	private int goods_idx; 
	private int price;
	private int amount;
	private int delivery_charge;
	
	// getter / setter

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

	public int getGoods_basket_idx() {
		return goods_basket_idx;
	}

	public void setGoods_basket_idx(int goods_basket_idx) {
		this.goods_basket_idx = goods_basket_idx;
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

	public int getDelivery_charge() {
		return delivery_charge;
	}

	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}

}
