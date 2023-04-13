package com.ict.manager.model.service;

import java.util.List;

import com.ict.manager.model.vo.ManagerVO;

public interface ManagerService {
	public int             getTotalCount() throws Exception;
	public List<ManagerVO> getManagerList(int begin, int end) throws Exception;
	public ManagerVO       getManagerOne(String manager_id) throws Exception;
	public int			   getManagerInsert(ManagerVO mvo) throws Exception;
	public int			   getManagerUpdate(ManagerVO mvo) throws Exception;
	public int			   getManagerUpdateState(String manager_idx, String manager_state) throws Exception;
}
