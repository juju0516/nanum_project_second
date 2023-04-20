package com.ict.goods.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.basket.controller.BasketController;
import com.ict.goods.model.dao.Goods_DAO;
import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

@Service
public class Goods_ServieImpl implements Goods_Service {

	
	@Autowired
	Goods_DAO goods_DAO;

	public void setGoods_DAO(Goods_DAO goods_DAO) {
		this.goods_DAO = goods_DAO;
	}
	
	// 굿즈 전체 리스트 보기
	@Override
	public List<GoodsVO> getGoodsList() throws Exception {
		return goods_DAO.getGoodsList();
	}
//	@Override
//	public List<GoodsVO> getGoodsList(int begin, int end) throws Exception {
//		return goods_DAO.getGoodsList(begin, end);
//	}
	
	// 굿즈 상세내용 보기
	@Override
	public GoodsVO getGoodsDetail(String goods_idx) throws Exception {
		return goods_DAO.getGoodsDetail(goods_idx);
	}
	
	// 주소 변경(최근배송지, 기본배송지)
	@Override
	public int delivaryUpdate(MemberVO mvo) throws Exception {
		return goods_DAO.delivaryUpdate(mvo);
	}

	// 굿즈 결제 하기
	@Override
	public int getGoodsSaleInsert(Goods_SaleVO salevo) throws Exception {
		return goods_DAO.getGoodsSaleInsert(salevo);
	}
	
	/*결제 완료 후 
	 * 1. GOODS CUR_AMOUNT UPDATE (재고수량변경)
	 * 2. MEMBER CUR_POINT UPDATE
	 * 3. POINT 사용내역 INSERT*/
	
	// 1. GOODS CUR_AMOUNT UPDATE (재고수량변경)
	@Override
	public int getGoodsCurAmountUpdate(GoodsVO gvo) throws Exception {
		return goods_DAO.getGoodsCurAmountUpdate(gvo);
	}
	
	
	// 2. MEMBER CUR_POINT UPDATE
	
	@Override
	public int getMemberCurpointUpdate(MemberVO mvo) throws Exception {
		return goods_DAO.getMemberCurpointUpdate(mvo);
	}
	
	// 3. POINT 사용내역 INSERT(카테코리, 보유포인트, 차감포인트, 차감날짜)
	@Override
	public int getSalePointInsert(PointVO pvo) throws Exception {
		return goods_DAO.getSalePointInsert(pvo);
	}
	
	
	/*멤버 정보 가져오기*/
	@Override
	public MemberVO getmemberInfo(String id) throws Exception {
		return goods_DAO.getmemberInfo(id);
	}
	
}
