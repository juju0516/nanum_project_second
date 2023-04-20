package com.ict.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.manager.model.vo.ManagerVO;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.PointVO;

@Repository
public class GoodsServiceDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int getTotalCount(String g_s_word) {		
		if(g_s_word == null || g_s_word.length() <= 0)
			return sqlSessionTemplate.selectOne("manager.goods_count");
		else
			return sqlSessionTemplate.selectOne("manager.goods_s_count", g_s_word);
	}
	
	public List<GoodsVO> getGoodsList(int begin, int end, String g_s_word) {
		MngrSearchVO vo = new MngrSearchVO();
		vo.setBegin(begin);
		vo.setEnd(end);
		vo.setS_word(g_s_word);
		
		if(g_s_word == null || g_s_word.length() <= 0)
			return sqlSessionTemplate.selectList("manager.goods_list", vo);
		else
			return sqlSessionTemplate.selectList("manager.goods_s_list", vo);
	}
	
	public int getGoodsInsert(GoodsVO vo) {
		return sqlSessionTemplate.insert("manager.goods_ins", vo);
	}
	
	public GoodsVO getGoodsOne(String goods_idx, int mode) {
		if(mode == 1) // goods_idx 로 가져오기
			return sqlSessionTemplate.selectOne("manager.goods_one", goods_idx);
		else // goods_code 로 가져오기
			return sqlSessionTemplate.selectOne("manager.goods_code", goods_idx);
	}
	
	public int getGoodsUpdate(GoodsVO vo) {
		return sqlSessionTemplate.update("manager.goods_update", vo);
	}
	
	// 불필요
	public int getGoodsUpdateHit(String goods_idx) {
		return sqlSessionTemplate.update("manager.goods_hit", goods_idx);
	}
	
	public int getGoodsUpdateState(String goods_idx, String g_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("goods_idx", goods_idx);
		map.put("g_state", g_state);
		
		return sqlSessionTemplate.update("manager.g_state", map);
	}
	
	public int getGoodsUpdateRestoreStock(int goods_idx, int amount) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("goods_idx", goods_idx);
		map.put("amount", amount);
		
		return sqlSessionTemplate.update("manager.goods_stock", map);
	}			
	
	// Goods Sale table
	public int getSaleTotalCount(MngrSearchVO vo) {
		return sqlSessionTemplate.selectOne("manager.g_s_count", vo);
	}
	
	public List<Goods_SaleVO> getGoodsSaleList(MngrSearchVO vo) {
		return sqlSessionTemplate.selectList("manager.g_s_list", vo);
	}
	
	public Goods_SaleVO getGoodsSaleOne(String goods_sale_idx) {
		return sqlSessionTemplate.selectOne("manager.g_s_one", goods_sale_idx);
	}
	
	public int getGoodsSaleUpdateState(String goods_sale_idx, String g_s_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("goods_sale_idx", goods_sale_idx);
		map.put("g_s_state", g_s_state);
		
		return sqlSessionTemplate.update("manager.g_s_state", map);
	}
	
	public int getGoodsSaleUpdateCancel(String goods_sale_idx, String g_s_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("goods_sale_idx", goods_sale_idx);
		map.put("g_s_state", g_s_state);
		
		return sqlSessionTemplate.update("manager.g_s_cancel", map);
	}
	
	// Member
	public int getMemberPoint(String id) throws Exception {
		return sqlSessionTemplate.selectOne("manager.mbr_point", id);
	}
	
	public int getMemberUpdatePoint(String id, String point) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("point", point);
		
		return sqlSessionTemplate.update("manager.mbr_update_point", map);
	}
	
	// Point
	public int getPointInsertRefund(PointVO vo) {
		return sqlSessionTemplate.insert("manager.p_ins_refund", vo);
	}
}
