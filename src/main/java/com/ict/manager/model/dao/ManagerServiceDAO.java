package com.ict.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.model.vo.ManagerVO;

@Repository
public class ManagerServiceDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("manager.mngr_count");
	}
	
	public List<ManagerVO> getManagerList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		return sqlSessionTemplate.selectList("manager.mngr_list", map);
	}
	
	public int getManagerInsert(ManagerVO mvo) {
		return sqlSessionTemplate.insert("manager.mngr_ins", mvo);
	}
	
	public ManagerVO getManagerOne(String manager_id) {
		return sqlSessionTemplate.selectOne("manager.mngr_one", manager_id);
	}
	
	public int getManagerUpdate(ManagerVO mvo) {
		return sqlSessionTemplate.update("manager.mngr_update", mvo);
	}
	
	public int getManagerUpdateState(String manager_idx, String manager_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("manager_idx", manager_idx);
		map.put("manager_state", manager_state);
		
		return sqlSessionTemplate.update("manager.mngr_state", map);
	}
	
	// alarm
	public int getPointStateCount(String p_state) {
		return sqlSessionTemplate.selectOne("manager.p_state_cnt", p_state);
	}
	public int getPrjRegiStateCount(String p_r_state) {
		return sqlSessionTemplate.selectOne("manager.p_r_state_cnt", p_r_state);
	}
	public int getGoodsSaleStateCount(String g_s_state) {
		return sqlSessionTemplate.selectOne("manager.g_s_state_cnt", g_s_state);
	}
	public int getReqAidsStateCount(String req_state) {
		return sqlSessionTemplate.selectOne("manager.req_state_cnt", req_state);
	}
	public int getInquiryStateCount(String inq_state) {
		return sqlSessionTemplate.selectOne("manager.inq_state_cnt", inq_state);
	}
}
