package com.ict.basket.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.basket.model.dao.BasketDAO;
import com.ict.basket.model.vo.Goods_BasketVO;
import com.ict.basket.model.vo.Project_BasketVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;

	public void setBasketDAO(BasketDAO basketDAO) {
		this.basketDAO = basketDAO;
	}
//	
//	// 프로젝트바구니
//	@Override
//	public List<Project_BasketVO> getBasketPrjList(String id) throws Exception {
//		// 프로젝트 바구니 리스트
//		return basketDAO.getBasketPrjList(id);
//	}
//	
//	@Override
//	public int getBasketPrjDelete(int project_basket_idx) {
//		// 프로젝트 바구니 삭제하기
//		return basketDAO.getBasketPrjDelete(project_basket_idx);
//	}
//	
//	
//	
//
	// 굿즈바구니
	@Override
	public List<Goods_BasketVO> getBasketGoodsList(String id) throws Exception {
		// 장바구니 리스트 가져오기
		return basketDAO.getBasketGoodsList(id);
	}

	
	@Override
	public Goods_BasketVO getBasketGoodsOne(String id, String goods_idx) throws Exception {
		// id와 제품인덱스? 상품코드?를 가지고 정보 비교해서 바구니에 있는지 없는지 확인 
		return basketDAO.getBasketGoodsOne(id, goods_idx);
	}
	
	@Override
	public int getBasketGoodsInsert(Goods_BasketVO gbvo) throws Exception {
		// 장바구니에 없는 제품이면 추가하기 (insert)
		return basketDAO.getBasketGoodsInsert(gbvo);
	}
	
	@Override
	public int getBasketGoodsUpdate(Goods_BasketVO gbvo) throws Exception {
		// 장바구니에 있는 제품이면 수량만 증가하기(update)
		return basketDAO.getBasketGoodsUpdate(gbvo);
	}
	
//	@Override
//	public int getBasketGoodsEdit(int goods_idx, int amount) throws Exception {
//		// 장바구니에서 수량 수정하기(증가하거나 감소하거나(1까지))
//		return basketDAO.getBasketGoodsEdit(goods_idx, amount);
//	}
//	
//	@Override
//	public int getBasketGoodsDelete(int goods_basket_idx) throws Exception {
//		// 장바구니에서 물품 삭제하기
//		return basketDAO.getBasketGoodsDelete(goods_basket_idx);
//	}
//

}
