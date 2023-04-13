package com.ict.aids.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Aids_Controller {
	@RequestMapping("aids_main_go.do")
	public ModelAndView aids_main() {
		ModelAndView mv = new ModelAndView("aids/aids_mainpage");
		return mv;
	}
	
	@RequestMapping("aids_detail_list.do")
	public ModelAndView aids_detail_list() {
		ModelAndView mv = new ModelAndView("aids/aids_detail_list");
		return mv;
	}
	
	@RequestMapping("aids_regi.do")
	public ModelAndView aids_regi() {
		ModelAndView mv = new ModelAndView("aids/aids_regi");
		return mv;
	}
	
	@RequestMapping("aids_donator_go.do")
	public ModelAndView aids_donator_go() {
		ModelAndView mv = new ModelAndView("aids/aids_donator");
		return mv;
	}
	
	@RequestMapping("aids_dnt_donator_go.do")
	public ModelAndView aids_dnt_donator_go() {
		ModelAndView mv = new ModelAndView("aids/aids_dnt_donator");
		return mv;
	}
}
