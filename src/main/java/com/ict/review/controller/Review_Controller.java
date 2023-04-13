package com.ict.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Review_Controller {
	@RequestMapping("review_list_go.do")
	public ModelAndView review_list_go() {
		ModelAndView mv = new ModelAndView("review/review_list");
		return mv;
	}
	
	@RequestMapping("review_writing_go.do")
	public ModelAndView review_writing() {
		ModelAndView mv = new ModelAndView("review/review_regi");
		return mv;
	}
	
	@RequestMapping("review_detail.do")
	public ModelAndView review_detail() {
		ModelAndView mv = new ModelAndView("review/review_detail");
		return mv;
	}
}
