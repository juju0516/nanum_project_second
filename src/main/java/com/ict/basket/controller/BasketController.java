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
import com.ict.basket.model.vo.Project_BasketVO;
import com.ict.goods.model.service.Goods_Service;
import com.ict.goods.model.vo.GoodsVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private Goods_Service goods_Service;
	
	
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}

	public void setGoods_Service(Goods_Service goods_Service) {
		this.goods_Service = goods_Service;
	}


	/* 프로젝트 바구니 보기 */
	@RequestMapping("basket_prj.do")
	public ModelAndView getBasketPrj(
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView("basket/basket_prj");
		
//		try {
//			String loginID = (String)session.getAttribute("memberID");
//			List<Project_BasketVO> basket_prjList = basketService.getBasketPrjList("coffee");
//			mv.addObject("basket_prjList", basket_prjList);
//		} catch (Exception e) {
//			System.out.println("basket_prjList:"+ e);
//		}
		return mv; /*기본값은 프로젝트 바구니로한다.*/
	}
	
	
	/* 프로젝트 바구니 삭제하기 */
	@RequestMapping("basket_prjDelete.do")
	public ModelAndView getDeletePrjBasket(
			@ModelAttribute("project_basket_idx") int project_basket_idx) {
		
		ModelAndView mv = new ModelAndView("redirect:basket_prj.do");
//		try {
//			int result = basketService.getBasketGoodsDelete(project_basket_idx);
//		} catch (Exception e) {
//		}
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
			
			// goods에서 제품정보 가져오기
			List<Goods_BasketVO> basket_goodsList = basketService.getBasketGoodsList(loginID);
			System.out.println("basket_goodsList : "+basket_goodsList.get(0).getGoods_idx());
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
				int result = basketService.getBasketGoodsInsert(vo);
				mv.addObject("vo", vo);
			}else {
				int su = gbvo.getAmount() + amount;
				gbvo.setAmount(su);
				mv.addObject("gbvo", gbvo);
				System.out.println("장바구니담기에서 수량 변경되어 저장되는지 확인 :" + gbvo.getAmount());
			// 해당 굿즈가 있다면 수량만 증가시키자.(원래바구니에서)
				int res = basketService.getBasketGoodsUpdate(gbvo);
			}
		} catch (Exception e) {
			System.out.println("basket_goods_add:" +e);
		}
		return mv;
	}
	
	//굿즈 바구니에서 수량 수정하기 
	@RequestMapping("basket_goods_edit.do")
	public ModelAndView getEditGoodsBasket(
			@ModelAttribute("goods_idx") int goods_idx,
			@ModelAttribute("amount") int amount) {
			/* 잊지 말자! vo 자료형과 맞지 않아도되지만, service 자료형과는 맞아야 한다.*/
	
		ModelAndView mv = new ModelAndView("redirect:basket_goods.do");
//		try {
//			int result = basketService.getBasketGoodsEdit(goods_idx, amount);
//		} catch (Exception e) {
//		}
		return mv;
	}
	
	//굿즈 바구니에서 굿즈 삭제 하기
	@RequestMapping("basket_goods_delete.do")
	public ModelAndView getDeleteGoodsBasket(
			@ModelAttribute("goods_idx") int goods_idx) {
		
		ModelAndView mv = new ModelAndView("redirect:basket_goods.do");
//		try {
//			int result = basketService.getBasketGoodsDelete(goods_idx);
//		} catch (Exception e) {
//		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
