package com.ict.project.model.service;

import java.util.List;

import com.ict.project.model.vo.PrjListVO;
import com.ict.project.model.vo.ProjectVO;

public interface ProjectService {
	
	// 전체 게시글의 수 (페이징처리시 필요)
	public int getTotalCount(String prj_category) throws Exception;
	
	// 프로젝트 리스트 보기 
	public List<ProjectVO> getProjectList(PrjListVO plvo) throws Exception;
	
	
	// 프로젝트 상세보기 
	public ProjectVO getProjectDetail(String project_idx) throws Exception;
	
	
	// 프로젝트 결과보기? -> 지난 프로젝트 카테고리거나, 스토리에 올라가거나.?
	

	// 프로젝트 관심리스트 등록
	
	// 프로젝트 관심리스트 해제
}
