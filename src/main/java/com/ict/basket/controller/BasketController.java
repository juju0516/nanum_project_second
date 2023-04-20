package com.ict.basket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.basket.model.service.BasketService;
import com.ict.basket.model.vo.Goods_BasketVO;
import com.ict.basket.model.vo.PrjListBasketVO;
import com.ict.basket.model.vo.Project_BasketVO;
import com.ict.goods.model.service.Goods_Service;
import com.ict.goods.model.vo.GoodsVO;
import com.ict.project.model.service.ProjectService;
import com.ict.project.model.vo.ProjectVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private Goods_Service goods_Service;
	
	@Autowired
	private ProjectService projectService;
	
	
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}

	public void setGoods_Service(Goods_Service goods_Service) {
		this.goods_Service = goods_Service;
	}


	/* 프로젝트 바구니 보기 */
	@RequestMapping("basket_prj.do")
	public ModelAndView getBasketPrj(
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("basket/basket_prj");
		System.out.println("1.프로젝트 바구니 리스트 왔니");
		
		try {
			String loginID = (String)request.getSession().getAttribute("memberID");
			
//			PrjListBasketVO plistbvo = new PrjListBasketVO();
//				plistbvo.getId();
//				plistbvo.getProject_basket_idx();
//				plistbvo.getProject_idx();
//				plistbvo.getPrj_f_name();
//				plistbvo.getPrj_title();
//				plistbvo.getPrj_begin_date();
//				plistbvo.getPrj_end_date();
//				plistbvo.getCur_point();
//				plistbvo.getGoal_point();
//				plistbvo.getP_dnt_point();
				
		
			// 리스트에서 정보를 가져올 수 없다..일단두개 합쳐진VO를 생성했음.
			// 프로젝트 정보 가져오기..
			List<PrjListBasketVO> basket_prj = basketService.getBasketPrjList(loginID);
			System.out.println("2. 프로젝트 바구니 리스트 count : " + basket_prj.size());
			System.out.println("3. 프로젝트 바구니 리스트 id : " + basket_prj.get(0).getId());
			System.out.println("5. 프로젝트 바구니 리스트 메인이미지 : " + basket_prj.get(0).getPrj_f_name());

			//바구니VO에 없는 .
			System.out.println("4. 프로젝트 바구니 리스트 기간 : " + basket_prj.get(0).getPrj_begin_date()+ " + " + basket_prj.get(0).getPrj_end_date());
			System.out.println("6. 프로젝트 바구니 리스트 타이틀 : " + basket_prj.get(0).getPrj_title());
			mv.addObject("basket_prjList", basket_prj);
			
		} catch (Exception e) {
			System.out.println("basket_prjList:"+ e);
		}
		return mv; /*기본값은 프로젝트 바구니로한다.*/
	}
	
	
	/* 프로젝트 바구니 삭제하기 */
	@RequestMapping("basket_prjDelete.do")
	public ModelAndView getDeletePrjBasket(
			HttpServletRequest request,
			@ModelAttribute("project_idx") String project_idx,
			@ModelAttribute("project_basket_idx") int project_basket_idx) {
		
		ModelAndView mv = new ModelAndView("redirect:basket_prj.do");
		
		try {
			int result = basketService.getBasketPrjDelete(project_basket_idx);
		} catch (Exception e) {
		}
		return mv;
	}

	
	
	/*굿즈 바구니 보기*/
	@RequestMapping("basket_goods.do")
	public ModelAndView getBasketGoods(
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("basket/basket_goods");
		try {
			String loginID = (String)request.getSession().getAttribute("memberID");
			
			// goods에서 제품정보 리스트 가져오기
			List<Goods_BasketVO> basket_goodsList = basketService.getBasketGoodsList(loginID);	
			mv.addObject("basket_goodslist", basket_goodsList);
			
		} catch (Exception e) {
		}
		return mv;
	}
	
	
	/* 굿즈 바구니 담기*/
	@RequestMapping("basket_goods_add.do")
	public ModelAndView getAddGoodsBasket(
			HttpServletRequest request,/*리퀘스트 안에 세션있으니 세션안써도 됨 */
			@ModelAttribute("goods_idx") String goods_idx) {
		
		ModelAndView mv = new ModelAndView("redirect:goods_detail.do");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String loginID = (String)request.getSession().getAttribute("memberID"); // 세션에 저장된 아이디 가져오기
		// 굿즈 바구니에 같은 상품이 있는지 검사
		try {
			// 제품정보 가져오기 : goods에서
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);
			
			// id와 goods_idx를 가지고 굿즈바구니 정보 보기  : basket 에서
			Goods_BasketVO gbvo = basketService.getBasketGoodsOne(loginID, goods_idx);
			
			// 바구니에 해당굿즈가 없다면 추가하자
			if (gbvo == null) {
				Goods_BasketVO vo = new Goods_BasketVO();
				vo.setId(loginID);
				vo.setGoods_code(gvo.getGoods_code());
				vo.setGoods_name(gvo.getGoods_name());
				vo.setGoods_f_name(gvo.getGoods_main_img());
				vo.setAmount(amount); 
				vo.setPrice(gvo.getPrice());
				vo.setGoods_idx(Integer.parseInt(goods_idx));
				vo.setDelivery_charge(gvo.getDelivery_charge());
				int result = basketService.getBasketGoodsInsert(vo);
				mv.addObject("vo", vo);
			}else {
				int su = gbvo.getAmount() + amount;
				gbvo.setAmount(su);
				mv.addObject("gbvo", gbvo);
			// 해당 굿즈가 있다면 수량만 증가시키자.(원래바구니에서)
				int res = basketService.getBasketGoodsUpdate(gbvo);
			}
		} catch (Exception e) {
		}
		return mv;
	}
	
	//굿즈 바구니에서 수량 수정하기 
	@RequestMapping("basket_goods_edit.do")
	public ModelAndView getEditGoodsBasket(
			HttpServletRequest request,
			@ModelAttribute("goods_idx") String goods_idx,
			@ModelAttribute("amount") String amount,
			@ModelAttribute("goods_basket_idx") String goods_basket_idx) {
		System.out.println("basket_goods_edit.do -> goods_basket_idx 가져왔니? :" + goods_basket_idx);
		System.out.println("basket_goods_edit.do -> goods_idx 가져왔니? :" + goods_idx);
		System.out.println("basket_goods_edit.do -> 변경된 수량 가져왔니? :" + amount);
	
		ModelAndView mv = new ModelAndView("redirect:basket_goods.do");
		String loginID = (String)request.getSession().getAttribute("memberID");
		
		try {
			//기존 값 가져오기
//			System.out.println("바뀐 수량이 있니? : " + amount);
//			System.out.println("바뀐 수량이 있니? 2 : " + gbvo.getAmount());
//			System.out.println("goods_basket_idx : "+goods_basket_idx);
//			System.out.println("goods_idx:"+ goods_idx);
//			System.out.println("amount:"+amount);
			
			int result = basketService.getBasketGoodsEdit(goods_basket_idx, amount);
			System.out.println("결과가 1이면 성공! : " + result);
			if (result > 0) {
				Goods_BasketVO gbvo = basketService.getBasketGoodsOne(loginID, goods_idx);
				System.out.println("바뀐 수량이 들어가 있니? : " + gbvo.getAmount());
				mv.addObject("gbvo", gbvo);
				// goods에서 제품정보 리스트 가져오기
//				List<Goods_BasketVO> basket_goodsList = basketService.getBasketGoodsList(loginID);
//				mv.addObject("basket_goodslist", basket_goodsList);
			}
		} catch (Exception e) {
		}
		return mv;
	}
	
	//굿즈 바구니에서 굿즈 삭제 하기
	@RequestMapping("basket_goods_delete.do")
	public ModelAndView getDeleteGoodsBasket(
			HttpServletRequest request,
			@ModelAttribute("goods_idx") String goods_idx,
			@ModelAttribute("goods_basket_idx") String goods_basket_idx) {
		
		ModelAndView mv = new ModelAndView("redirect:basket_goods.do");
		String loginID = (String)request.getSession().getAttribute("memberID");
		try {
			int result = basketService.getBasketGoodsDelete(goods_basket_idx);
			if (result > 0) {
				// goods에서 제품정보 리스트 가져오기
				List<Goods_BasketVO> basket_goodsList = basketService.getBasketGoodsList(loginID);
				mv.addObject("basket_goodslist", basket_goodsList);
			}  
		} catch (Exception e) {
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
