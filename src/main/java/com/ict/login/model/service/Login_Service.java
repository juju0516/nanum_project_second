package com.ict.login.model.service;


import com.ict.member.model.vo.MemberVO;

public interface Login_Service {
	// 로그인
	public MemberVO getMemberLogin(MemberVO mvo);
	
	// 회원가입 
	public int getMemberJoin(MemberVO mvo);
	
	// 회원가입 정보 업데이트
	public int getMemberAdd(MemberVO mvo);
	
	// 아이디 가져오기
	public MemberVO getSignId(String id);
	
	// 아이디 체크하기
	public int checkId(String id);
	
	// 아이디패스워드 검사
	public MemberVO findIdPw(String id);
	
	
}
