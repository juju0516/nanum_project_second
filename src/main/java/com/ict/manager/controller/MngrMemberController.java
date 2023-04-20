package com.ict.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.model.service.ManagerService;
import com.ict.manager.model.service.MngrMemberService;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.project.model.vo.ProjectVO;

@Controller
public class MngrMemberController {
	@Autowired
	private MngrMemberService memberService;
	@Autowired
	private Paging paging;
	
	private String cPage;
	
	private String s_type, s_word;
	
	private static final Logger logger = LoggerFactory.getLogger(MngrProjectController.class);

	@RequestMapping("mngr_member_list.do")
	public ModelAndView managerMemberList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_member_list");
		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if (request.getParameter("init") != null && request.getParameter("init").equals("y")) {
			s_type = "";		
			s_word = "";
			paging.init(6, 2);
			cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if (request.getParameter("search") != null && request.getParameter("search").equals("y")) {
			s_type = request.getParameter("s_type");
			System.out.println("member search s_type:" + s_type);
			s_word = request.getParameter("s_word");
			
			paging.init(6, 2);
			cPage = "1";
		}

		MngrSearchVO vo = new MngrSearchVO();
		vo.setS_type(s_type);
		vo.setS_word(s_word);

		System.out.println("s_type/s_word: [" + vo.getS_type() + "][" + vo.getS_word() + "]");

		// 1. 전체 게시물의 수 구하기
		try {
			int count = memberService.getTotalCount(vo);
			System.out.println("count : " + count);
			paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerMemberList: getTotalCount() err");
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
		System.out.println("managerMemberList[cPage<-req.cPage]:" + cPage + "<-" + request.getParameter("cPage"));
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
			List<MemberVO> list = memberService.getMemberList(vo);
			
			for(int i = 0; i < list.size(); i++) {
				MemberVO mvo = SecuredIdAndPhoneNumber(list.get(i), 0);
				list.set(i, mvo);
			}
			
			mv.addObject("member_list", list);
			mv.addObject("paging", paging);
		} catch (Exception e) {
			logger.info("managerMemberList err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	MemberVO SecuredIdAndPhoneNumber(MemberVO vo, int mode) {
		String last, first;
		if(mode == 0) {
			String id = vo.getId();
			last = id.substring(2);
			first = id.substring(0, 1);
			id = first + "*" + last;
			vo.setId(id);
		}
		
		String phone = vo.getPhone();
		if(phone != null && phone.length() >= 10)
		{
			last = phone.substring(phone.length()-4);
			first = phone.substring(0, 3);
			phone = first + "-" + "****" + "-" + last;
			vo.setPhone(phone);
		}
		
		return vo;
	}
	
	@RequestMapping("mngr_member_detail.do")
	public ModelAndView managerMemberDetail(HttpServletRequest request, 
			@ModelAttribute("member_idx") String member_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_member_detail");
		try {
			MemberVO vo = SecuredIdAndPhoneNumber(memberService.getMemberOne(member_idx), 1);			
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerMemberDetail err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_member_update.do")
	public ModelAndView managerMemberUpdate() {
		return new ModelAndView("manager/mngr_member_update");
	}

	@RequestMapping("mngr_member_update_exec.do")
	public ModelAndView managerMemberUpdateExec() {
		return new ModelAndView("manager/mngr_member_detail");
	}

	@RequestMapping("mngr_member_inquiry.do")
	public ModelAndView managerMemberInquiry() {
		return new ModelAndView("manager/mngr_member_inquiry");
	}

	@RequestMapping("mngr_member_inquiry_detail.do")
	public ModelAndView managerMemberInquiryDetail() {
		return new ModelAndView("manager/mngr_member_inquiry_detail");
	}

	@RequestMapping("mngr_member_inquiry_answer.do")
	public ModelAndView managerMemberInquiryAnswer() {
		return new ModelAndView("manager/mngr_member_inquiry");
	}
}
