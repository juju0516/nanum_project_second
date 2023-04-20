package com.ict.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.MemberVO;

@Repository
public class MngrMemberServiceDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(MngrSearchVO vo) {
		return sqlSessionTemplate.selectOne("manager.mbr_count", vo);
	}
	
	public List<MemberVO> getMemberList(MngrSearchVO vo) {
		return sqlSessionTemplate.selectList("manager.mbr_list", vo);
	}
	
	public MemberVO getMemberOne(String member_idx) {
		return sqlSessionTemplate.selectOne("manager.mbr_one", member_idx);
	}
	
	public int getMemberUpdate(MemberVO vo) {
		return sqlSessionTemplate.update("manager.mbr_update", vo);
	}
	
	public int getMemberUpdateState(String member_idx, String m_state, String manager_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_idx", member_idx);
		map.put("m_state", m_state);
		map.put("manager_id", member_idx);
		
		return sqlSessionTemplate.update("manager.mbr_state", map);
	}
}
