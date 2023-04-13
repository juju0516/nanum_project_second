package com.ict.basket.model.service;

import java.util.List;
import com.ict.basket.model.vo.Goods_BasketVO;
import com.ict.basket.model.vo.Project_BasketVO;

public interface BasketService {
//
//	
//	/* 프로젝트 바구니 */
//	/* 1. 프로젝트 바구니 전체 리스트보기 */
//	public List<Project_BasketVO> getBasketPrjList(String id) throws Exception;
//	
//	/* 2. 프로젝트 삭제하기 */
//	public int getBasketPrjDelete(int project_basket_idx);
//	
//	/* 참여하기 버튼 누르면, 프로젝트 컨트롤러에서 포인트 결제를 시행한다. 여기가 아니다.*/
//	
//	
//	
	/* 굿즈 바구니 */
	/* 1. 굿즈 바구니 전체 리스트보기 */
	public List<Goods_BasketVO> getBasketGoodsList(String id) throws Exception;
	
	// id와 제품인덱스를 가지고 정보 비교해서  바구니에 있는지 없는지 확인하고 
	public Goods_BasketVO getBasketGoodsOne(String id, String goods_idx) throws Exception;

	/* 2. 없으면! 굿즈 바구니 추가하기 */ 
	public int getBasketGoodsInsert(Goods_BasketVO gbvo) throws Exception;
	
	/* 2-1. 있으면 굿즈 바구니 수량 증가하기 */  
	public int getBasketGoodsUpdate(Goods_BasketVO gbvo) throws Exception;
	
//	/* 3. 굿즈 수량 수정하기 */
//	 public int getBasketGoodsEdit(int goods_idx, int amount) throws Exception;
//	
//	/* 4. 굿즈 바구시 삭제하기 */
//	 public int getBasketGoodsDelete(int goods_basket_idx) throws Exception;
//	
//	
}
 