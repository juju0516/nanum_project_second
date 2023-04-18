package com.ict.member.controller;

import java.io.File;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.FileReName;
import com.ict.common.Paging;
import com.ict.member.model.service.Member_Service;
import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

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

	// 마이페이지
	@RequestMapping("member_mypage.do")
	public ModelAndView getMyPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_mypage");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		mv.addObject("mvo", mvo);

		// System.out.println("id:" + id);
		if (id != null) {
			mvo = member_Service.getNickname_Name(id);

		} else {
			mvo = member_Service.getNickname_Name(id);
			String nickname = "카카오 로그인 완료";
			mvo.setNickname(nickname);
			mv.addObject("nickname", nickname);
			mv.addObject("mvo", mvo);

			//System.out.println("mvo" + mvo);
			//System.out.println("nickname:" + nickname);
		}

		return mv;
	}

	// 닉네임 변경
	@RequestMapping("member_nick_change.do")
	public ModelAndView getChangeNick(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:member_mypage.do");
		String id = (String) request.getSession().getAttribute("memberID");
		//System.out.println(id); // null

		MemberVO mvo = member_Service.getNickname_Name(id);
		String nickname = request.getParameter("nickname");

		mvo.setNickname(nickname);
		mv.addObject("nickname", nickname);
		mv.addObject("mvo", mvo);

		int result = member_Service.getChangeNick(mvo);
		// request.getSession().setAttribute("change", "ok");
		return mv;
	}

	// 프로필 사진 변경
	@RequestMapping(value = "member_image_change.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberImageChange(HttpSession session, HttpServletRequest request,
			@RequestParam("p_f_name") MultipartFile multipartFile) {
		ModelAndView mv = new ModelAndView("member_mypage.do");
		String id = (String) session.getAttribute("memberID");
		String path = session.getServletContext().getRealPath("/resources/upload/" + id + "/attach");
		// System.out.println(path);

		MemberVO mvo = member_Service.getNickname_Name(id);
		MultipartFile oldFile = mvo.getF_param();
		try {
			String newFileName = null;
			if (multipartFile.isEmpty()) {
				newFileName = "";
			} else {
				// 파일 이름 중복 방지

				// 파일 원래이름
				String originalFileName = multipartFile.getOriginalFilename();
				// 파일 확장자 가져오기
				String fileExtension = FilenameUtils.getExtension(originalFileName);
				// 확장자 제외하고 가져오기
				String baseFileName = FilenameUtils.getBaseName(originalFileName);
				// 유일한 파일 이름 생성
				String uniqueFileName = getUniqueFileName(baseFileName, fileExtension, path);
				newFileName = uniqueFileName + "." + fileExtension;
			}

			mvo.setP_f_name(newFileName);
			int result = member_Service.getChangeProf(mvo);
			if (result > 0) {
				if (!multipartFile.isEmpty()) {
					multipartFile.transferTo(new File(path + "/" + newFileName));
				}
				if (oldFile != null && !oldFile.isEmpty()) {
					File oldFileObj = new File(path + "/" + oldFile.getOriginalFilename());
					if (oldFileObj.exists()) {
						oldFileObj.delete();
					}
				}
			}
			return String.valueOf(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 고유한 파일 이름 생성
	private String getUniqueFileName(String baseFileName, String fileExtension, String path) {
		String newFileName = baseFileName + "_" + System.currentTimeMillis();
		File file = new File(path + "/" + newFileName + "." + fileExtension);
		int i = 1;
		while (file.exists()) {
			newFileName = baseFileName + "_" + System.currentTimeMillis() + "_" + i;
			file = new File(path + "/" + newFileName + "." + fileExtension);
			i++;
		}
		return newFileName;
	}

	// 보유 나누미
	@RequestMapping("member_point.do")
	public ModelAndView getPoint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_point");
		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		mv.addObject("mvo", mvo);

		return mv;
	}

	// 나누미 전환 신청
	@RequestMapping("member_point_change.do")
	public ModelAndView getPointChange(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_point_change");
		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		mv.addObject("mvo", mvo);

		return mv;
	}

	// 나누미 전환 신청 완료 페이지
	@RequestMapping("member_point_change_ok.do")
	public ModelAndView getPointChangeOk(HttpServletRequest request, @RequestParam("select") String select,
			@RequestParam(name = "writenanum", required = false) String writenanum) {
		ModelAndView mv = new ModelAndView("member/member_point_change_ok");

		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		List<PointVO> pvoList = member_Service.getPointID(id);
		PointVO pvo = pvoList.get(0); // 첫 번째 PointVO 객체를 가져옴
		String nickname = mvo.getNickname();
		String name = mvo.getName();
		int cur_point = mvo.getCur_point();

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

		String req_name = request.getParameter("writename");

		pvo.setReq_name(req_name);

		if (select.equals("other")) {
			int money = Integer.parseInt(writenanum) * 100;
			pvo.setReq_money(money);
			int point = money / 100;
			// System.out.println("point:" + point);
			pvo.setReq_point(point);
		} else {
			 String[] split = select.replaceAll("[^0-9()]", "").split("\\(|\\)");
			    String str_point = split[0];
			    int point = Integer.parseInt(str_point);
			    String priceStr = split[1].replaceAll(",", "");
			    int money = Integer.parseInt(priceStr);
			    
			   // System.out.println("money:"+money);
			   // System.out.println("point:"+point);
			    
			    pvo.setReq_money(money);
			    pvo.setReq_point(point);
		}
		member_Service.getPointInsert(pvo);
		// 디비에 값이 하나도 없을 경우 "Index 0 out of bounds for length 0"오류 발생
		// 페이징처리
		return mv;
	}

	@RequestMapping("member_nanumi_change_list.do")
	public ModelAndView getNanumiChangeList(HttpServletRequest request, PointVO pvo) {
		ModelAndView mv = new ModelAndView("member/member_nanumi_change_list");

		// String id = (String) request.getSession().getAttribute("memberID");

		int count = member_Service.getTotalCountPoint();
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

		List<PointVO> list = member_Service.getChangePointList(paging.getBegin(), paging.getEnd());
		//System.out.println("list:" + list);

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
	public ModelAndView getInquiry(HttpServletRequest request, InquiryVO iqvo) {
		ModelAndView mv = new ModelAndView("member/member_inquiry");
		
		//String id = (String) request.getSession().getAttribute("memberID");

		// 전체 게시물의 수
		int count = member_Service.getTotalCountInq();
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

		List<InquiryVO> list = member_Service.getInqList(paging.getBegin(), paging.getEnd());
		
		mv.addObject("paging", paging);
		mv.addObject("list", list);
		return mv;

		// 관리자페이지에서 답변 달면 답변 대기 -> 답변 완료로 변경되어야 한다
	}

	@RequestMapping("member_inquiry_ok.do")
	public ModelAndView getInquiryOk(HttpServletRequest request, InquiryVO iqvo) {
		ModelAndView mv = new ModelAndView("redirect:member_inquiry.do");

		String id = (String) request.getSession().getAttribute("memberID");
		String content = request.getParameter("content");
		String subject = request.getParameter("subject");

		iqvo.setId(id);
		iqvo.setInq_title(subject);
		iqvo.setInq_content(content);

		int res = member_Service.getInqInsert(iqvo);
		mv.addObject("id", id);
		mv.addObject("res", res);
		return mv;
	}

	// 삭제
	@RequestMapping(value = "member_inquiry_delete.do", method = RequestMethod.GET)
	public ModelAndView getDeleteInquiry(@RequestParam("inquiry_idx") int inquiry_idx) {
		int result = member_Service.getDeleteInquiry(inquiry_idx);
		return new ModelAndView("redirect:member_inquiry.do");
	}

	// 질문 인서트
	@RequestMapping("member_inquiry_onelist.do")
	public ModelAndView getInquiryOnelist(HttpServletRequest request, InquiryVO iqvo) {
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

	// 원리스트
	@RequestMapping("member_inquiry_onelist_ans.do")
	public ModelAndView getInquiryOnelistAns(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/member_inquiry_onelist_ans");
		String id = (String) request.getSession().getAttribute("memberID");
		MemberVO mvo = member_Service.getNickname_Name(id);
		int inquiry_idx = Integer.parseInt(request.getParameter("inquiry_idx"));

		InquiryVO iqvo = member_Service.getInqOneList(inquiry_idx);
		String contents = iqvo.getInq_content().trim();

		mv.addObject("contents", contents);
		mv.addObject("iqvo", iqvo);
		mv.addObject("mvo", mvo);

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
