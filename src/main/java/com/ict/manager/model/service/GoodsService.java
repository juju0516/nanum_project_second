package com.ict.manager.model.service;

import java.util.List;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.PointVO;

public interface GoodsService {
	public int           	getTotalCount() throws Exception;
	public List<GoodsVO>	getGoodsList(int begin, int end) throws Exception;
	public GoodsVO       	getGoodsOne(String goods_idx) throws Exception;
	public GoodsVO       	getGoodsOneByCode(String goods_code) throws Exception;
	public int			 	getGoodsInsert(GoodsVO mvo) throws Exception;
	public int			 	getGoodsUpdate(GoodsVO mvo) throws Exception;
	public int			 	getGoodsUpdateState(String goods_idx, String g_state) throws Exception;
	public int           	getGoodsUpdateHit(String goods_idx) throws Exception;
	public int				getGoodsUpdateRestoreStock(int goods_idx, int amount) throws Exception;
	
	public int           	  	getSaleTotalCount() throws Exception;
	public List<Goods_SaleVO>	getGoodsSaleList(int begin, int end) throws Exception;
	public Goods_SaleVO    	  	getGoodsSaleOne(String goods_sale_idx) throws Exception;
	public int			 	  	getGoodsSaleUpdateState(String goods_sale_idx, String g_s_state) throws Exception;
	public int			 	  	getGoodsSaleUpdateCancel(String goods_sale_idx, String g_s_state) throws Exception;
	
	public int 				getMemberPoint(String id) throws Exception;
	public int				getMemberUpdatePoint(String id, String point) throws Exception;
	
	public int 				getPointInsertRefund(PointVO vo);
}
