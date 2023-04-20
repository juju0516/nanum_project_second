package com.ict.project.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.model.dao.ProjectDAO;
import com.ict.project.model.vo.PrjListVO;
import com.ict.project.model.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	ProjectDAO projectDAO;
	
	@Override
	public int getTotalCount(String prj_category) throws Exception {
		return projectDAO.getTotalCount(prj_category);
	}

	// 프로젝트 리스트보기
	@Override
	public List<ProjectVO> getProjectList(PrjListVO plvo) throws Exception {
		return projectDAO.getProjectList(plvo);
	}

	// 프로젝트 상세보기
	@Override
	public ProjectVO getProjectDetail(String project_idx) throws Exception {
		return projectDAO.getProjectDetail(project_idx);
	}

	
	

}
