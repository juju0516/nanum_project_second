package com.ict.member.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.FileReName;
import com.ict.common.Paging;
import com.ict.member.model.service.Member_Service;
import com.ict.member.model.vo.MemberVO;

@Controller
public class Member_Controller {
	String cPage;
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private Paging paging;
	@Autowired
	private FileReName fileReName;

	public void setMember_Service(Member_Service member_Service) {
		this.member_Service = member_Service;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public void setFileReName(FileReName fileReName) {
		this.fileReName = fileReName;
	}

	@RequestMapping("member_mypage.do")
	public ModelAndView getMyPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_mypage");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}
		return mv;
	}

	@RequestMapping("member_nick_change.do")
	public ModelAndView getChangeNick(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:member_mypage.do");
		String id = (String) request.getSession().getAttribute("memberID");
		System.out.println(id); // null

		MemberVO mvo = member_Service.getNickname_Name(id);
		String nickname = request.getParameter("nickname");
		System.out.println(mvo); // null
		System.out.println(nickname);

		mvo.setNickname(nickname);
		mv.addObject("nickname", nickname);
		mv.addObject("mvo", mvo);

		int result = member_Service.getChangeNick(mvo);
		// request.getSession().setAttribute("change", "ok");
		return mv;
	}

	@RequestMapping("member_image_change.do")
	public ModelAndView getChangeImage(HttpSession session, HttpServletRequest request,
			@RequestParam("p_f_name") MultipartFile p_f_name) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:member_mypage.do");
		String id = (String) request.getSession().getAttribute("memberID");
		String path = session.getServletContext().getRealPath("/resources/upload/" + id + "/attach");// 폴더경로
		MemberVO mvo = member_Service.getNickname_Name(id);
		System.out.println(id);
		MultipartFile file_name = mvo.getF_param();
		try {
			if (file_name.isEmpty()) {
				mvo.setP_f_name("");
			} else {
				// 이름 중복 여부
				String str = fileReName.exec(path, mvo.getF_param().getOriginalFilename());
				mvo.setP_f_name(str);
			}
			mv.addObject("cPage", "1");
			int res = member_Service.getChangeProf(mvo);
			if (res > 0) {
				p_f_name.transferTo(new File(path + "/" + mvo.getP_f_name()));
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		if (p_f_name.isEmpty()) {
			String str = "resources/images/system/profile2.png";
			mvo.setP_f_name(str);
			mv.addObject("mvo", mvo);
		} else {
			request.getSession().setAttribute("change", "image");
			mvo.setP_f_name(p_f_name.getOriginalFilename());
			mv.addObject("mvo", mvo);
		}
		
		

		return mv;
	}

	@RequestMapping("member_point.do")
	public ModelAndView getPoint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_point");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		// System.out.println(nickname +"닉/이름"+name);
		int cur_point = mvo.getCur_point();
		// System.out.println(cur_point);

		mvo.setCur_point(cur_point);
		mv.addObject("cur_point", cur_point);
		mv.addObject("mvo", mvo);

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}
		return mv;
	}

	@RequestMapping("member_point_change.do")
	public ModelAndView getPointChange(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_point_change");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		// System.out.println(nickname +"닉/이름"+name);
		int cur_point = mvo.getCur_point();
		// System.out.println(cur_point);

		mvo.setCur_point(cur_point);
		mv.addObject("cur_point", cur_point);
		mv.addObject("mvo", mvo);

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}
		return mv;
	}

	@RequestMapping("member_point_change_ok.do")
	public ModelAndView getPointChangeOk(HttpServletRequest request, @RequestParam("select") String select,
			@RequestParam(name = "writenanum", required = false) String writenanum) {
		ModelAndView mv = new ModelAndView("member/member_point_change_ok");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		// System.out.println(nickname +"닉/이름"+name);
		int cur_point = mvo.getCur_point();
		// System.out.println(cur_point);

		mvo.setCur_point(cur_point);
		mv.addObject("cur_point", cur_point);
		mv.addObject("mvo", mvo);

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}

		String selectnanum = select;
		if (select.equals("other")) {
			selectnanum = writenanum;
		}
		// String selectbtn = request.getParameter("select");

		// String writename = request.getParameter("writename");
		// System.out.println(writename+"name/select"+selectnanum);
		return mv;
	}

	@RequestMapping("member_nanumi_change_list.do")
	public ModelAndView getNanumiChangeList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_nanumi_change_list");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);

		return mv;
	}

	// 추가하기**
	// 포인트 신청 (신청정보 관리자페이지로)

	@RequestMapping("member_like_list.do")
	public ModelAndView getLikeList(HttpServletRequest request) {
		return new ModelAndView("member/member_like_list");
	}

	@RequestMapping("member_donate.do")
	public ModelAndView getDonate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_donate");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_inquiry.do")
	public ModelAndView getInquiry(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_inquiry");
		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_inquiry_onelist.do")
	public ModelAndView getInquiryOnelist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_inquiry_onelist");
		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}
		return mv;
	}

	@RequestMapping("member_inquiry_ok.do")
	public ModelAndView getInquiryOk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:member_inquiry.do");
		return mv;
	}

	@RequestMapping("member_inquiry_onelist_ans.do")
	public ModelAndView getInquiryOnelistAns(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_inquiry_onelist_ans");
		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		cPage = request.getParameter("cPage");

		MemberVO onelist = member_Service.getOneList(id);

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
			mv.addObject("onelist", onelist);
		}
		return mv;
	}

	@RequestMapping("member_regular_list.do")
	public ModelAndView getRegularList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_project_status");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_special_donate.do")
	public ModelAndView getAnniDonate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_special_donate");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_project_status.do")
	public ModelAndView getProjectStatus(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_project_status");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_req_aids.do")
	public ModelAndView getReqAids(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_req_aids");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_goods_list.do")
	public ModelAndView getGoodsList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_goods_list");

		int count = member_Service.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지
		cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작 블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MemberVO> list = member_Service.getList(paging.getBegin(), paging.getEnd());
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("member_change_info.do")
	public ModelAndView getChangeMemberInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_change_info");

		String id = (String) request.getSession().getAttribute("memberID");
		// System.out.println("id:"+id);

		MemberVO mvo = member_Service.getNickname_Name(id);
		// String nickname = request.getParameter("name");
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		String birth = mvo.getBirth().substring(0, 10);
		String gender = mvo.getGender();
		String tag = mvo.getTag();
		mvo.setBirth(birth);
		String address = mvo.getAddress();
		String[] result = address.split("/");

		mv.addObject("birth", birth);
		mv.addObject("tag", tag);
		mv.addObject("gender", gender);
		mv.addObject("result", result);

		// System.out.println("address:"+address);
		if (tag == null) {
			String str = "ex)#ㅁㅁ #ㅁㅁ #ㅁㅁ...";
			mvo.setTag(str);
			mv.addObject("mvo", mvo);
		} else {
			mvo.setTag(tag);
		}

		if (nickname == null) {
			mvo.setNickname(name);
			mv.addObject("name", name);
			mv.addObject("mvo", mvo);

		} else {
			mvo.setNickname(nickname);
			mv.addObject("name", nickname);
			mv.addObject("mvo", mvo);
		}
		return mv;
	}

	@RequestMapping("member_change_info_ok.do")
	public ModelAndView getChangeInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:member_change_info.do");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);

		// System.out.println("id2:"+id);

		String pw = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String sample3_postcode = request.getParameter("sample3_postcode");
		String sample3_address = request.getParameter("sample3_address");
		String sample3_detailAddress = request.getParameter("sample3_detailAddress");
		String sample3_extraAddress = request.getParameter("sample3_extraAddress");
		String tag = request.getParameter("tag");
		String paramValue1 = "비공개";
		if (request.getParameter("tagopen") != null) {
			paramValue1 = "공개";
		}

		String paramValue2 = "비공개";
		if (request.getParameter("historyopen") != null) {
			paramValue2 = "공개";
		}

		String address = sample3_postcode;
		address = address.concat("/");
		address = address.concat(sample3_address);
		address = address.concat("/");
		address = address.concat(sample3_detailAddress);
		address = address.concat("/");
		address = address.concat(sample3_extraAddress);

		mvo.setPw(pw);
		mvo.setPhone(phone);
		mvo.setEmail(email);
		mvo.setTag(tag);
		mvo.setTag_open(paramValue1);
		mvo.setS_history_open(paramValue2);
		mvo.setAddress(address);
		mv.addObject("mvo", mvo);

		// System.out.println("결과:"+pw + "/" + phone + "/" + email + "/" + paramValue1 +
		// "/" + paramValue2 + "/" + address
		// + "/" + mvo);

		int result = member_Service.getMemberUpdate(mvo);

		// System.out.println("성공시 1 반환:"+result);

		return mv;
	}

	@RequestMapping("member_delete_account.do")
	public ModelAndView getDeleteAccount() {
		return new ModelAndView("member/member_delete_account");
	}

	@RequestMapping("member_delete_account_ok.do")
	public ModelAndView getDeleteAccountOk() {
		return new ModelAndView("member/member_delete_account_ok");
	}

	@RequestMapping("member_delete_reason.do")
	public ModelAndView getDeleteProject() {
		return new ModelAndView("member/member_delete_reason");
	}

	@RequestMapping("member_main_page_logout.do")
	public ModelAndView getLogout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		// 1: 기존의 세션 데이터를 모두 삭제
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * if (session != null) { session.invalidate(); return new
		 * ModelAndView("redirect:main_page.do"); } else { return mv; }
		 */
		// session.invalidate();

		// 1. .removeAttribute() 사용
		HttpSession session = request.getSession();

		if (session != null) {
			session.removeAttribute("memberID");
			session.removeAttribute("login");
			return new ModelAndView("redirect:main_page.do");
		} else {
			return mv;
		}

		// 2: 로그인 페이지로 이동시킴.
		// return new ModelAndView("main_page");
	}

}
