package com.ict.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.aids.model.vo.Req_AidsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.dao.Member_DAO;
import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;
import com.ict.project.model.vo.DonatorVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.RegularVO;
import com.ict.special.model.vo.Special_DonateVO;

@Service
public class Member_ServiceImpl implements Member_Service {
	@Autowired
	private Member_DAO member_DAO;

	public void setMember_DAO(Member_DAO member_DAO) {
		this.member_DAO = member_DAO;
	}

	@Override
	public MemberVO getNickname_Name(String id) {
		return member_DAO.getNickname_Name(id);
	}

	@Override
	public int getChangeNick(MemberVO mvo) {
		return member_DAO.getChangeNick(mvo);
	}

	@Override
	public int getChangeProf(MemberVO mvo) {
		return member_DAO.getChangeProf(mvo);
	}

	@Override
	public int getTotalCount() {
		return member_DAO.getTotalCount();
	}

	@Override
	public List<MemberVO> getList(int begin, int end) {
		return member_DAO.getList(begin, end);
	}

	@Override
	public MemberVO getOneList(String id) {
		return member_DAO.getOneList(id);
	}

	@Override
	public int getMemberUpdate(MemberVO mvo) {
		return member_DAO.getMemberUpdate(mvo);
	}

	@Override
	public int getInqInsert(InquiryVO iqvo) {
		return member_DAO.getInqInsert(iqvo);
	}

	@Override
	public InquiryVO getInqOneList(int inquiry_idx) {
		return member_DAO.getInqOneList(inquiry_idx);
	}

	@Override
	public List<InquiryVO> getInqList(int begin, int end) {
		return member_DAO.getInqList(begin, end);
	}

	@Override
	public int getDeleteInquiry(int inquiry_idx) {
		return member_DAO.getDeleteInquiry(inquiry_idx);
	}

	@Override
	public int getTotalCountInq() {
		return member_DAO.getTotalCountInq();
	}

	@Override
	public int getTotalCountPoint() {
		return member_DAO.getTotalCountPoint();
	}

	@Override
	public int getPointInsert(PointVO pvo) {
		return member_DAO.getPointInsert(pvo);
	}

	@Override
	public List<PointVO> getChangePointList(int begin, int end) {
		return member_DAO.getChangePointList(begin, end);
	}

	@Override
	public List<PointVO> getPointID(String id) {
		return member_DAO.getPointID(id);
	}

	@Override
	public List<RegularVO> getRegularID(String id) {
		return member_DAO.getRegularID(id);
	}

	@Override
	public List<RegularVO> getRegularList(int begin, int end) {
		return member_DAO.getRegularList(begin, end);
	}

	@Override
	public int getTotalCountRegular() {
		return member_DAO.getTotalCountRegular();
	}

	@Override
	public List<Goods_SaleVO> getGoodsID(String id) {
		return member_DAO.getGoodsID(id);
	}

	@Override
	public List<Goods_SaleVO> getGoodsList(int begin, int end) {
		return member_DAO.getGoodsList(begin, end);
	}

	@Override
	public int getTotalCountGoods() {
		return member_DAO.getTotalCountGoods();
	}
	
	@Override
	public List<Req_AidsVO> getReqID(String id) {
		return member_DAO.getReqID(id);
	}
	
	@Override
	public List<Req_AidsVO> getReqList(int begin, int end) {
		return member_DAO.getReqList(begin, end);
	}
	
	@Override
	public int getTotalCountReq() {
		return member_DAO.getTotalCountReq();
	}
	
	@Override
	public List<Special_DonateVO> getSpecID(String id) {
		return member_DAO.getSpecID(id);
	}
	
	@Override
	public List<Special_DonateVO> getSpecList(int begin, int end) {
		return member_DAO.getSpecList(begin, end);
	}
	
	@Override
	public int getTotalCountSpec() {
		return member_DAO.getTotalCountSpec();
	}
	
	@Override
	public List<Prj_RegiVO> getRegiID(String id) {
		return member_DAO.getRegiID(id);
	}
	
	@Override
	public List<Prj_RegiVO> getRegiList(int begin, int end) {
		return member_DAO.getRegiList(begin, end);
	}
	
	@Override
	public int getTotalCountRegi() {
		return member_DAO.getTotalCountRegi();
	}
	
	@Override
	public List<DonatorVO> getDNTID(String id) {
		return member_DAO.getDNTID(id);
	}
	
	@Override
	public List<DonatorVO> getDNTList(int begin, int end) {
		return member_DAO.getDNTList(begin, end);
	}
	
	@Override
	public int getTotalCountDNT() {
		return member_DAO.getTotalCountDNT();
	}
	

}
