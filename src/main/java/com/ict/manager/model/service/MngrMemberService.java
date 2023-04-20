package com.ict.manager.model.service;

import java.util.List;

import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.MemberVO;

public interface MngrMemberService {
	public int           	getTotalCount(MngrSearchVO vo) throws Exception;
	public List<MemberVO>	getMemberList(MngrSearchVO vo) throws Exception;
	public MemberVO    		getMemberOne(String member_idx) throws Exception;
	public int			 	getMemberUpdate(MemberVO vo) throws Exception;
	public int			 	getMemberUpdateState(String member_idx, String m_state, String manager_id) throws Exception;
}
