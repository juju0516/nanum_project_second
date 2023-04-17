package com.ict.member.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.member.model.dao.Member_DAO;
import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

@Service
public class Member_ServiceImpl implements Member_Service{
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
	
}
