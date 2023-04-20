package com.ict.manager.model.service;

import java.util.List;

import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.PointVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.ProjectVO;

public interface MngrProjectService {
	public int           	getTotalCount(MngrSearchVO vo) throws Exception;
	public List<ProjectVO>	getProjectList(MngrSearchVO vo) throws Exception;
	public ProjectVO    	getProjectOne(String project_idx) throws Exception;
	public int			 	getProjectInsert(ProjectVO vo) throws Exception;
	public int			 	getProjectUpdate(ProjectVO vo) throws Exception;
	public int			 	getProjectUpdateCategory(String project_idx, String prj_category, String manager_id) throws Exception;
	
	public int           	getPrjRegiTotalCount(MngrSearchVO vo) throws Exception;
	public List<Prj_RegiVO>	getProjectRegi(MngrSearchVO vo) throws Exception;
	public Prj_RegiVO    	getProjectRegiOne(String prj_regi_idx) throws Exception;
	public int			 	getProjectRegiUpdate(Prj_RegiVO vo) throws Exception;
	public int			 	getProjectRegiUpdateState(String prj_regi_idx, String p_r_state, String manager_id) throws Exception;

	public int           	getPrjAidsTotalCount(MngrSearchVO vo) throws Exception;
	public List<ProjectVO>	getProjectAids(MngrSearchVO vo) throws Exception;
	public ProjectVO    	getProjectAidsOne(String project_idx) throws Exception;
	public int			 	getProjectAidsInsert(ProjectVO vo) throws Exception;
	public int			 	getProjectAidsUpdate(ProjectVO vo) throws Exception;
	public int			 	getProjectAidsUpdateCategory(String project_idx, String prj_category, String manager_id) throws Exception;
}
