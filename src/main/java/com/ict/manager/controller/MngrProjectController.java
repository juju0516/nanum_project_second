package com.ict.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;

@Controller
public class MngrProjectController {
	@Autowired
	private ManagerService prjService;
	@Autowired
	private Paging paging;

	@RequestMapping("mngr_regular.do")
	public ModelAndView managerRegular() {
		return new ModelAndView("manager/mngr_regular");
	}

	@RequestMapping("mngr_prj_list.do")
	public ModelAndView managerProjectList() {
		return new ModelAndView("manager/mngr_prj_list");
	}

	@RequestMapping("mngr_prj_detail.do")
	public ModelAndView managerProjectDetail() {
		return new ModelAndView("manager/mngr_prj_detail");
	}
	
	@RequestMapping("mngr_prj_update.do")
	public ModelAndView managerProjectUpdate() {
		return new ModelAndView("manager/mngr_prj_update");
	}
	
	@RequestMapping("mngr_prj_update_exec.do")
	public ModelAndView managerProjectUpdateExec() {
		return new ModelAndView("manager/mngr_prj_detail");
	}
	
	@RequestMapping("mngr_prj_delete.do")
	public ModelAndView managerProjectDelete() {
		return new ModelAndView("manager/mngr_prj_delete");
	}
	
	@RequestMapping("mngr_prj_regi.do")
	public ModelAndView managerProjectRegi() {
		return new ModelAndView("manager/mngr_prj_regi");
	}

	@RequestMapping("mngr_prj_regi_detail.do")
	public ModelAndView managerProjectRegiDetail() {
		return new ModelAndView("manager/mngr_prj_regi_detail");
	}

	@RequestMapping("mngr_prj_aids.do")
	public ModelAndView managerSeasonalProject() {
		return new ModelAndView("manager/mngr_prj_aids");
	}

	@RequestMapping("mngr_prj_aids_detail.do")
	public ModelAndView managerSeasonalProjectDetail() {
		return new ModelAndView("manager/mngr_prj_aids_detail");
	}

	@RequestMapping("mngr_prj_aids_update.do")
	public ModelAndView managerSeasonalProjectUpdate() {
		return new ModelAndView("manager/mngr_prj_aids_update");
	}

	@RequestMapping("mngr_prj_aids_update_exec.do")
	public ModelAndView managerSeasonalProjectUpdateExec() {
		return new ModelAndView("manager/mngr_prj_aids_detail");
	}

	@RequestMapping("mngr_prj_aids_delete.do")
	public ModelAndView managerSeasonalProjectDelete() {
		return new ModelAndView("manager/mngr_prj_aids_delete");
	}
}
