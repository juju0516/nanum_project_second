package com.ict.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;

@Controller
public class MngrPointController {
	@Autowired
	private ManagerService pointService;
	@Autowired
	private Paging paging;

	@RequestMapping("mngr_point_list.do")
	public ModelAndView managerPointList() {
		return new ModelAndView("manager/mngr_point_list");
	}

	@RequestMapping("mngr_point_req.do")
	public ModelAndView managerPointReq() {
		return new ModelAndView("manager/mngr_point_req");
	}
}
