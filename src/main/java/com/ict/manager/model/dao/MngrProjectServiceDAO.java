package com.ict.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.ProjectVO;

@Repository
public class MngrProjectServiceDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int getTotalCount(MngrSearchVO vo) {
		return sqlSessionTemplate.selectOne("manager.prj_count", vo);
	}
	
	public List<ProjectVO> getProjectList(MngrSearchVO vo) {
		return sqlSessionTemplate.selectList("manager.prj_list", vo);
	}
	
	public int getProjectInsert(ProjectVO vo) {
		return sqlSessionTemplate.insert("manager.prj_ins", vo);
	}
	
	public ProjectVO getProjectOne(String project_idx) {
		return sqlSessionTemplate.selectOne("manager.prj_one", project_idx);
	}
	
	public int getProjectUpdate(ProjectVO vo) {
		return sqlSessionTemplate.update("manager.prj_update", vo);
	}
	
	public int getProjectUpdateCategory(String project_idx, String prj_category, String manager_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("project_idx", project_idx);
		map.put("prj_category", prj_category);
		map.put("manager_id", manager_id);
		
		return sqlSessionTemplate.update("manager.prj_category", map);
	}
	
	//Project_Regi
	public int getPrjRegiTotalCount(MngrSearchVO vo) {
		return sqlSessionTemplate.selectOne("manager.regi_count", vo);
	}

	public List<Prj_RegiVO> getProjectRegi(MngrSearchVO vo) {
		return sqlSessionTemplate.selectList("manager.regi_list", vo);
	}

	public Prj_RegiVO getProjectRegiOne(String prj_regi_idx) {
		return sqlSessionTemplate.selectOne("manager.regi_one", prj_regi_idx);
	}
	
	public int getProjectRegiUpdate(Prj_RegiVO vo) {
		return sqlSessionTemplate.update("manager.regi_update", vo);
	}
	
	public int getProjectRegiUpdateState(String prj_regi_idx, String p_r_state, String manager_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("prj_regi_idx", prj_regi_idx);
		map.put("p_r_state", p_r_state);
		map.put("manager_id", manager_id);
		
		return sqlSessionTemplate.update("manager.regi_state", map);
	}
	
	// Project Aids
	public int getPrjAidsTotalCount(MngrSearchVO vo) {
		return sqlSessionTemplate.selectOne("manager.aids_count", vo);
	}
	public List<ProjectVO> getProjectAids(MngrSearchVO vo) {
		return sqlSessionTemplate.selectList("manager.aids_list", vo);
	}
	public int getProjectAidsInsert(ProjectVO vo) {
		return sqlSessionTemplate.insert("manager.aids_ins", vo);
	}
	public ProjectVO getProjectAidsOne(String project_idx) {
		return sqlSessionTemplate.selectOne("manager.aids_one", project_idx);
	}
	public int getProjectAidsUpdate(ProjectVO vo) {
		return sqlSessionTemplate.update("manager.aids_update", vo);
	}
	public int getProjectAidsUpdateCategory(String project_idx, String prj_category, String manager_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("project_idx", project_idx);
		map.put("prj_category", prj_category);
		map.put("manager_id", manager_id);
		
		return sqlSessionTemplate.update("manager.aids_category", map);
	}
}
