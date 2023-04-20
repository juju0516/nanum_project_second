package com.ict.basket.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.basket.model.vo.Goods_BasketVO;
import com.ict.basket.model.vo.PrjListBasketVO;
import com.ict.basket.model.vo.Project_BasketVO;

@Repository
public class BasketDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	// 프로젝트바구니 전체 리스트보기
//	public List<Project_BasketVO> getBasketPrjList(PrjListBasketVO plistbvo){
//		return sqlSessionTemplate.selectList("basket.basket_prjlist", plistbvo);
//	}
	
	public List<PrjListBasketVO> getBasketPrjList(String id) {
		return sqlSessionTemplate.selectList("basket.basket_prjlist", id);
	}
	
	
	
	
	// 프로젝트바구니 삭제 하기 
	public int getBasketPrjDelete(int project_basket_idx) {
		return sqlSessionTemplate.delete("basket.basket_prjdelete", project_basket_idx);
	}
	
	
	
	// 굿즈바구니 전체 리스트보기
	public List<Goods_BasketVO> getBasketGoodsList(String id){
		return sqlSessionTemplate.selectList("basket.basket_goodslist", id);
	}
	
	// 로그인한 id의 장바구니에 동일 제품이 있는지 확인하기
	public Goods_BasketVO getBasketGoodsOne(String id, String goods_idx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("goods_idx", goods_idx);
		return sqlSessionTemplate.selectOne("basket.basket_goodsone", map);
	}

	// 장바구니에 없다면 제품 추가하기
	public int getBasketGoodsInsert(Goods_BasketVO gbvo) {
		return sqlSessionTemplate.insert("basket.basket_goodsinsert", gbvo);
	}
	
	//이미 있는 제품이면 수량만 증가시키기
	public int getBasketGoodsUpdate(Goods_BasketVO gbvo) {
		return sqlSessionTemplate.update("basket.basket_goodsupdate", gbvo);
	}
	
	// 굿즈바구니에서 수량 수정하기
	public int getBasketGoodsEdit(String goods_basket_idx, String amount) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("goods_basket_idx", goods_basket_idx);
		map.put("amount", amount);
		return sqlSessionTemplate.update("basket.basket_goodsedit", map);
	}
	
	// 굿즈바구니 목록에서 삭제하기
	public int getBasketGoodsDelete(String goods_basket_idx) {
		return sqlSessionTemplate.delete("basket.basket_goodsdelete", goods_basket_idx);
	}
	
	
	/* 굿즈바구니에서 다중선택하여 주문시 굿즈 정보확인 : goods_basket_idx 로 확인하자 */
	public Goods_BasketVO getBasketGoodsOneList(String goods_basket_idx) {
		return sqlSessionTemplate.selectOne("basket.BasketGoodsOneList", goods_basket_idx);
	}

}
