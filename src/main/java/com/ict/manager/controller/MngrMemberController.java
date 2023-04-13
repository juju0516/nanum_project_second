package com.ict.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;

@Controller
public class MngrMemberController {
	@Autowired
	private ManagerService memberService;
	@Autowired
	private Paging paging;

	@RequestMapping("mngr_member_list.do")
	public ModelAndView managerMemberList() {
		return new ModelAndView("manager/mngr_member_list");
	}
	
	@RequestMapping("mngr_member_detail.do")
	public ModelAndView managerMemberDetail() {
		return new ModelAndView("manager/mngr_member_detail");
	}
	
	@RequestMapping("mngr_member_update.do")
	public ModelAndView managerMemberUpdate() {
		return new ModelAndView("manager/mngr_member_update");
	}
	
	@RequestMapping("mngr_member_update_exec.do")
	public ModelAndView managerMemberUpdateExec() {
		return new ModelAndView("manager/mngr_member_detail");
	}
	
	@RequestMapping("mngr_member_inquiry.do")
	public ModelAndView managerMemberInquiry() {
		return new ModelAndView("manager/mngr_member_inquiry");
	}
	
	@RequestMapping("mngr_member_inquiry_detail.do")
	public ModelAndView managerMemberInquiryDetail() {
		return new ModelAndView("manager/mngr_member_inquiry_detail");
	}	

	@RequestMapping("mngr_member_inquiry_answer.do")
	public ModelAndView managerMemberInquiryAnswer() {
		return new ModelAndView("manager/mngr_member_inquiry");
	}
}
