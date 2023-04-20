package com.ict.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.model.vo.PrjListVO;
import com.ict.project.model.vo.ProjectVO;

@Repository
public class ProjectDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public int getTotalCount(String prj_category) {
		return sqlSessionTemplate.selectOne("project.prjList_count", prj_category);
	}
	
	//프로젝트 리스트 전체보기
	public List<ProjectVO> getProjectList(PrjListVO plvo) {
		return sqlSessionTemplate.selectList("project.prjList", plvo);
	}
	
	//ㅍ로젝트 상세보기
	public ProjectVO getProjectDetail(String project_idx) {
		return sqlSessionTemplate.selectOne("project.prjDetatil", project_idx);
	}


}
