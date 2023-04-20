package com.ict.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;
import com.ict.manager.model.vo.ManagerVO;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private Paging paging;
	
	private String cPage;
	
	final private String SUPER_ADMIN_ID = "admin";
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	@RequestMapping("mngr_login.do")
	public ModelAndView managerLogin(HttpSession session, @ModelAttribute("msg") String msg) {
		// 로그인된 상태
		if(session.getAttribute("managerID") != null) {
			return new ModelAndView("redirect:mngr_member_list.do");
		}
		
		return new ModelAndView("manager/mngr_login");
	}

	@RequestMapping("mngr_logout.do")
	public ModelAndView managerLogout(HttpSession session) {
		session.removeAttribute("managerID");
		session.removeAttribute("superID");
		
		return new ModelAndView("redirect:mngr_login.do");
		//return new ModelAndView("manager/mngr_logout_popup");
	}
	
//	@RequestMapping("mngr_logout_exec.do")
//	public ModelAndView managerLogoutExec() {
//		return new ModelAndView("manager/mngr_logout_popup");
//	}
	
	@RequestMapping("mngr_login_exec.do")
	public ModelAndView managerLoginExec(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:mngr_member_list.do");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try {
			ManagerVO mvo = managerService.getManagerOne(id);
			// 존재하지 않는 아이디
			if(mvo == null) {
				return new ModelAndView("redirect:mngr_login.do?msg=" + "mismatch_id");
			}
			// 패스워드 불일치
			if(!pwd.equals(mvo.getManager_pw())) {
				return new ModelAndView("redirect:mngr_login.do?msg=" + "mismatch_pw");
			}
		} catch(Exception e) {
			logger.info("managerLoginExec: getManagerOne() err");
			return new ModelAndView("manager/error");
		}
		
		// 로긴 성공 시 세션에 매니저 아이디 저장
		request.getSession().setAttribute("managerID", id);
		request.getSession().setAttribute("superID", SUPER_ADMIN_ID);
		
		return mv;
	}

	@RequestMapping("mngr_alarm.do")
	public ModelAndView managerAlarm() {
		ModelAndView mv = new ModelAndView("manager/mngr_alarm");
		try {
			int count = managerService.getPointStateCount("신청");
			mv.addObject("p_cnt", count);
			
			count = managerService.getPrjRegiStateCount("승인 요청");
			mv.addObject("p_r_cnt", count);
			count = managerService.getPrjRegiStateCount("취소 요청");
			mv.addObject("p_r_c_cnt", count);
						
			count = managerService.getGoodsSaleStateCount("주문");
			mv.addObject("g_s_cnt", count);
			count = managerService.getGoodsSaleStateCount("주문취소 신청");
			mv.addObject("g_s_c_cnt", count);
			
			count = managerService.getReqAidsStateCount("신청");
			mv.addObject("req_cnt", count);

			count = managerService.getInquiryStateCount("대기");
			mv.addObject("inq_cnt", count);
			
		} catch (Exception e) {
			logger.info("managerAlarm: err");
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_manager_info.do")
	public ModelAndView managerInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_manager_info");
	
		// 1. 전체 게시물의 수 구하기
		try {
			int count = managerService.getTotalCount();	 //System.out.println("count : " + count);
			paging.setTotalRecord(count);
		} catch(Exception e) {
			logger.info("managerInfo: getTotalCount() err");
			return new ModelAndView("manager/error");
		}

		// 2. 전체 페이지의 수 구하기
		// 전체 게시글의 수가 한 페이지에 보여지는 게시글의 수 이하이면, 전체 페이지수는 1
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());

			if (paging.getTotalRecord() % paging.getNumPerPage() != 0)
				paging.setTotalPage(paging.getTotalPage() + 1);
		}

		// 3. 현재 페이지 구하기
		// cmd가 list이면 무조건 cPage라는 현재 페이지 값을 가지고 가야한다.
		// cPage를 nowPage로 변경시킨다.
		if (request.getParameter("cPage") != null)
			cPage = request.getParameter("cPage");

		System.out.println("list[cPage<-req.cPage]:" + cPage + "<-" + request.getParameter("cPage"));

		// ListCommand에 최초로 오는 경우는 cPage가 없으므로 무조건 cPage는 null이다.
		if (cPage == null)
			paging.setNowPage(1);
		else
			paging.setNowPage(Integer.parseInt(cPage));

		// ** 4. 현재 페이지의 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// ** 5. 현재 페이지에서 시작 블록과 끝 블록을 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 1page => block 1-2, 2 => 1-2
		// 3page => block 3-4, 4 => 3-4
		// 5page => block 5-6, 6 => 5-6

		// 주의 사항 : endBlock이 totalPage보다 클 수 있다.
		// 이때는 쓸데없는 endBlock이 생성된다.
		// 따라서 endBlock이 totalPage보다 크면
		// endBlock을 totalPage로 변경하자.
		if (paging.getEndBlock() > paging.getTotalPage())
			paging.setEndBlock(paging.getTotalPage());

		// ** 6. 시작번호와 끝번호로 DB에서 원하는 만큼의 게시물 가져오기
		try {
			//System.out.println("begin, end :" + paging.getBegin() + ", " + paging.getEnd());
			
			List<ManagerVO> list = managerService.getManagerList(paging.getBegin(), paging.getEnd());
			mv.addObject("mng_list", list);
			mv.addObject("paging", paging);
		} catch(Exception e) {
			logger.info("managerInfo: getManagerList() err");
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_manager_create_popup.do")
	public ModelAndView managerCreatePopup() {
		return new ModelAndView("manager/mngr_manager_create_popup");
	}

	@RequestMapping("mngr_manager_create_exec.do")
	public ModelAndView managerCreateExec(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("manager/mngr_manager_create_popup_ok");
		
		ManagerVO mvo = new ManagerVO();
		mvo.setManager_id(request.getParameter("id"));
		mvo.setManager_pw(request.getParameter("pwd"));
		mvo.setManager_name(request.getParameter("name"));
		mvo.setManager_phone(request.getParameter("phone"));
		mvo.setManager_state("사용중");
		
		try {
			managerService.getManagerInsert(mvo);
		} catch(Exception e) {
			logger.info("managerCreateExec: getManagerInsert() err");
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_manager_update_popup.do")
	public ModelAndView managerUpdatePopup(@RequestParam("manager_id") String manager_id) {		
		ModelAndView mv = new ModelAndView("manager/mngr_manager_update_popup");		
		try {
			ManagerVO mvo = managerService.getManagerOne(manager_id);
			mv.addObject("mvo", mvo);
		} catch(Exception e) {
			logger.info("managerUpdatePopup: getManagerOne() err");
			return new ModelAndView("manager/error");
		}
		
		return mv;
	}

	@RequestMapping("mngr_manager_update_exec.do")
	public ModelAndView managerUpdateExec(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_manager_update_popup_ok");
		
		ManagerVO mvo = new ManagerVO();
		mvo.setManager_idx(Integer.parseInt(request.getParameter("manager_idx")));
		mvo.setManager_id(request.getParameter("id"));
		mvo.setManager_pw(request.getParameter("pwd"));
		mvo.setManager_name(request.getParameter("name"));
		mvo.setManager_phone(request.getParameter("phone"));
		
		try {
			int result = managerService.getManagerUpdate(mvo);
			mv.addObject("result", result);
		} catch(Exception e) {
			logger.info("managerUpdateExec: getManagerUpdate() err");
			return new ModelAndView("manager/error");
		}

		return mv;
	}
	
	@RequestMapping("mngr_manager_delete_popup.do")
	public ModelAndView managerDeletePopup(@RequestParam("manager_id") String manager_id) {		
		ModelAndView mv = new ModelAndView("manager/mngr_manager_delete_popup");		
		try {
			ManagerVO mvo = managerService.getManagerOne(manager_id);
			mv.addObject("mvo", mvo);
		} catch(Exception e) {
			logger.info("managerDeletePopup: getManagerOne() err");
			return new ModelAndView("manager/error");
		}
		
		return mv;
	}

	@RequestMapping("mngr_manager_delete_exec.do")
	public ModelAndView managerDeleteExec(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_manager_delete_popup_ok");
		
		String manager_idx = request.getParameter("manager_idx");
		try {
			int result = managerService.getManagerUpdateState(
								manager_idx, "사용중지");
			mv.addObject("result", result);
		} catch(Exception e) {
			logger.info("managerDeleteExec: getManagerUpdateState() err:\n" + e);
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_dashboard.do")
	public ModelAndView managerDashboard() {
		return new ModelAndView("manager/mngr_dashboard");
	}
}
