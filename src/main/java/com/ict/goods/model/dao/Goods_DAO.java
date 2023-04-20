package com.ict.goods.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

@Repository
public class Goods_DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	//굿즈 전체 리스트 보기
	public List<GoodsVO> getGoodsList(){
		 return sqlSessionTemplate.selectList("goods.goodsList");
	}
	
	//굿즈 상세내용 보기
	public GoodsVO getGoodsDetail(String goods_idx) {
		return sqlSessionTemplate.selectOne("goods.goodsDetail", goods_idx);
	}
	
	// 굿즈 배송지 변경하기
	public int delivaryUpdate(MemberVO mvo) {
		return sqlSessionTemplate.update("goods.delivaryUpdate", mvo);
	}
	
	
	// 굿즈 결제하기
	public int getGoodsSaleInsert(Goods_SaleVO salevo) {
		return sqlSessionTemplate.insert("goods.goodsSaleInsert", salevo);
	}
	
	/*결제 완료 후 
	 * 1. GOODS CUR_AMOUNT UPDATE (재고수량변경)
	 * 2. MEMBER CUR_POINT UPDATE
	 * 3. POINT 사용내역 INSERT*/
	
	// 1. GOODS CUR_AMOUNT UPDATE (재고수량변경)
	public int getGoodsCurAmountUpdate(GoodsVO gvo) {
		return sqlSessionTemplate.update("goods.goodsCurAmountUpdate", gvo);
	}
	
	// 1. MEMBER CUR_POINT UPDATE
	public int getMemberCurpointUpdate(MemberVO mvo) {
		return sqlSessionTemplate.update("goods.memberCurpointUpdate", mvo);
	}
	
	// 2. POINT 사용내역 INSERT
	public int getSalePointInsert(PointVO pvo) {
		return sqlSessionTemplate.insert("goods.salePointInsert", pvo);
	}
	
	/*멤버정보 가져오기*/
	public MemberVO getmemberInfo(String id) {
		return sqlSessionTemplate.selectOne("goods.memberinfo", id);
	}


}
