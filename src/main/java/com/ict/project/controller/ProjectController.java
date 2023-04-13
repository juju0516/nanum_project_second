package com.ict.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {
	

	/* 참여하기 버튼 누르면 보여지는 리스트 목록으로 이동*/
	@RequestMapping("prj_flag_list.do")
	public ModelAndView getFlagList() {
		return new ModelAndView("project/prj_flag_list");
	}
	
	@RequestMapping("prj_list.do")
	public ModelAndView getprjList() {
		return new ModelAndView("project/prj_list");
	}
	
	@RequestMapping("prj_detail.do")
	public ModelAndView getprjdetail() {
		return new ModelAndView("project/prj_detail");
	}
	

	@RequestMapping("prj_result.do")
	public ModelAndView getprresult() {
		return new ModelAndView("project/prj_result");
	}


}
