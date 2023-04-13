package com.ict.alarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Alarm_Controller {
	@RequestMapping("alarm_list_go.do")
	public ModelAndView alarm_list_Go() {
		ModelAndView mv = new ModelAndView("alarm/alarm_list");
		return mv;
	}
	
	@RequestMapping("alarm_delete.do")
	public ModelAndView alarm_delete() {
		ModelAndView mv = new ModelAndView("alarm/alarm_delete");
		return mv;
	}
}
