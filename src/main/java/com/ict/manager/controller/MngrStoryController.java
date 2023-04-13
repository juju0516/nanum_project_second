package com.ict.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;

@Controller
public class MngrStoryController {
	@Autowired
	private ManagerService storyService;
	@Autowired
	private Paging paging;
	
	@RequestMapping("mngr_story_list.do")
	public ModelAndView managerStoryList() {
		return new ModelAndView("manager/mngr_story_list");
	}

	@RequestMapping("mngr_story_detail.do")
	public ModelAndView managerStoryDetail() {
		return new ModelAndView("manager/mngr_story_detail");
	}

	@RequestMapping("mngr_story_update.do")
	public ModelAndView managerStoryUpdate() {
		return new ModelAndView("manager/mngr_story_update");
	}

	@RequestMapping("mngr_story_update_exec.do")
	public ModelAndView managerStoryUpdateExec() {
		return new ModelAndView("manager/mngr_story_detail");
	}
	
	@RequestMapping("mngr_story_write.do")
	public ModelAndView managerStoryWrite() {
		return new ModelAndView("manager/mngr_story_write");
	}
}
