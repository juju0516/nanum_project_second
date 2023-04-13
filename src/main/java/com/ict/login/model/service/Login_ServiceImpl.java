package com.ict.login.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.login.model.dao.Login_DAO;
import com.ict.member.model.vo.MemberVO;

@Service
public class Login_ServiceImpl implements Login_Service {
	@Autowired
	private Login_DAO login_DAO;

	public void setLogin_DAO(Login_DAO login_DAO) {
		this.login_DAO = login_DAO;
	}

	// 로그인
	@Override
	public MemberVO getMemberLogin(MemberVO mvo) {
		return login_DAO.getMemberLogin(mvo);
	}

	// 회원가입
	@Override
	public int getMemberJoin(MemberVO mvo) {
		return login_DAO.getMemberJoin(mvo);
	}

	// 회원가입 정보 업데이트
	@Override
	public int getMemberAdd(MemberVO mvo) {
		return login_DAO.getMemberAdd(mvo);
	}
	
	// 아이디 가져오기
	@Override
	public MemberVO getSignId(String id) {
		return login_DAO.getSignId(id);
	}
	
	// 아이디 체크하기
	@Override
	public int checkId(String id) {
		return login_DAO.checkId(id);
	}
	
	@Override
	public MemberVO findIdPw(String id) {
		return login_DAO.FindIdPw(id);
	}
	


}
