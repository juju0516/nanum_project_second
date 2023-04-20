package com.ict.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.model.dao.MngrProjectServiceDAO;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.ProjectVO;

@Service
public class MngrProjectServiceImpl implements MngrProjectService {
	@Autowired
	MngrProjectServiceDAO prjServiceDAO;
	
	@Override
	public int getTotalCount(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getTotalCount(vo);
	}
	
	@Override
	public List<ProjectVO> getProjectList(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getProjectList(vo);
	}
	
	@Override
	public ProjectVO getProjectOne(String project_idx) throws Exception {
		return prjServiceDAO.getProjectOne(project_idx); 
	}
	
	@Override
	public int getProjectInsert(ProjectVO vo) throws Exception {
		return prjServiceDAO.getProjectInsert(vo);
	}
	
	@Override
	public int getProjectUpdate(ProjectVO vo) throws Exception {
		return prjServiceDAO.getProjectUpdate(vo);
	}

	@Override
	public int getProjectUpdateCategory(String project_idx, String prj_category, String manager_id) throws Exception {
		return prjServiceDAO.getProjectUpdateCategory(project_idx, prj_category, manager_id);
	}
	
	// Project_Regi 
	@Override
	public int getPrjRegiTotalCount(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getPrjRegiTotalCount(vo);
	}
	@Override
	public List<Prj_RegiVO> getProjectRegi(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getProjectRegi(vo);
	}
	@Override
	public Prj_RegiVO getProjectRegiOne(String prj_regi_idx) throws Exception {
		return prjServiceDAO.getProjectRegiOne(prj_regi_idx);
	}
	@Override
	public int getProjectRegiUpdate(Prj_RegiVO vo) throws Exception {
		return prjServiceDAO.getProjectRegiUpdate(vo);
	}
	@Override
	public int getProjectRegiUpdateState(String prj_regi_idx, String p_r_state, String manager_id) throws Exception {
		return prjServiceDAO.getProjectRegiUpdateState(prj_regi_idx, p_r_state, manager_id);
	}
	
	// Projct Aids
	@Override
	public int getPrjAidsTotalCount(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getPrjAidsTotalCount(vo);
	}
	@Override
	public List<ProjectVO> getProjectAids(MngrSearchVO vo) throws Exception {
		return prjServiceDAO.getProjectAids(vo);
	}
	@Override
	public int getProjectAidsInsert(ProjectVO vo) throws Exception {
		return prjServiceDAO.getProjectAidsInsert(vo);
	}
	@Override
	public ProjectVO getProjectAidsOne(String project_idx) throws Exception {
		return prjServiceDAO.getProjectAidsOne(project_idx);
	}
	@Override
	public int getProjectAidsUpdate(ProjectVO vo) throws Exception {
		return prjServiceDAO.getProjectAidsUpdate(vo);
	}
	@Override
	public int getProjectAidsUpdateCategory(String project_idx, String prj_category, String manager_id) throws Exception {
		return prjServiceDAO.getProjectAidsUpdateCategory(project_idx, prj_category, manager_id);
	}
}
