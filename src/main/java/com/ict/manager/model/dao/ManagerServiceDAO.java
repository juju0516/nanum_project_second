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
}
