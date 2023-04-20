package com.ict.manager.controller;

import java.io.File;
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
import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.manager.model.service.GoodsService;
import com.ict.manager.model.vo.MngrSearchVO;
import com.ict.member.model.vo.PointVO;

@Controller
public class MngrGoodsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private Paging paging; // goods list
	@Autowired
	private Paging s_paging; // goods sale list
	@Autowired
	private FileReName fileReName;

	private String cPage, s_cPage;
	// 굿즈 정보 검색어
	private String g_s_word;
	// 굿즈 구매 내역 검색 조건들
	private String s_type, s_word, s_state, b_date, e_date;

	private static final Logger logger = LoggerFactory.getLogger(MngrGoodsController.class);

	@RequestMapping("mngr_goods_list.do")
	public ModelAndView managerGoodsList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_list");

		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if(request.getParameter("init") != null &&
		   request.getParameter("init").equals("y")) {
			g_s_word = "";   //System.out.println("init g_s_word:" + g_s_word);
			paging.init(6, 2); 
			cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if(request.getParameter("search") != null &&
		   request.getParameter("search").equals("y"))	{
			g_s_word = request.getParameter("search-word");  //System.out.println("search g_s_word:" + g_s_word);
			paging.init(6, 2); 
			cPage = "1";
		}
		
		System.out.println("g_s_word:" + g_s_word);
			
		// 1. 전체 게시물의 수 구하기
		try {
			int count = goodsService.getTotalCount(g_s_word);  System.out.println("count : " + count);
			paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerGoodsList: getTotalCount() err");
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
		System.out.println("managerGoodsList[cPage<-req.cPage]:" + cPage + "<-" + request.getParameter("cPage"));
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

			List<GoodsVO> list = goodsService.getGoodsList(
							paging.getBegin(), paging.getEnd(), g_s_word);
			mv.addObject("goods_list", list);
			mv.addObject("paging", paging);
		} catch (Exception e) {
			logger.info("getGoodsList() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_detail.do")
	public ModelAndView managerGoodsDetail(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_detail");

		try {
			// 관리자 조회는 hit 아님. 디비에서 읽어야.
			// goodsService.getGoodsUpdateHit(goods_idx);
			GoodsVO vo = goodsService.getGoodsOne(goods_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerGoodsDetail() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_write.do")
	public ModelAndView managerGoodsWrite(@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_write");
		return mv;
	}

	@RequestMapping("mngr_goods_write_exec.do")
	public ModelAndView managerGoodsWriteExec(HttpServletRequest request, MultipartFile f_main, MultipartFile f_soldout,
			MultipartFile f_name1, MultipartFile f_name2, MultipartFile f_name3,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("redirect:mngr_goods_detail.do");

		// System.out.println("code:" + request.getParameter("goods_code"));
		// System.out.println("f_main:" + f_main.getOriginalFilename());

		GoodsVO vo = new GoodsVO();
		vo.setGoods_code(request.getParameter("goods_code"));
		vo.setGoods_name(request.getParameter("goods_name"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setInit_amount(Integer.parseInt(request.getParameter("init_amount")));
		vo.setCur_amount(vo.getInit_amount());
		vo.setClose_date(request.getParameter("close_date"));
		vo.setDelivery_charge(Integer.parseInt(request.getParameter("delivery_charge")));
		vo.setDelivery_charge_l(Integer.parseInt(request.getParameter("delivery_charge_l")));
		vo.setGoods_content(request.getParameter("goods_content"));
		vo.setG_state("판매중");
		vo.setGoods_hit(0);
		vo.setManager_id((String) request.getSession().getAttribute("managerID"));

		String path = request.getSession().getServletContext().getRealPath("resources/upload/system/attach");
		try {
			if (f_main.isEmpty())
				vo.setGoods_main_img("");
			else {
				String fileName = fileReName.exec(path, f_main.getOriginalFilename());
				vo.setGoods_main_img(fileName);
			}

			if (f_soldout.isEmpty())
				vo.setGoods_soldout_img("");
			else {
				String fileName = fileReName.exec(path, f_soldout.getOriginalFilename());
				vo.setGoods_soldout_img(fileName);
			}

			if (f_name1.isEmpty())
				vo.setGoods_f_name1("");
			else {
				String fileName = fileReName.exec(path, f_name1.getOriginalFilename());
				vo.setGoods_f_name1(fileName);
			}

			if (f_name2.isEmpty())
				vo.setGoods_f_name2("");
			else {
				String fileName = fileReName.exec(path, f_name2.getOriginalFilename());
				vo.setGoods_f_name2(fileName);
			}

			if (f_name3.isEmpty())
				vo.setGoods_f_name3("");
			else {
				String fileName = fileReName.exec(path, f_name3.getOriginalFilename());
				vo.setGoods_f_name3(fileName);
			}

			int result = goodsService.getGoodsInsert(vo);
			mv.addObject("result", result);
			if (result > 0) {
				if (!f_main.isEmpty())
					f_main.transferTo(new File(path + "/" + vo.getGoods_main_img()));
				if (!f_soldout.isEmpty())
					f_soldout.transferTo(new File(path + "/" + vo.getGoods_soldout_img()));
				if (!f_name1.isEmpty())
					f_name1.transferTo(new File(path + "/" + vo.getGoods_f_name1()));
				if (!f_name2.isEmpty())
					f_name2.transferTo(new File(path + "/" + vo.getGoods_f_name2()));
				if (!f_name3.isEmpty())
					f_name3.transferTo(new File(path + "/" + vo.getGoods_f_name3()));
			}
		} catch (Exception e) {
			logger.info("managerGoodsWriteExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		try {
			GoodsVO vo1 = goodsService.getGoodsOneByCode(vo.getGoods_code());
			mv.addObject("goods_idx", vo1.getGoods_idx());
		} catch (Exception e) {
			logger.info("managerGoodsDetail() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_update.do")
	public ModelAndView managerGoodsUpdate(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_update");

		try {
			GoodsVO vo = goodsService.getGoodsOne(goods_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerGoodsUpdate() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_update_exec.do")
	public ModelAndView managerGoodsUpdateExec(HttpServletRequest request, MultipartFile f_main,
			MultipartFile f_soldout, MultipartFile f_name1, MultipartFile f_name2, MultipartFile f_name3,
			@ModelAttribute("cPage") String cPage, @ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("redirect:mngr_goods_detail.do");

		GoodsVO curVo; // 기존 값 가져오기
		try {
			curVo = goodsService.getGoodsOne(goods_idx);
		} catch (Exception e) {
			logger.info("managerGoodsUpdateExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		// 변경 입력 값 설정
		GoodsVO vo = new GoodsVO();
		vo.setGoods_idx(Integer.parseInt(goods_idx));
		vo.setGoods_code(request.getParameter("goods_code"));
		vo.setGoods_name(request.getParameter("goods_name"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setInit_amount(Integer.parseInt(request.getParameter("init_amount")));
		vo.setOpen_date(request.getParameter("open_date"));
		vo.setClose_date(request.getParameter("close_date"));
		vo.setGoods_content(request.getParameter("goods_content"));
		vo.setDelivery_charge(Integer.parseInt(request.getParameter("delivery_charge")));
		vo.setDelivery_charge_l(Integer.parseInt(request.getParameter("delivery_charge_l")));

		boolean change1 = false, change2 = false, change3 = false, change4 = false, change5 = false;
		String path = request.getSession().getServletContext().getRealPath("resources/upload/system/attach");
		try {
			if (f_main == null || f_main.isEmpty())
				vo.setGoods_main_img(curVo.getGoods_main_img());
			else {
				change1 = true;
				String fileName = fileReName.exec(path, f_main.getOriginalFilename());
				vo.setGoods_main_img(fileName);
			}

			if (f_soldout == null || f_soldout.isEmpty())
				vo.setGoods_soldout_img(curVo.getGoods_soldout_img());
			else {
				change2 = true;
				String fileName = fileReName.exec(path, f_soldout.getOriginalFilename());
				vo.setGoods_soldout_img(fileName);
			}

			if (f_name1 == null || f_name1.isEmpty())
				vo.setGoods_f_name1(curVo.getGoods_f_name1());
			else {
				change3 = true;
				String fileName = fileReName.exec(path, f_name1.getOriginalFilename());
				vo.setGoods_f_name1(fileName);
			}

			if (f_name2 == null || f_name2.isEmpty())
				vo.setGoods_f_name2(curVo.getGoods_f_name2());
			else {
				change4 = true;
				String fileName = fileReName.exec(path, f_name2.getOriginalFilename());
				vo.setGoods_f_name2(fileName);
			}

			if (f_name3 == null || f_name3.isEmpty())
				vo.setGoods_f_name3(curVo.getGoods_f_name3());
			else {
				change5 = true;
				String fileName = fileReName.exec(path, f_name3.getOriginalFilename());
				vo.setGoods_f_name3(fileName);
			}

			int result = goodsService.getGoodsUpdate(vo);
			mv.addObject("result", result);
			if (result > 0) {
				if (change1 == true)
					f_main.transferTo(new File(path + "/" + vo.getGoods_main_img()));
				if (change2 == true)
					f_soldout.transferTo(new File(path + "/" + vo.getGoods_soldout_img()));
				if (change3 == true)
					f_name1.transferTo(new File(path + "/" + vo.getGoods_f_name1()));
				if (change4 == true)
					f_name2.transferTo(new File(path + "/" + vo.getGoods_f_name2()));
				if (change5 == true)
					f_name3.transferTo(new File(path + "/" + vo.getGoods_f_name3()));
			}
		} catch (Exception e) {
			logger.info("managerGoodsUpdateExec() err1" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_delete_popup.do")
	public ModelAndView managerGoodsDelete(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_delete_popup");

		try {
			GoodsVO vo = goodsService.getGoodsOne(goods_idx);
			mv.addObject("vo", vo);
		} catch (Exception e) {
			logger.info("managerGoodsDelete() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_delete_exec.do")
	public ModelAndView managerGoodsDeleteExec(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_delete_popup_ok");
		try {
			int result = goodsService.getGoodsUpdateState(goods_idx, "내림");
			mv.addObject("result", result);
		} catch (Exception e) {
			logger.info("managerGoodsDeleteExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_goods_sale.do")
	public ModelAndView managerGoodsSale(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_sale");
	
		// 왼쪽 사이드바 메뉴 선택인 경우 검색어 초기화
		if(request.getParameter("init") != null &&
		   request.getParameter("init").equals("y")) {
			s_type=""; s_word=""; s_state=""; b_date=""; e_date="";
			s_paging.init(6, 2); 
			s_cPage = "1";
		}
		// 검색버튼이 눌러진 경우
		if(request.getParameter("search") != null &&
				request.getParameter("search").equals("y"))	{
			s_type = request.getParameter("s_type");
			s_word = request.getParameter("s_word");  //System.out.println("search s_word:" + s_word);
			s_state = request.getParameter("s_state");
			b_date = request.getParameter("b_date");
			e_date = request.getParameter("e_date");
			
			paging.init(6, 2); 
			cPage = "1";
		}
				
		MngrSearchVO vo = new MngrSearchVO();
		vo.setS_type(s_type);
		vo.setS_word(s_word);
		vo.setS_state(s_state);
		vo.setB_date(b_date);
		vo.setE_date(e_date);
		
		System.out.println("s_type/s_wordstate/b_date/e_date: [" + 
				vo.getS_type() + "][" + vo.getS_word() + "][" + vo.getS_state() +
				"][" + vo.getB_date() + "][" + vo.getE_date() + "]");	
		
		// 1. 전체 게시물의 수 구하기
		try {
			int count = goodsService.getSaleTotalCount(vo);  System.out.println("count : " + count);
			s_paging.setTotalRecord(count);
		} catch (Exception e) {
			logger.info("managerGoodsSale: getSaleTotalCount() err");
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		// 2. 전체 페이지의 수 구하기
		// 전체 게시글의 수가 한 페이지에 보여지는 게시글의 수 이하이면, 전체 페이지수는 1
		if (s_paging.getTotalRecord() <= s_paging.getNumPerPage()) {
			s_paging.setTotalPage(1);
		} else {
			s_paging.setTotalPage(s_paging.getTotalRecord() / s_paging.getNumPerPage());

			if (s_paging.getTotalRecord() % s_paging.getNumPerPage() != 0)
				s_paging.setTotalPage(s_paging.getTotalPage() + 1);
		}

		// 3. 현재 페이지 구하기
		// cmd가 list이면 무조건 cPage라는 현재 페이지 값을 가지고 가야한다.
		// cPage를 nowPage로 변경시킨다.
		System.out.println("managerGoodsSale[s_cPage<-req.s_cPage]:" + s_cPage + "<-" + request.getParameter("s_cPage"));
		if (request.getParameter("s_cPage") != null)
			s_cPage = request.getParameter("s_cPage");

		// ListCommand에 최초로 오는 경우는 cPage가 없으므로 무조건 cPage는 null이다.
		if (s_cPage == null || s_cPage.equals(""))
			s_paging.setNowPage(1);
		else
			s_paging.setNowPage(Integer.parseInt(s_cPage));

		// ** 4. 현재 페이지의 시작번호와 끝번호 구하기
		s_paging.setBegin((s_paging.getNowPage() - 1) * s_paging.getNumPerPage() + 1);
		s_paging.setEnd((s_paging.getBegin() - 1) + s_paging.getNumPerPage());

		// ** 5. 현재 페이지에서 시작 블록과 끝 블록을 구하기
		s_paging.setBeginBlock(
				(int) ((s_paging.getNowPage() - 1) / s_paging.getPagePerBlock()) * s_paging.getPagePerBlock() + 1);
		s_paging.setEndBlock(s_paging.getBeginBlock() + s_paging.getPagePerBlock() - 1);

		// 1page => block 1-2, 2 => 1-2
		// 3page => block 3-4, 4 => 3-4
		// 5page => block 5-6, 6 => 5-6

		// 주의 사항 : endBlock이 totalPage보다 클 수 있다.
		// 이때는 쓸데없는 endBlock이 생성된다.
		// 따라서 endBlock이 totalPage보다 크면
		// endBlock을 totalPage로 변경하자.
		if (s_paging.getEndBlock() > s_paging.getTotalPage())
			s_paging.setEndBlock(s_paging.getTotalPage());

		// ** 6. 시작번호와 끝번호로 DB에서 원하는 만큼의 게시물 가져오기
		try {
			// System.out.println("begin, end :" + s_paging.getBegin() + ", " +
			// s_paging.getEnd());

			vo.setBegin(s_paging.getBegin());
			vo.setEnd(s_paging.getEnd());
			List<Goods_SaleVO> s_list = goodsService.getGoodsSaleList(vo);
			mv.addObject("g_s_list", s_list);
			mv.addObject("paging", s_paging);
		} catch (Exception e) {
			logger.info("getGoodsSale() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return mv;
	}

	@RequestMapping("mngr_goods_sale_cancel.do")
	public ModelAndView managerGoodsSaleCancel(HttpServletRequest request,
			@RequestParam("goods_sale_idx") String goods_sale_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_sale_cancel");
		
		//System.out.println("GoodsSaleCancel: second:" + request.getParameter("second"));
		
		try {
			Goods_SaleVO gsvo = goodsService.getGoodsSaleOne(goods_sale_idx);
			mv.addObject("gsvo", gsvo);
			mv.addObject("s_cPage", request.getParameter("s_cPage"));
			// second==y 이면, 취소처리 후 완료 모달창 출력을 위한 이동
			mv.addObject("second", request.getParameter("second"));
		} catch (Exception e) {
			logger.info("managerGoodsCancel() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		return mv;
	}

	@RequestMapping("mngr_goods_sale_cancel_exec.do")
	public ModelAndView managerGoodsSaleCancelExec(HttpServletRequest request,
			@ModelAttribute("goods_sale_idx") String goods_sale_idx) {
		ModelAndView mv = new ModelAndView("redirect:mngr_goods_sale_cancel.do?second=y");
		
		try {
			Goods_SaleVO gsvo = goodsService.getGoodsSaleOne(goods_sale_idx);
			
			// 나누미 반환 (Point db insert)
			PointVO pvo = new PointVO();
			pvo.setId(gsvo.getId());
			pvo.setP_category("REFUND");
			pvo.setRefund_point(gsvo.getTotal_price());
			pvo.setManager_id((String)request.getSession().getAttribute("managerID"));

			int point = goodsService.getMemberPoint(gsvo.getId());
			pvo.setRemain_point(point); // member db
			
			int result = goodsService.getPointInsertRefund(pvo);
			
			// member db cur_point 값이 증가
			goodsService.getMemberUpdatePoint(pvo.getId(), 
						String.valueOf(pvo.getRemain_point()+pvo.getRefund_point()));
		
			// 재고 반환 (Goods db update : cur_amount 에 구매수량을 더함)
			goodsService.getGoodsUpdateRestoreStock(gsvo.getGoods_idx(), gsvo.getAmount());
					
			// Goods Sale db update g_s_state, date
			result = goodsService.getGoodsSaleUpdateCancel(
					String.valueOf(gsvo.getGoods_sale_idx()), "주문취소 완료");
			
			mv.addObject("s_cPage", request.getParameter("s_cPage"));
		} catch (Exception e) {
			logger.info("managerGoodsCancelExec() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		
		return mv;
	}
	
	@RequestMapping("mngr_goods_sale_cancel_ok.do")
	public ModelAndView managerGoodsSaleCancelOk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_sale_cancel_ok");
		mv.addObject("s_cPage", request.getParameter("s_cPage"));
		return mv;
	}
	
	// 주문 처리 state 변경 팝업
	@RequestMapping("mngr_goods_sale_popup.do")
	public ModelAndView managerGoodsSalePopup(HttpServletRequest request,
			@ModelAttribute("goods_sale_idx") String goods_sale_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_sale_popup");		
		
		//System.out.println("goods_sale_idx : " + goods_sale_idx +
		//				   ", s_cPage: " + request.getParameter("s_cPage"));
		
		mv.addObject("s_cPage", request.getParameter("s_cPage"));
		return mv;
	}
	
	@RequestMapping("mngr_goods_sale_popup_ok.do")
	public ModelAndView managerGoodsSalePopupOk(HttpServletRequest request,
			@RequestParam("next_state") String next_state,
			@ModelAttribute("goods_sale_idx") String goods_sale_idx) {
		ModelAndView mv = new ModelAndView("manager/mngr_goods_sale_popup_ok");		
		
		//System.out.println("goods_sale_idx : " + goods_sale_idx + ", state: " + next_state +
		//		", s_cPage: " + request.getParameter("s_cPage"));
		
		try {
			goodsService.getGoodsSaleUpdateState(goods_sale_idx, next_state);
		} catch (Exception e) {
			logger.info("managerGoodsSalePopupOk() err" + e);
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		
		mv.addObject("s_cPage", request.getParameter("s_cPage"));
		return mv;
	}
	
}
