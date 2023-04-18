package com.ict.login.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.member.model.vo.MemberVO;

@Repository
public class Login_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 로그인
	public MemberVO getMemberLogin(MemberVO mvo) {
		return sqlSessionTemplate.selectOne("login_mapper.login", mvo);
	}
	
	// 회원가입
	public int getMemberJoin(MemberVO mvo) {
		return sqlSessionTemplate.insert("login_mapper.sign_up", mvo);
	}
	
	// 회원가입 정보 업데이트
	public int getMemberAdd(MemberVO mvo) {
		return sqlSessionTemplate.update("login_mapper.update", mvo);
	}
	
	// 아이디 가져오기
	public MemberVO getSignId(String id) {
		return sqlSessionTemplate.selectOne("login_mapper.getid", id);
	}
	
	// 아이디 체크하기
	public int checkId(String id) {
		return sqlSessionTemplate.selectOne("login_mapper.checkid", id);
	}
	
	// 아이디패스워드 검사
	public MemberVO FindIdPw(String id) {
		return sqlSessionTemplate.selectOne("login_mapper.dologin", id);
	}
	
	// 패스워드 가져오기
	public MemberVO FindPw(String pw) {
		return sqlSessionTemplate.selectOne("login_mapper.dogetpw", pw);
	}
	
	// 폰번호로 아이디찾기
	public MemberVO FindId_Phone(String id) {
		return sqlSessionTemplate.selectOne("login_mapper.find_id_phone", id);
	}
	
	// 폰번호로 비번찾기
	public MemberVO FindPw_Phone(String pw) {
		return sqlSessionTemplate.selectOne("login_mapper.find_pw_phone", pw);
	}
	
	// 이메일로 아이디찾기
	public MemberVO FindId_Email(String id) {
		return sqlSessionTemplate.selectOne("login_mapper.find_id_email", id);
	}
	
	// 이메일로 비번찾기
	public MemberVO FindPw_Email(String pw) {
		return sqlSessionTemplate.selectOne("login_mapper.find_pw_email", pw);
	}
	
}
