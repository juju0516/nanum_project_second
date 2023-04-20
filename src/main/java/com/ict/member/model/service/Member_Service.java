package com.ict.member.model.service;

import java.util.List;

import com.ict.aids.model.vo.Req_AidsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;
import com.ict.project.model.vo.DonatorVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.RegularVO;
import com.ict.special.model.vo.Special_DonateVO;

public interface Member_Service {
	
	public MemberVO getNickname_Name(String id);
	public int getChangeNick(MemberVO mvo);
	public int getChangeProf(MemberVO mvo);
	public int getTotalCount();
	public int getTotalCountInq();
	public int getTotalCountPoint();
	public List<MemberVO> getList(int begin, int end);
	public MemberVO getOneList(String id);
	public int getMemberUpdate(MemberVO mvo);
	public int getInqInsert(InquiryVO iqvo);
	public InquiryVO getInqOneList(int inquiry_idx);
	public List<InquiryVO>getInqList(int begin, int end);
	public int getDeleteInquiry(int inquiry_idx);
	public int getPointInsert(PointVO pvo);
	public List<PointVO>getChangePointList(int begin, int end);
	public List<PointVO> getPointID(String id);
	public int getTotalCountRegular();
	public List<RegularVO> getRegularList(int begin, int end);
	public List<RegularVO> getRegularID(String id);
	public int getTotalCountGoods();
	public List<Goods_SaleVO> getGoodsList(int begin, int end);
	public List<Goods_SaleVO> getGoodsID(String id);
	public List<Req_AidsVO> getReqList(int begin, int end);
	public List<Req_AidsVO> getReqID(String id);
	public int getTotalCountReq();
	public List<Special_DonateVO> getSpecList(int begin, int end);
	public List<Special_DonateVO> getSpecID(String id);
	public int getTotalCountSpec();
	public List<Prj_RegiVO> getRegiList(int begin, int end) ;
	public List<Prj_RegiVO> getRegiID(String id);
	public int getTotalCountRegi();
	public List<DonatorVO> getDNTList(int begin, int end);
	public List<DonatorVO> getDNTID(String id);
	public int getTotalCountDNT();
}
