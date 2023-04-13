package com.ict.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Project_Send_Controller {
	@RequestMapping("prj_List_go.do")
	public ModelAndView prj_List() {
		ModelAndView mv = new ModelAndView("project/prj_List");
		return mv;
	}
	
	@RequestMapping("prj_regi_go.do")
	public ModelAndView prj_regi() {
		ModelAndView mv = new ModelAndView("project/prj_regi");
		return mv;
	}

	@RequestMapping("prj_donator_go.do")
	public ModelAndView prj_donator() {
		ModelAndView mv = new ModelAndView("project/prj_donator");
		return mv;
	}
	
	@RequestMapping("prj_vol_donator_go.do")
	public ModelAndView prj_vol_donator() {
		ModelAndView mv = new ModelAndView("project/prj_vol_donator");
		return mv;
	}
}
