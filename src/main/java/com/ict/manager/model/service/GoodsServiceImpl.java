package com.ict.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.manager.model.dao.GoodsServiceDAO;
import com.ict.member.model.vo.PointVO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	GoodsServiceDAO goodsServiceDAO;
	
	@Override
	public int getTotalCount() throws Exception {
		return goodsServiceDAO.getTotalCount();
	}
	
	@Override
	public List<GoodsVO> getGoodsList(int begin, int end) throws Exception {
		return goodsServiceDAO.getGoodsList(begin, end);
	}
	
	@Override
	public GoodsVO getGoodsOne(String goods_idx) throws Exception {
		return goodsServiceDAO.getGoodsOne(goods_idx, 1); // 1: idx 검색
	}

	@Override
	public GoodsVO getGoodsOneByCode(String goods_code) throws Exception {
		return goodsServiceDAO.getGoodsOne(goods_code, 2); // 2: code 검색
	}
	
	@Override
	public int getGoodsInsert(GoodsVO vo) throws Exception {
		return goodsServiceDAO.getGoodsInsert(vo);
	}
	
	@Override
	public int getGoodsUpdate(GoodsVO vo) throws Exception {
		return goodsServiceDAO.getGoodsUpdate(vo);
	}
	
	@Override
	public int getGoodsUpdateHit(String goods_idx) throws Exception {
		return goodsServiceDAO.getGoodsUpdateHit(goods_idx);
	}

	@Override
	public int getGoodsUpdateState(String goods_idx, String g_state) throws Exception {
		return goodsServiceDAO.getGoodsUpdateState(goods_idx, g_state);
	}
	
	@Override
	public int getGoodsUpdateRestoreStock(int goods_idx, int amount) throws Exception {
		return goodsServiceDAO.getGoodsUpdateRestoreStock(goods_idx, amount);
	}
	
	// Goods Sale
	@Override
	public int getSaleTotalCount() throws Exception {
		return goodsServiceDAO.getSaleTotalCount();
	}
	
	@Override
	public List<Goods_SaleVO> getGoodsSaleList(int begin, int end) throws Exception {
		return goodsServiceDAO.getGoodsSaleList(begin, end);
	}
	
	@Override
	public Goods_SaleVO getGoodsSaleOne(String goods_sale_idx) throws Exception {
		return goodsServiceDAO.getGoodsSaleOne(goods_sale_idx);
	}
	
	@Override
	public int getGoodsSaleUpdateState(String goods_sale_idx, String g_s_state) throws Exception {
		return goodsServiceDAO.getGoodsSaleUpdateState(goods_sale_idx, g_s_state);
	}
	
	@Override
	public int getGoodsSaleUpdateCancel(String goods_sale_idx, String g_s_state) throws Exception {
		return goodsServiceDAO.getGoodsSaleUpdateCancel(goods_sale_idx, g_s_state);
	}
	
	// Member 
	@Override
	public int getMemberPoint(String id) throws Exception {
		return goodsServiceDAO.getMemberPoint(id);
	}
	
	@Override
	public int getMemberUpdatePoint(String id, String point) throws Exception {
		return goodsServiceDAO.getMemberUpdatePoint(id, point);
	}
	
	// Point
	@Override
	public int getPointInsertRefund(PointVO vo) {
		return goodsServiceDAO.getPointInsertRefund(vo);
	}
}
