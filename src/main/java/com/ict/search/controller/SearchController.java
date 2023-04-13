package com.ict.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	
	@RequestMapping("search.do")
	public ModelAndView getSearch() {
		return new ModelAndView("search/search");
	}
	
	@RequestMapping("search_result.do")
	public ModelAndView getSearch_result() {
		return new ModelAndView("search/search_result");
	}


}
