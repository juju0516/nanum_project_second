package com.ict.goods.model.service;

import java.util.List;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

public interface Goods_Service {
	
	// DB 정리 메서드 입력.
	
	// 굿즈 제품 전체 리스트
	public List<GoodsVO> getGoodsList() throws Exception;
	
	// 굿즈 제품 상세보기
	public GoodsVO getGoodsDetail(String goods_idx) throws Exception;
	
	
	// 주소 정보 변경시 업데이트하기 (주소가 없는데 넣을때,)
	public int delivaryUpdate(MemberVO mvo) throws Exception;
	
	
	// 주문 및 결제하기 (Goods_Sale DB 삽입)
	public int getGoodsSaleInsert(Goods_SaleVO salevo) throws Exception;
	
	/* 결제완료시*/ 
	//1. goods cur_amount 수정하기(초기값에서 주문수량만큼 차감)
	public int getGoodsCurAmountUpdate(GoodsVO gvo) throws Exception;
	
	
	//2. member cur_point 수정하기
	public int getMemberCurpointUpdate(MemberVO mvo) throws Exception;
	
	
	//3. Point DB 사용내역 삽입하기
	public int getSalePointInsert(PointVO pvo) throws Exception;
	
	
	
	
	/*멤버 정보 가져오는 것 여기서 미리 하고, 민주씨랑 합치기*/
	public MemberVO getmemberInfo(String id) throws Exception;

}
