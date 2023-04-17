package com.ict.member.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

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
	
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("member.count");
	}
	public int getTotalCountInq() {
		return sqlSessionTemplate.selectOne("inquiry.count");
	}
	public int getTotalCountPoint() {
		return sqlSessionTemplate.selectOne("point.count");
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
	
	public int getPointInsert(PointVO pvo) {
		return sqlSessionTemplate.insert("point.insert_point", pvo);
	}
	
	public List<PointVO> getChangePointList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("point.point_list", map);
	}
	public List<PointVO> getPointID(String id) {
		return sqlSessionTemplate.selectList("point.getpoint_id", id);
	}
}
