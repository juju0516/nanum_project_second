package com.ict.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.basket.model.service.BasketService;
import com.ict.common.Paging;
import com.ict.goods.model.vo.GoodsVO;
import com.ict.project.model.service.ProjectService;
import com.ict.project.model.vo.PrjListVO;
import com.ict.project.model.vo.ProjectVO;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private BasketService basketService;
	@Autowired
	private Paging paging;
	
	private String cPage;
	
	
	
	
	/* 프로젝트 리스트보기 */
	@RequestMapping("prj_list.do")
	public ModelAndView getPrjList(HttpServletRequest request) {
		ModelAndView mv =  new ModelAndView("project/prj_list");
		
		String loginID = (String)request.getSession().getAttribute("memberID");
		String prj_category = request.getParameter("prj_category");
		
		//카테고리별로 이동하기
		// 1. 전체 게시물 수 구하기
		try {
			if (prj_category == null || prj_category == "") {
				prj_category = "진행중";
			}
			mv.addObject("prj_category", prj_category);
			
			int count = projectService.getTotalCount(prj_category);
			paging.setTotalRecord(count);	
		} catch (Exception e) {
			System.out.println("prj_list.do catch : " + e);
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
			PrjListVO listvo = new PrjListVO();
			listvo.setBegin(paging.getBegin());
			listvo.setEnd(paging.getEnd());
			listvo.setPrj_category(prj_category);
			mv.addObject("listvo", listvo);
			
			List<ProjectVO> prj_List = projectService.getProjectList(listvo);
			mv.addObject("prj_List", prj_List);
			mv.addObject("paging", paging);
			mv.addObject("loginID", loginID);
		} catch (Exception e) {
		}

		return mv;
	}
	
	
	/* 프로젝트 상세보기 */
	@RequestMapping("prj_detail.do")
	public ModelAndView getPrjDetail(
			HttpServletRequest request,
			@ModelAttribute("cPage") int cPage) {
		
		ModelAndView mv = new ModelAndView("project/prj_detail");
		String loginID = (String)request.getSession().getAttribute("memberID");
		String project_idx = request.getParameter("project_idx");
		try {
			// vo 받았음
			ProjectVO prjvo = projectService.getProjectDetail(project_idx);
			System.out.println("project_idx : " + project_idx);
			mv.addObject("prjvo", prjvo);
		
		} catch (Exception e) {
			System.out.println("prj_detail.do : exection : " + e);
			e.printStackTrace();
		}
		
		
		
		return mv;
	}
	

	@RequestMapping("prj_result.do")
	public ModelAndView getPrjResult() {
		return new ModelAndView("project/prj_result");
	}
	
	

	/* 참여하기 버튼 누르면 보여지는 리스트 목록으로 이동*/
	@RequestMapping("prj_flag_list.do")
	public ModelAndView getFlagList() {
		return new ModelAndView("project/prj_flag_list");
	}
	


}
