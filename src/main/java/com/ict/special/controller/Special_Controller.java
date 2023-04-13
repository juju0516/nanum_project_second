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
	
	@RequestMapping("my_speacialday.do")
	public ModelAndView my_speacialdayCommand(@ModelAttribute("sp_list") String sp_list) {
		ModelAndView mv = new ModelAndView("special/sp_donator");
		String listname = "";
		if (sp_list == "1") {
			listname = "태명";
		} else if (sp_list == "2"){
			listname = "탄생";
		} else if (sp_list == "3"){
			listname = "100일";
		} else if (sp_list == "4"){
			listname = "돌기념";
		} else if (sp_list == "5"){
			listname = "생일";
		} else if (sp_list == "6"){
			listname = "결혼";
		} else if (sp_list == "7"){
			listname = "추모";
		} else if (sp_list == "8"){
			listname = "나만의기념일";
		}
		mv.addObject("listname", listname);
		return mv;
	}
}
