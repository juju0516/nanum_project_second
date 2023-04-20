package com.ict.manager.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.FileReName;
import com.ict.common.Paging;
import com.ict.manager.model.service.MngrProjectService;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.ProjectVO;

@Controller
public class MngrProjectController {
	@Autowired
	private MngrProjectService prjService;
	@Autowired
	private Paging paging;
	@Autowired
	private Paging r_paging;
	@Autowired
	private Paging a_paging;
	@Autowired
	private FileReName fileReName;

	private String cPage, r_cPage, a_cPage;

	// Project list 검색 정보
	private String s_type, b_date, e_date, s_category;
	// Project regi 검색 정보
	private String r_b_date, r_e_date, r_s_state;
	// Project aids (상시 프로젝트) 검색 정보
	private String a_range, a_word, a_type, a_b_date, a_e_date;

	private static final Logger logger = LoggerFactory.getLogger(MngrProjectController.class);

	@RequestMapping("mngr_regular.do")
	public ModelAndView managerRegular() {
		ModelAndView mv = new ModelAndView("manager/mngr_regular");
		return mv;
	}

	@RequestMapping("mngr_prj_list.do")
	public ModelAndView managerProjectList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_list");

		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if (request.getParameter("init") != null && request.getParameter("init").equals("y")) {
			s_type = "";
			b_date = "";
			e_date = "";
			s_category = "";
			paging.init(6, 2);
			cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if (request.getParameter("search") != null && request.getParameter("search").equals("y")) {
			s_type = request.getParameter("s_type");
			System.out.println("search s_type:" + s_type);
			b_date = request.getParameter("b_date");
			e_date = request.getParameter("e_date");
			s_category = request.getParameter("s_category");
			paging.init(6, 2);
			cPage = "1";
		}

		MngrSearchVO vo = new MngrSearchVO();
		vo.setS_type(s_type);
		vo.setB_date(b_date);
		vo.setE_date(e_date);
		vo.setS_state(s_category);

		System.out.println("s_type/b_date/e_date/s_state: [" + vo.getS_type() + "][" + vo.getB_date() + "]["
				+ vo.getE_date() + "][" + vo.getS_state() + "]");

		// 1. 전체 게시물의 수 구하기
		try {
			int count = prjService.getTotalCount(vo);
			System.out.println("count : " + count);
			paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerProjectList: getTotalCount() err");
			e.printStackTrace();
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
		System.out.println("managerProjectList[cPage<-req.cPage]:" + cPage + "<-" + request.getParameter("cPage"));
		if (request.getParameter("cPage") != null)
			cPage = request.getParameter("cPage");

		// ListCommand에 최초로 오는 경우는 cPage가 없으므로 무조건 cPage는 null이다.
		if (cPage == null || cPage.equals(""))
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
			// System.out.println("begin, end :" + paging.getBegin() + ", " +
			// paging.getEnd());

			vo.setBegin(paging.getBegin());
			vo.setEnd(paging.getEnd());
			List<ProjectVO> list = prjService.getProjectList(vo);
			mv.addObject("prj_list", list);
			mv.addObject("paging", paging);
		} catch (Exception e) {
			logger.info("getProjectList() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_detail.do")
	public ModelAndView managerProjectDetail(@ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_detail");

		try {
			ProjectVO vo = prjService.getProjectOne(project_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectDetail() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_category_popup.do")
	public ModelAndView managerProjectCategoryPopup(@ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_category_popup");
		return mv;
	}

	@RequestMapping("mngr_prj_category_popup_exec.do")
	public ModelAndView managerProjectCategoryPopupExec(HttpServletRequest request,
			@RequestParam("category") String category, @ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_category_popup_ok");
		try {
			int result = prjService.getProjectUpdateCategory(project_idx, category,
					(String) request.getSession().getAttribute("managerID"));
			mv.addObject("result", result);
		} catch (Exception e) {
			logger.info("managerProjectCategoryPopupOk() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_update.do")
	public ModelAndView managerProjectUpdate(@ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_update");

		try {
			ProjectVO vo = prjService.getProjectOne(project_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectUpdate() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_update_exec.do")
	public ModelAndView managerProjectUpdateExec(HttpServletRequest request, MultipartFile f_main,
			MultipartFile f_name1, MultipartFile f_name2, MultipartFile f_name3, MultipartFile f_name4,
			@ModelAttribute("cPage") String cPage, @ModelAttribute("project_idx") String project_idx) {
		ModelAndView mv = new ModelAndView("redirect:mngr_prj_detail.do");

		ProjectVO curVo; // 기존 값 가져오기
		try {
			curVo = prjService.getProjectOne(project_idx);
		} catch (Exception e) {
			logger.info("managerProjectUpdateExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		// 변경 입력 값 설정
		ProjectVO vo = new ProjectVO();
		vo = curVo;
		vo.setPrj_category(request.getParameter("category"));
		vo.setId(request.getParameter("id"));
		vo.setPrj_title(request.getParameter("prj_title"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setPrj_content(request.getParameter("prj_content"));
		vo.setGoal_point(Integer.parseInt(request.getParameter("goal_point")));
		vo.setGoal_num_people(Integer.parseInt(request.getParameter("goal_num_people")));
		vo.setTag(request.getParameter("tag"));
		vo.setPrj_begin_date(request.getParameter("prj_begin_date"));
		vo.setPrj_end_date(request.getParameter("prj_end_date"));
		vo.setPrj_result(request.getParameter("prj_result"));
		vo.setManager_id((String) request.getSession().getAttribute("managerID"));

		vo.setDnt_flag(request.getParameter("dnt"));
		vo.setRegular(request.getParameter("rglr"));
		vo.setOnetime(request.getParameter("onetime"));
		vo.setVlt_flag(request.getParameter("vlt"));

		boolean change1 = false, change2 = false, change3 = false, change4 = false, change5 = false;
		String path = request.getSession().getServletContext()
				.getRealPath("resources/upload/" + vo.getId() + "/attach");
		try {
			if (f_main != null && !f_main.isEmpty()) {
				change1 = true;
				String fileName = fileReName.exec(path, f_main.getOriginalFilename());
				vo.setPrj_main_img(fileName);
			}

			if (f_name1 != null && !f_name1.isEmpty()) {
				change2 = true;
				String fileName = fileReName.exec(path, f_name1.getOriginalFilename());
				vo.setF_name1(fileName);
			}

			if (f_name2 != null && !f_name2.isEmpty()) {
				change3 = true;
				String fileName = fileReName.exec(path, f_name2.getOriginalFilename());
				vo.setF_name2(fileName);
			}

			if (f_name3 != null && !f_name3.isEmpty()) {
				change4 = true;
				String fileName = fileReName.exec(path, f_name3.getOriginalFilename());
				vo.setF_name3(fileName);
			}

			if (f_name4 != null && !f_name4.isEmpty()) {
				change5 = true;
				String fileName = fileReName.exec(path, f_name4.getOriginalFilename());
				vo.setF_name4(fileName);
			}

			int result = prjService.getProjectUpdate(vo);
			mv.addObject("result", result);
			if (result > 0) {
				if (change1 == true)
					f_main.transferTo(new File(path + "/" + vo.getPrj_main_img()));
				if (change2 == true)
					f_name1.transferTo(new File(path + "/" + vo.getF_name1()));
				if (change3 == true)
					f_name2.transferTo(new File(path + "/" + vo.getF_name2()));
				if (change4 == true)
					f_name3.transferTo(new File(path + "/" + vo.getF_name3()));
				if (change5 == true)
					f_name4.transferTo(new File(path + "/" + vo.getF_name4()));
			}
		} catch (Exception e) {
			logger.info("managerProjectUpdateExec() err1" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_delete_popup.do")
	public ModelAndView managerProjectDelete(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("project_idx") String project_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_delete_popup");

		// System.out.println("managerProjectDelete() idx,cPage:" + project_idx + ","+
		// cPage);
		try {
			ProjectVO vo = prjService.getProjectOne(project_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectDelete() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_delete_exec.do")
	public ModelAndView managerProjectDeleteExec(HttpServletRequest request, @ModelAttribute("cPage") String cPage,
			@ModelAttribute("project_idx") String project_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_delete_popup_ok");

		// System.out.println("managerProjectDeleteExec() idx,cPage:" + project_idx +
		// ","+ cPage);
		try {
			int result = prjService.getProjectUpdateCategory(project_idx, "내림",
					(String) request.getSession().getAttribute("managerID"));
			mv.addObject("result", result);
		} catch (Exception e) {
			logger.info("managerProjectDeleteExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi.do")
	public ModelAndView managerProjectRegi(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi");

		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if (request.getParameter("init") != null && request.getParameter("init").equals("y")) {
			r_b_date = "";
			r_e_date = "";
			r_s_state = "";
			r_paging.init(6, 2);
			r_cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if (request.getParameter("search") != null && request.getParameter("search").equals("y")) {
			r_b_date = request.getParameter("b_date"); // System.out.println("search r_b_date:" + r_b_date);
			r_e_date = request.getParameter("e_date");
			r_s_state = request.getParameter("p_r_state");
			r_paging.init(6, 2);
			r_cPage = "1";
		}

		MngrSearchVO vo = new MngrSearchVO();
		vo.setB_date(r_b_date);
		vo.setE_date(r_e_date);
		vo.setS_state(r_s_state);

		System.out.println("r_b_date/r_e_date/r_s_state: [" + vo.getB_date() + "][" + vo.getE_date() + "]["
				+ vo.getS_state() + "]");

		// 1. 전체 게시물의 수 구하기
		try {
			int count = prjService.getPrjRegiTotalCount(vo);
			System.out.println("count : " + count);
			r_paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerProjectRegi: getRegiPrjTotalCount() err");
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		// 2. 전체 페이지의 수 구하기
		// 전체 게시글의 수가 한 페이지에 보여지는 게시글의 수 이하이면, 전체 페이지수는 1
		if (r_paging.getTotalRecord() <= r_paging.getNumPerPage()) {
			r_paging.setTotalPage(1);
		} else {
			r_paging.setTotalPage(r_paging.getTotalRecord() / r_paging.getNumPerPage());

			if (r_paging.getTotalRecord() % r_paging.getNumPerPage() != 0)
				r_paging.setTotalPage(r_paging.getTotalPage() + 1);
		}

		// 3. 현재 페이지 구하기
		// cmd가 list이면 무조건 cPage라는 현재 페이지 값을 가지고 가야한다.
		// cPage를 nowPage로 변경시킨다.
		System.out.println(
				"managerProjectRegi[r_cPage<-req.r_cPage]:" + r_cPage + "<-" + request.getParameter("r_cPage"));
		if (request.getParameter("r_cPage") != null)
			r_cPage = request.getParameter("r_cPage");

		// ListCommand에 최초로 오는 경우는 cPage가 없으므로 무조건 cPage는 null이다.
		if (r_cPage == null || r_cPage.equals(""))
			r_paging.setNowPage(1);
		else
			r_paging.setNowPage(Integer.parseInt(r_cPage));

		// ** 4. 현재 페이지의 시작번호와 끝번호 구하기
		r_paging.setBegin((r_paging.getNowPage() - 1) * r_paging.getNumPerPage() + 1);
		r_paging.setEnd((r_paging.getBegin() - 1) + r_paging.getNumPerPage());

		// ** 5. 현재 페이지에서 시작 블록과 끝 블록을 구하기
		r_paging.setBeginBlock(
				(int) ((r_paging.getNowPage() - 1) / r_paging.getPagePerBlock()) * r_paging.getPagePerBlock() + 1);
		r_paging.setEndBlock(r_paging.getBeginBlock() + r_paging.getPagePerBlock() - 1);

		// 1page => block 1-2, 2 => 1-2
		// 3page => block 3-4, 4 => 3-4
		// 5page => block 5-6, 6 => 5-6

		// 주의 사항 : endBlock이 totalPage보다 클 수 있다.
		// 이때는 쓸데없는 endBlock이 생성된다.
		// 따라서 endBlock이 totalPage보다 크면
		// endBlock을 totalPage로 변경하자.
		if (r_paging.getEndBlock() > r_paging.getTotalPage())
			r_paging.setEndBlock(r_paging.getTotalPage());

		// ** 6. 시작번호와 끝번호로 DB에서 원하는 만큼의 게시물 가져오기
		try {
			// System.out.println("begin, end :" + paging.getBegin() + ", " +
			// paging.getEnd());

			vo.setBegin(r_paging.getBegin());
			vo.setEnd(r_paging.getEnd());
			List<Prj_RegiVO> list = prjService.getProjectRegi(vo);
			mv.addObject("prj_regi", list);
			mv.addObject("paging", r_paging);
		} catch (Exception e) {
			logger.info("getProjectRegi() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_regi_detail.do")
	public ModelAndView managerProjectRegiDetail(@ModelAttribute("prj_regi_idx") String prj_regi_idx,
			@ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_detail");
		try {
			Prj_RegiVO vo = prjService.getProjectRegiOne(prj_regi_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectRegiDetail() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_state_popup.do")
	public ModelAndView managerProjectRegiStatePopup(@ModelAttribute("prj_regi_idx") String prj_regi_idx,
			@ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup");
		try {
			Prj_RegiVO vo = prjService.getProjectRegiOne(prj_regi_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectRegiStatePopup() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		mv.addObject("title", "심사 시작");
		mv.addObject("msg", "해당 프로젝트를 심사 상태로 전환하시겠습니까?");
		mv.addObject("dest", "mngr_prj_regi_state_popup_exec.do");
		return mv;
	}

	@RequestMapping("mngr_prj_regi_state_popup_exec.do")
	public ModelAndView managerProjectRegiStatePopupExec(HttpServletRequest request,
			@ModelAttribute("prj_regi_idx") String prj_regi_idx, @ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup_ok");
		String msg = "";
		try {
			int result = prjService.getProjectRegiUpdateState(prj_regi_idx, "심사중",
					(String) request.getSession().getAttribute("managerID"));
			if (result > 0) {
				msg = "심사중 상태로 변경되었습니다.";
			} else {
				msg = "상태 변경에 실패하였습니다.";
			}
			mv.addObject("msg", msg);
			mv.addObject("dest", "mngr_prj_regi_detail.do");
		} catch (Exception e) {
			logger.info("managerProjectRegiStatePopupExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_approve_popup.do")
	public ModelAndView managerProjectRegiApprovePopup(@ModelAttribute("prj_regi_idx") String prj_regi_idx,
			@ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup");
		try {
			Prj_RegiVO vo = prjService.getProjectRegiOne(prj_regi_idx);
			mv.addObject("vo", vo);

			if (vo.getP_r_state().equals("취소 요청") || vo.getP_r_state().equals("취소요청")) {
				mv.addObject("title", "프로젝트 등록 취소");
				mv.addObject("msg", "해당 프로젝트 등록 요청을 취소하시겠습니까?");
				mv.addObject("dest", "mngr_prj_regi_cancel_popup_exec.do");
			} else {
				mv.addObject("title", "프로젝트 승인");
				mv.addObject("msg", "해당 프로젝트를 승인하시겠습니까?");
				mv.addObject("dest", "mngr_prj_regi_approve_popup_exec.do");
			}
		} catch (Exception e) {
			logger.info("managerProjectRegiApprovePopup() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_approve_popup_exec.do")
	public ModelAndView managerProjectRegiApprovePopupExec(HttpServletRequest request,
			@ModelAttribute("prj_regi_idx") String prj_regi_idx, @ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup_ok");
		String msg = "";
		try {
			// Prj_Regi db 가져오기
			Prj_RegiVO regiVo = prjService.getProjectRegiOne(prj_regi_idx);

			// Project insert
			ProjectVO vo = new ProjectVO();
			vo.setPrj_category("오픈 예정");
			vo.setId(regiVo.getId());
			vo.setPrj_title(regiVo.getPrj_title());
			vo.setNickname(regiVo.getNickname());
			vo.setPrj_content(regiVo.getContent());
			vo.setGoal_point(regiVo.getGoal_point());
			vo.setGoal_num_people(regiVo.getGoal_num_people());
			if (regiVo.getGoal_point() > 0)
				vo.setDnt_flag("Y");
			else
				vo.setDnt_flag("N");
			vo.setRegular(regiVo.getRegular());
			vo.setOnetime(regiVo.getOnetime());
			if (regiVo.getGoal_num_people() > 0)
				vo.setVlt_flag("Y");
			else
				vo.setVlt_flag("N");
			vo.setTag(regiVo.getTag());
			vo.setPrj_main_img(regiVo.getF_name1());
			vo.setF_name1(regiVo.getF_name2());
			vo.setF_name2(regiVo.getF_name3());
			vo.setF_name3(regiVo.getF_name4());
			vo.setF_name4(regiVo.getF_name5());
			vo.setManager_id((String) request.getSession().getAttribute("managerID"));
			vo.setPrj_hit(0);

			LocalDate now = LocalDate.now();
			vo.setPrj_begin_date(now.plusDays(7).toString());
			vo.setPrj_end_date(now.plusDays(7 + regiVo.getPeriod()).toString());

			int result = 0;
			int res = prjService.getProjectInsert(vo);
			if (res > 0) {
				result = prjService.getProjectRegiUpdateState(prj_regi_idx, "등록 승인",
						(String) request.getSession().getAttribute("managerID"));
			}
			if (res + result > 1) {
				msg = "프로젝트 승인 처리가 완료되었습니다.";
			} else {
				msg = "프로젝트 승인 처리에 실패하였습니다.";
			}

			mv.addObject("msg", msg);
			mv.addObject("dest", "mngr_prj_regi.do?init=y");
		} catch (Exception e) {
			logger.info("managerProjectRegiApprovePopupExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_reject_popup.do")
	public ModelAndView managerProjectRegiRejectPopup(@ModelAttribute("prj_regi_idx") String prj_regi_idx,
			@ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup");
		try {
			Prj_RegiVO vo = prjService.getProjectRegiOne(prj_regi_idx);
			mv.addObject("vo", vo);

			if (vo.getP_r_state().equals("취소 요청") || vo.getP_r_state().equals("취소요청")) {
				mv.addObject("title", "프로젝트 등록 취소");
				mv.addObject("msg", "해당 프로젝트 등록 요청을 취소하시겠습니까?");
				mv.addObject("dest", "mngr_prj_regi_cancel_popup_exec.do");
			} else {
				mv.addObject("title", "프로젝트 거절");
				mv.addObject("msg", "해당 프로젝트를 거절하시겠습니까?");
				mv.addObject("dest", "mngr_prj_regi_reject_popup_exec.do");
			}
		} catch (Exception e) {
			logger.info("managerProjectRegiRejectPopup() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_reject_popup_exec.do")
	public ModelAndView managerProjectRegiRejectPopupExec(HttpServletRequest request,
			@ModelAttribute("prj_regi_idx") String prj_regi_idx, @ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup_ok");
		String msg = "";
		try {
			int result = prjService.getProjectRegiUpdateState(prj_regi_idx, "등록 거절",
					(String) request.getSession().getAttribute("managerID"));
			if (result > 0) {
				msg = "프로젝트 거절 처리가 완료되었습니다.";
			} else {
				msg = "프로젝트 거절 처리에 실패하였습니다.";
			}
			mv.addObject("msg", msg);
			mv.addObject("dest", "mngr_prj_regi.do?init=y");
		} catch (Exception e) {
			logger.info("managerProjectRegiRejectPopupExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_regi_cancel_popup_exec.do")
	public ModelAndView managerProjectRegiCancelPopupExec(HttpServletRequest request,
			@ModelAttribute("prj_regi_idx") String prj_regi_idx, @ModelAttribute("r_cPage") String r_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_regi_popup_ok");
		String msg = "";
		try {
			int result = prjService.getProjectRegiUpdateState(prj_regi_idx, "취소 완료",
					(String) request.getSession().getAttribute("managerID"));
			if (result > 0) {
				msg = "프로젝트 등록 요청 취소가 완료되었습니다.";
			} else {
				msg = "프로젝트 등록 요청 취소에 실패하였습니다.";
			}
			mv.addObject("msg", msg);
			mv.addObject("dest", "mngr_prj_regi.do?init=y");
		} catch (Exception e) {
			logger.info("managerProjectRegiRejectPopupExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_aids.do")
	public ModelAndView managerProjectAids(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids");

		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if (request.getParameter("init") != null && request.getParameter("init").equals("y")) {
			a_range = "";
			a_word = "";
			a_type = "";
			a_b_date = "";
			a_e_date = "";
			a_paging.init(6, 2);
			a_cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if (request.getParameter("search") != null && request.getParameter("search").equals("y")) {
			a_range = request.getParameter("s_range"); 
			System.out.println("search a_range:" + a_range);
			a_word = request.getParameter("s_word");
			a_type = request.getParameter("s_type");
			a_b_date = request.getParameter("b_date");
			a_e_date = request.getParameter("e_date");

			a_paging.init(6, 2);
			a_cPage = "1";
		}

		MngrSearchVO vo = new MngrSearchVO();
		vo.setS_range(a_range);
		vo.setS_word(a_word);
		vo.setS_type(a_type);
		vo.setB_date(a_b_date);
		vo.setE_date(a_e_date);

		System.out.println("a_range/a_word/a_type/a_b_date/a_e_date: [" + vo.getS_range() + "][" + vo.getS_word() + "]["
				+ vo.getS_type() + "][" + vo.getB_date() + "][" + vo.getE_date() + "]");

		// 1. 전체 게시물의 수 구하기
		try {
			int count = prjService.getPrjAidsTotalCount(vo);
			System.out.println("count : " + count);
			a_paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerProjectAids: getPrjAidsTotalCount() err");
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		// 2. 전체 페이지의 수 구하기
		// 전체 게시글의 수가 한 페이지에 보여지는 게시글의 수 이하이면, 전체 페이지수는 1
		if (a_paging.getTotalRecord() <= a_paging.getNumPerPage()) {
			a_paging.setTotalPage(1);
		} else {
			a_paging.setTotalPage(a_paging.getTotalRecord() / a_paging.getNumPerPage());

			if (a_paging.getTotalRecord() % a_paging.getNumPerPage() != 0)
				a_paging.setTotalPage(a_paging.getTotalPage() + 1);
		}

		// 3. 현재 페이지 구하기
		// cmd가 list이면 무조건 cPage라는 현재 페이지 값을 가지고 가야한다.
		// cPage를 nowPage로 변경시킨다.
		System.out.println(
				"managerProjectAids[a_cPage<-req.a_cPage]:" + a_cPage + "<-" + request.getParameter("a_cPage"));
		if (request.getParameter("a_cPage") != null)
			a_cPage = request.getParameter("a_cPage");

		// ListCommand에 최초로 오는 경우는 cPage가 없으므로 무조건 cPage는 null이다.
		if (a_cPage == null || a_cPage.equals(""))
			a_paging.setNowPage(1);
		else
			a_paging.setNowPage(Integer.parseInt(a_cPage));

		// ** 4. 현재 페이지의 시작번호와 끝번호 구하기
		a_paging.setBegin((a_paging.getNowPage() - 1) * a_paging.getNumPerPage() + 1);
		a_paging.setEnd((a_paging.getBegin() - 1) + a_paging.getNumPerPage());

		// ** 5. 현재 페이지에서 시작 블록과 끝 블록을 구하기
		a_paging.setBeginBlock(
				(int) ((a_paging.getNowPage() - 1) / a_paging.getPagePerBlock()) * a_paging.getPagePerBlock() + 1);
		a_paging.setEndBlock(a_paging.getBeginBlock() + a_paging.getPagePerBlock() - 1);

		// 1page => block 1-2, 2 => 1-2
		// 3page => block 3-4, 4 => 3-4
		// 5page => block 5-6, 6 => 5-6

		// 주의 사항 : endBlock이 totalPage보다 클 수 있다.
		// 이때는 쓸데없는 endBlock이 생성된다.
		// 따라서 endBlock이 totalPage보다 크면
		// endBlock을 totalPage로 변경하자.
		if (a_paging.getEndBlock() > a_paging.getTotalPage())
			a_paging.setEndBlock(a_paging.getTotalPage());

		// ** 6. 시작번호와 끝번호로 DB에서 원하는 만큼의 게시물 가져오기
		try {
			// System.out.println("begin, end :" + paging.getBegin() + ", " +
			// paging.getEnd());

			vo.setBegin(a_paging.getBegin());
			vo.setEnd(a_paging.getEnd());
			List<ProjectVO> list = prjService.getProjectAids(vo);
			mv.addObject("prj_aids", list);
			mv.addObject("paging", a_paging);
		} catch (Exception e) {
			logger.info("getProjectAids() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_aids_write.do")
	public ModelAndView managerProjectAidsWrite() {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids_write");
		return mv;
	}

	@RequestMapping("mngr_prj_aids_write_exec.do")
	public ModelAndView managerProjectAidsWriteExec(HttpServletRequest request,
			MultipartFile prj_main_img, MultipartFile f_name1, MultipartFile f_name2,
			MultipartFile f_name3, MultipartFile f_name4) {
		ModelAndView mv = new ModelAndView("redirect:mngr_prj_aids.do");

		ProjectVO vo = new ProjectVO();
		vo.setPrj_category("상시");
		vo.setId((String) request.getSession().getAttribute("managerID"));
		vo.setPrj_title(request.getParameter("prj_title"));  //System.out.println("prj_title:"+vo.getPrj_title());
		vo.setPrj_content(request.getParameter("prj_content"));
		vo.setRegular(request.getParameter("regular"));  //System.out.println("select regular:"+vo.getRegular());
		vo.setOnetime(request.getParameter("onetime"));
		vo.setGoal_point(Integer.parseInt(request.getParameter("goal_point")));
		vo.setGoal_num_people(Integer.parseInt(request.getParameter("goal_num_people")));
		vo.setTag(request.getParameter("tag"));
		vo.setPrj_begin_date(request.getParameter("prj_begin_date"));
		vo.setPrj_end_date(request.getParameter("prj_end_date"));
		vo.setPrj_hit(0);
		vo.setManager_id(vo.getId());

		String path = request.getSession().getServletContext().getRealPath("resources/upload/system/attach");
		try {
			if (prj_main_img != null && !prj_main_img.isEmpty()) {
				String fileName = fileReName.exec(path, prj_main_img.getOriginalFilename());
				vo.setPrj_main_img(fileName);
			}

			if (f_name1 != null && !f_name1.isEmpty()) {
				String fileName = fileReName.exec(path, f_name1.getOriginalFilename());
				vo.setF_name1(fileName);
			}

			if (f_name2 != null && !f_name2.isEmpty()) {
				String fileName = fileReName.exec(path, f_name2.getOriginalFilename());
				vo.setF_name2(fileName);
			}

			if (f_name3 != null && !f_name3.isEmpty()) {
				String fileName = fileReName.exec(path, f_name3.getOriginalFilename());
				vo.setF_name3(fileName);
			}

			if (f_name4 != null && !f_name4.isEmpty()) {
				String fileName = fileReName.exec(path, f_name4.getOriginalFilename());
				vo.setF_name4(fileName);
			}

			int result = prjService.getProjectAidsInsert(vo);
			if (result > 0) {
				if (prj_main_img != null && !prj_main_img.isEmpty())
					prj_main_img.transferTo(new File(path + "/" + vo.getPrj_main_img()));
				if (f_name1 != null && !f_name1.isEmpty())
					f_name1.transferTo(new File(path + "/" + vo.getF_name1()));
				if (f_name2 != null && !f_name2.isEmpty())
					f_name2.transferTo(new File(path + "/" + vo.getF_name2()));
				if (f_name3 != null && !f_name3.isEmpty())
					f_name3.transferTo(new File(path + "/" + vo.getF_name3()));
				if (f_name4 != null && !f_name4.isEmpty())
					f_name4.transferTo(new File(path + "/" + vo.getF_name4()));
			}
		} catch (Exception e) {
			logger.info("managerProjectAidsWriteExec err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_prj_aids_detail.do")
	public ModelAndView managerProjectAidsDetail(
			@ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("a_cPage") String a_cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids_detail");
		try {
			ProjectVO vo = prjService.getProjectAidsOne(project_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerProjectAidsDetail err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_prj_aids_update.do")
	public ModelAndView managerProjectAidsUpdate() {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids_update");
		return mv;
	}

	@RequestMapping("mngr_prj_aids_update_exec.do")
	public ModelAndView managerProjectAidsUpdateExec() {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids_detail");
		return mv;
	}

	@RequestMapping("mngr_prj_aids_delete_popup.do")
	public ModelAndView managerProjectAidsDeletePopup() {
		ModelAndView mv = new ModelAndView("manager/mngr_prj_aids_delete_popup");
		return mv;
	}
}
