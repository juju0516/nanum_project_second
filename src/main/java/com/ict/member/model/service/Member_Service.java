package com.ict.member.model.service;

import java.util.List;

import com.ict.member.model.vo.MemberVO;

public interface Member_Service {
	
	public MemberVO getNickname_Name(String id);
	public int getChangeNick(MemberVO mvo);
	public int getChangeProf(MemberVO mvo);
	public int getTotalCount();
	public List<MemberVO> getList(int begin, int end);
	public MemberVO getOneList(String id);
	public int getMemberUpdate(MemberVO mvo);
	
}
