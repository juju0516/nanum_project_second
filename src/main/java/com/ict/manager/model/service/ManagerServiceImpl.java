package com.ict.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.model.dao.ManagerServiceDAO;
import com.ict.manager.model.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerServiceDAO managerServiceDAO;
	
	public void setManagerServiceDAO(ManagerServiceDAO managerServiceDAO) {
		this.managerServiceDAO = managerServiceDAO;
	}

	@Override
	public int getTotalCount()  throws Exception {
		return managerServiceDAO.getTotalCount();
	}
	
	@Override
	public List<ManagerVO> getManagerList(int begin, int end) throws Exception {
		return managerServiceDAO.getManagerList(begin, end);
	}
	
	@Override
	public int getManagerInsert(ManagerVO mvo) throws Exception {
		return managerServiceDAO.getManagerInsert(mvo);
	}
	
	@Override
	public ManagerVO getManagerOne(String manager_id) throws Exception {
		return managerServiceDAO.getManagerOne(manager_id);
	}
	
	@Override
	public int getManagerUpdate(ManagerVO mvo) throws Exception {
		return managerServiceDAO.getManagerUpdate(mvo);
	}
	
	@Override
	public int getManagerUpdateState(String manager_idx, String manager_state) throws Exception {
		return managerServiceDAO.getManagerUpdateState(manager_idx, manager_state);
	}
	
	// alarm
	@Override
	public int getPointStateCount(String p_state) throws Exception {
		return managerServiceDAO.getPointStateCount(p_state);
	}
	@Override
	public int getPrjRegiStateCount(String p_r_state) throws Exception {
		return managerServiceDAO.getPrjRegiStateCount(p_r_state);
	}
	@Override
	public int getGoodsSaleStateCount(String g_s_state) throws Exception {
		return managerServiceDAO.getGoodsSaleStateCount(g_s_state);
	}
	@Override
	public int getReqAidsStateCount(String req_state) throws Exception {
		return managerServiceDAO.getReqAidsStateCount(req_state);
	}
	@Override
	public int getInquiryStateCount(String inq_state) throws Exception {
		return managerServiceDAO.getInquiryStateCount(inq_state);
	}
}
