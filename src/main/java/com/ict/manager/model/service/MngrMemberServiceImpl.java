package com.ict.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.model.dao.MngrMemberServiceDAO;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.MemberVO;

@Service
public class MngrMemberServiceImpl implements MngrMemberService {
	@Autowired
	MngrMemberServiceDAO mbrServiceDAO;
	
	@Override
	public int getTotalCount(MngrSearchVO vo) throws Exception {
		return mbrServiceDAO.getTotalCount(vo);
	}
	
	@Override
	public List<MemberVO> getMemberList(MngrSearchVO vo) throws Exception {
		return mbrServiceDAO.getMemberList(vo);
	}
	
	@Override
	public MemberVO getMemberOne(String member_idx) throws Exception {
		return mbrServiceDAO.getMemberOne(member_idx);
	}
	
	@Override
	public int getMemberUpdate(MemberVO vo) throws Exception {
		return mbrServiceDAO.getMemberUpdate(vo);
	}
	
	@Override
	public int getMemberUpdateState(String member_idx, String m_state, String manager_id) throws Exception {
		return mbrServiceDAO.getMemberUpdateState(member_idx, m_state, manager_id);
	}
}
