package com.ict.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ict.common.FileReName;
import com.ict.common.Paging;
import com.ict.review.model.service.ReviewService;
import com.ict.review.model.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class Review_Controller {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private Paging paging;
	@Autowired
	private FileReName fileReName;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public void setFileReName(FileReName fileReName) {
		this.fileReName = fileReName;
	}

	@RequestMapping("review_list.do")
	public ModelAndView review_list_go(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("review/review_list");
		int count = reviewService.getTotalCount();
		paging.setTotalRecord(count);
		
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalBlock(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");
		
		if (cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());
		
		paging.setBeginBlock((int)((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
		
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<ReviewVO> review_list = reviewService.getReviewList(paging.getBegin(), paging.getEnd());
		
		mv.addObject("review_list", review_list);
		mv.addObject("paging", paging);
		return mv;
	}
	
	@RequestMapping("review_writing_go.do")
	public ModelAndView review_writing(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("review/review_regi");
		String id = (String)request.getSession().getAttribute("memberID");
		mv.addObject("id", id);
		return mv;
	}
	
//	@RequestMapping("review_write.do")
//	public ModelAndView review_write(ReviewVO revo, HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("redirect:review_list.do");
//		String path = session.getServletContext().getRealPath("/resources/upload/system/attach");
//		MultipartFile re_f_param = revo.getRe_f_param();
//		System.out.println(revo.getRe_f_param());
//		try {
//			if (re_f_param.isEmpty()) {
//				revo.setRe_f_name1("");
//			}else {
//				String str = fileReName.exec(path, revo.getRe_f_param().getOriginalFilename());
//				revo.setRe_f_name1(str);
//			}
//			mv.addObject("cPage", "1");
//			int write_res = reviewService.getReviewInsert(revo);
//			if (write_res > 0) {
//				re_f_param.transferTo(new File(path + "/" + revo.getRe_f_name1()));
//			}
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		return mv;
//	}
	
	@RequestMapping("review_write.do")
	public ModelAndView review_write(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:review_list.do");
		ReviewVO revo = new ReviewVO();
		try {
			String id = (String)request.getSession().getAttribute("memberID");
			
			request.setCharacterEncoding("UTF-8");
			// 프로젝트가 있는 폴더\\metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\프로젝트 이름\\업로드 할 위치
			String path = "D:\\SMK\\springstudy1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Nanum\\resources\\upload\\" + id + "\\attach";
			// String path = "resources/upload/" + id + "/attach";
			int size = 1024 * 1024 * 100;
			String enctype = "UTF-8";
			
			// 업로드
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype,
					new DefaultFileRenamePolicy());
			
			// 데이터 받기
			// HttpSession session = request.getSession();
			// String id = (String)session.getAttribute("id");
//			String nickname = (String)session.getAttribute("nickname");
			String re_title = mr.getParameter("re_title");
			String re_content = mr.getParameter("re_content");
			
			// 데이터 vo에 값 넣기
			revo.setId(id);
//			revo.setNickname(nickname);
			revo.setRe_title(re_title);
			revo.setRe_content(re_content);
			String filename1 = mr.getOriginalFileName("re_f_param1");
			String filename2 = mr.getOriginalFileName("re_f_param2");
			String filename3 = mr.getOriginalFileName("re_f_param3");
			String filename4 = mr.getOriginalFileName("re_f_param4");
			String filename5 = mr.getOriginalFileName("re_f_param5");
			
			mv.addObject("cPage", "1");
			
			if(filename1 == null) {
				revo.setRe_f_name1("");
			}else {
				String str = fileReName.exec(path, filename1);
				revo.setRe_f_name1(str);
			}
			
			if(filename2 == null) {
				revo.setRe_f_name2("");
			}else {
				String str = fileReName.exec(path, filename2);
				revo.setRe_f_name2(str);
			}
			
			if(filename3 == null) {
				revo.setRe_f_name3("");
			}else {
				String str = fileReName.exec(path, filename3);
				revo.setRe_f_name3(str);
			}
			
			if(filename1 == null) {
				revo.setRe_f_name4("");
			}else {
				String str = fileReName.exec(path, filename4);
				revo.setRe_f_name4(str);
			}
			
			if(filename5 == null) {
				revo.setRe_f_name5("");
			}else {
				String str = fileReName.exec(path, filename5);
				revo.setRe_f_name5(str);
			}
			
			int write_res = reviewService.getReviewInsert(revo);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(revo.getId());
		return mv;
	}
	
	@RequestMapping("review_detail.do")
	public ModelAndView review_detail(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("review_idx") String review_idx,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("review/review_detail");
		
		String id = (String)request.getSession().getAttribute("memberID");
		
		int review_hitup = reviewService.getReviewhit(review_idx);
		ReviewVO revo = reviewService.getReviewDetail(review_idx);
		mv.addObject("cPage", cPage);
		mv.addObject("revo", revo);
		mv.addObject("id", id);
		return mv;
	}
	
	@RequestMapping("review_update_page.do")
	public ModelAndView review_update_page(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("review_idx") String review_idx) {
		ModelAndView mv = new ModelAndView("review/review_update");
		
		ReviewVO revo = reviewService.getReviewDetail(review_idx);
		mv.addObject("cPage", cPage);
		mv.addObject("revo", revo);
		return mv;
	}
	
	@RequestMapping("review_update.do")
	public ModelAndView review_update(HttpServletRequest request,
			@ModelAttribute("cPage") String cPage,
			@ModelAttribute("review_idx") String review_idx) {
		String id = (String)request.getSession().getAttribute("memberID");
		ReviewVO revo = new ReviewVO();
		try {
			request.setCharacterEncoding("UTF-8");
			// 프로젝트가 있는 폴더\\metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\프로젝트 이름\\업로드 할 위치
			String path = "D:\\SMK\\springstudy1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Nanum\\resources\\upload\\" + id + "\\attach";
			int size = 1024 * 1024 * 100;
			String enctype = "UTF-8";
			
			// 업로드
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
			
			// 데이터 받기
//			HttpSession session = request.getSession();
//			String id = (String)session.getAttribute("id");
//			String nickname = (String)session.getAttribute("nickname");
			String re_title = mr.getParameter("re_title");
			String re_content = mr.getParameter("re_content");
			int review_idx2 = Integer.parseInt(review_idx);
			
			// 데이터 vo에 값 넣기
//			revo.setId(id);
//			revo.setNickname(nickname);
			revo.setRe_title(re_title);
			revo.setRe_content(re_content);
			revo.setReview_idx(review_idx2);
			
			String filename1 = mr.getOriginalFileName("re_f_param1");
			String filename2 = mr.getOriginalFileName("re_f_param2");
			String filename3 = mr.getOriginalFileName("re_f_param3");
			String filename4 = mr.getOriginalFileName("re_f_param4");
			String filename5 = mr.getOriginalFileName("re_f_param5");
			
			String old_filename1 = mr.getParameter("old_re_f_name1");
			String old_filename2 = mr.getParameter("old_re_f_name2");
			String old_filename3 = mr.getParameter("old_re_f_name3");
			String old_filename4 = mr.getParameter("old_re_f_name4");
			String old_filename5 = mr.getParameter("old_re_f_name5");
			
			if(filename1 == null || filename1 == "") {
				revo.setRe_f_name1(old_filename1);
				if(old_filename1 == null || old_filename1 == ""){
					revo.setRe_f_name1("");
				}
			}else {
				String str = fileReName.exec(path, filename1);
				revo.setRe_f_name1(str);
			}
			
			if(filename2 == null || filename2 == "") {
				revo.setRe_f_name2(old_filename2);
				if(old_filename2 == null || old_filename2 == ""){
					revo.setRe_f_name2("");
				}
			}else {
				String str = fileReName.exec(path, filename2);
				revo.setRe_f_name2(str);
			}
			
			if(filename3 == null || filename3 == "") {
				revo.setRe_f_name3(old_filename3);
				if(old_filename3 == null || old_filename3 == ""){
					revo.setRe_f_name3("");
				}
			}else {
				String str = fileReName.exec(path, filename3);
				revo.setRe_f_name3(str);
			}
			if(filename4 == null || filename4 == "") {
				revo.setRe_f_name4(old_filename4);
				if(old_filename4 == null || old_filename4 == ""){
					revo.setRe_f_name4("");
				}
			}else {
				String str = fileReName.exec(path, filename4);
				revo.setRe_f_name4(str);
			}
			
			if(filename5 == null || filename5 == "") {
				revo.setRe_f_name5(old_filename5);
				if(old_filename5 == null || old_filename5 == ""){
					revo.setRe_f_name5("");
				}
			}else {
				String str = fileReName.exec(path, filename5);
				revo.setRe_f_name5(str);
			}
			
			int result = reviewService.getReviewUpdate(revo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("redirect:review_list.do?review_idx=" + revo.getReview_idx());
		mv.addObject("cPage", cPage);
		return mv;
	}
	
	@RequestMapping("review_delete_page.do")
	public ModelAndView review_delete_page(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("review_idx") String review_idx) {
		ModelAndView mv = new ModelAndView("review/review_delete_popup");
		mv.addObject("cPage", cPage);
		mv.addObject("review_idx", review_idx);
		return mv;
	}
	
	@RequestMapping("review_delete.do")
	public ModelAndView review_delete(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("review_idx") String review_idx) {
		ModelAndView mv = new ModelAndView("redirect:review_list.do?cPage=" + cPage);
		
		int result = reviewService.getReviewDelete(review_idx);
		
		System.out.println(cPage);
		System.out.println(review_idx);
		return mv;
	}
}
