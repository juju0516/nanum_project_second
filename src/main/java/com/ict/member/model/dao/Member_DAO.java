package com.ict.member.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;

@Repository
public class Member_DAO {
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public MemberVO getNickname_Name(String id) {
		return sqlSessionTemplate.selectOne("member.getnick_name", id);
	}
	public int getChangeNick(MemberVO mvo) {
		return sqlSessionTemplate.update("member.change_nick", mvo);
	}
	public int getChangeProf(MemberVO mvo) {
		return sqlSessionTemplate.update("member.update_prof", mvo);
	}
	
	public int getTotalCoutn() {
		return sqlSessionTemplate.selectOne("member.count");
	}
	public List<MemberVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("member.list", map) ;
	}
	public MemberVO getOneList(String id) {
		return sqlSessionTemplate.selectOne("member.onelist", id);
	}
	
	public int getMemberUpdate(MemberVO mvo) {
		return sqlSessionTemplate.update("member.update", mvo);
	}
	
	public int getInqInsert(InquiryVO iqvo) {
		return sqlSessionTemplate.insert("inquiry.insert", iqvo);
	}
	
	public List<InquiryVO> getInqList(int begin, int end) {
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("begin", begin);
	map.put("end", end);
	return sqlSessionTemplate.selectList("inquiry.list", map);
	}
	
	public InquiryVO getInqOneList(int inquiry_idx) {
	    return sqlSessionTemplate.selectOne("inquiry.onelist_idx", inquiry_idx);
	}
	
	public int getDeleteInquiry(int inquiry_idx) {
		return sqlSessionTemplate.delete("inquiry.delete", inquiry_idx);
	}
}
