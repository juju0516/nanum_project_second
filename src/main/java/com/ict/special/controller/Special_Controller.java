package com.ict.special.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Special_Controller {
	@RequestMapping("sp_donator_list_go.do")
	public ModelAndView sp_donator_list() {
		ModelAndView mv = new ModelAndView("special/sp_list");
		return mv;
	}
	
	@RequestMapping("my_speacialday1.do")
	public ModelAndView my_speacialday1Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "태명";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday2.do")
	public ModelAndView my_speacialday2Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "탄생";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday3.do")
	public ModelAndView my_speacialday3Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "100일";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday4.do")
	public ModelAndView my_speacialday4Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "돌기념";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday5.do")
	public ModelAndView my_speacialday5Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "생일";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday6.do")
	public ModelAndView my_speacialday6Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "결혼";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday7.do")
	public ModelAndView my_speacialday7Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "추모";
		mv.addObject("listname", listname);
		return mv;
	}
	@RequestMapping("my_speacialday8.do")
	public ModelAndView my_speacialday8Command() {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "나만의기념일";
		mv.addObject("listname", listname);
		return mv;
	}
}
