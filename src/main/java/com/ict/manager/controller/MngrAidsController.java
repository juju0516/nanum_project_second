package com.ict.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;

@Controller
public class MngrAidsController {
	@Autowired
	private ManagerService aidsService;
	@Autowired
	private Paging paging;

	@RequestMapping("mngr_aids_list.do")
	public ModelAndView managerAidsReqList() {
		return new ModelAndView("manager/mngr_aids_list");
	}

	@RequestMapping("mngr_aids_detail.do")
	public ModelAndView managerAidsReqDetail() {
		return new ModelAndView("manager/mngr_aids_detail");
	}
}
