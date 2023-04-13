package com.ict.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.goods.model.service.Goods_Service;
import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

@Controller
public class GoodsController {
	
	@Autowired
	private Goods_Service goods_Service;

	
	/* 굿즈 리스트 보기 */
	@RequestMapping("goods_list.do")
	public ModelAndView getGoodsList(
			) {
		ModelAndView mv = new ModelAndView("goods/goods_list");
		try {
			List<GoodsVO> goodsList = goods_Service.getGoodsList();
			mv.addObject("goodsList", goodsList);
			System.out.println("goodsList : "+ goodsList.toString());
		} catch (Exception e) {
			System.out.println("goodsList : " + e.toString());
		}
		return mv;
	}
		
	@RequestMapping("goods_detail.do")
	public ModelAndView getGoodsDetail(
			@ModelAttribute("goods_idx") String goods_idx) {
		ModelAndView mv = new ModelAndView("goods/goods_detail");
		try {
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);
			mv.addObject("gvo", gvo);
		} catch (Exception e) {
		}
		return mv;
	}
	
	/* 굿즈 판매 관련 - 상세페이지에서 바로 구매하는 경우 */
	@RequestMapping("goods_direct_sale.do")
	public ModelAndView getGoodsDirectOrder(
			@ModelAttribute("goods_idx") String goods_idx,
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("goods/goods_direct_sale");
		//form에서 수량가져오기
		int amount = Integer.parseInt(request.getParameter("amount"));
		String loginID = (String)request.getSession().getAttribute("memberID");
		try {
			//멤버 정보 가져오기
			MemberVO mvo =  goods_Service.getmemberInfo(loginID);
			//굿즈정보가져오기
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);
			mv.addObject("gvo", gvo);
			mv.addObject("amount", amount);
			mv.addObject("mvo", mvo);
			
		} catch (Exception e) {
			System.out.println("goods_direct_sale.do : " + e);
		}
		return mv;
	}
	
	/* 굿즈바구니에서 결제하는 경우 */
	@RequestMapping("goods_basket_sale.do")
	public ModelAndView getGoodsBasketOrder(
			@ModelAttribute("goods_idx") String goods_idx,
			HttpServletRequest request
			) {
		System.out.println("goods_basket_sale : 왔니");
		ModelAndView mv = new ModelAndView("goods/goods_basket_sale");
		//form에서 수량가져오기
		int amount = Integer.parseInt(request.getParameter("amount"));
		try {
			//굿즈정보가져오기
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);
			//수량 / 가격 / 배송비 (6나누미) 
			
		} catch (Exception e) {
			System.out.println("goods_basket_sale.do : " + e);
		}
		return mv;
	}
	
	
	/* 주문결제 팝업 */
	@RequestMapping("goods_popup_pay.do")
	public ModelAndView getPayment(
			HttpServletRequest request,
			@ModelAttribute("goods_idx") String goods_idx,
			@ModelAttribute("amount") String amount
			) {
		ModelAndView mv = new ModelAndView("goods/goods_popup_pay");
		String loginID = (String)request.getSession().getAttribute("memberID");
		try {		
			MemberVO mvo = goods_Service.getmemberInfo(loginID);
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);

			mv.addObject("mvo", mvo);
			mv.addObject("amount", amount);
			mv.addObject("gvo", gvo);
			
			System.out.println("goods_popup_pay.do :"+gvo);
		} catch (Exception e) {
			System.out.println("goods_popup_pay.do 오류:" + e);
		}
		return mv;
	}
	
	@RequestMapping("goods_pay_ok_exec.do")
	public ModelAndView getPaymentExec(
			HttpServletRequest request,
			@ModelAttribute("goods_idx") String goods_idx,
			@ModelAttribute("amount") String amount
			) {
		
		System.out.println("goods_pay_ok_exec.do 왔니");
		/* 결제를 실제 실행하는 곳. 
		 * 구매자아이디, 상품정보, 구매수량, 배송비 정보 가져오기
		 * 구매자 현재 보유 포인트 - 총 결제 포인트 => 보유포인트 업데이트
		 * 
		 * */
		ModelAndView mv = new ModelAndView("redirect:goods_popup_pay_ok.do");
		String loginID = (String)request.getSession().getAttribute("memberID");
		try {
			MemberVO mvo = goods_Service.getmemberInfo(loginID); /*주문자 정보*/
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx); /*주문상품정보*/
		
			int total_price = (gvo.getPrice()*Integer.parseInt(amount))+ 6; //6나누미로 하드코딩했음.
//			int total_price = (gvo.getPrice()*Integer.parseInt(amount))+gvo.getDelivery_charge();
			
			mv.addObject("mvo", mvo);
			mv.addObject("amount", amount);
			mv.addObject("gvo", gvo);
			
			// 판매내역 삽입하기. 언제?
			// 구매자 보유 포인트에서 최종 금액을 뺀 나머지 금액으로 업데이트하기
			// 구매 완료 했다면 배송지정보 삽입하기
			Goods_SaleVO salevo = new Goods_SaleVO(); /*판매정보를 담을 곳*/
				salevo.setId(loginID);
				salevo.setGoods_idx(Integer.parseInt(goods_idx));
				salevo.setAmount(Integer.parseInt(amount));
				salevo.setPrice(gvo.getPrice());
				salevo.setG_s_state("주문");
				salevo.setGoods_name(gvo.getGoods_name());
				salevo.setGoods_code(gvo.getGoods_code());
				salevo.setGoods_f_name(gvo.getGoods_main_img());
				salevo.setTotal_price(total_price);
				
				int saleResult = goods_Service.getGoodsSaleInsert(salevo);
				
				if (saleResult > 0) {
					mv.addObject("salevo", salevo);
					// 주문수량만큼 재고수량차감하기
					gvo.setCur_amount(gvo.getCur_amount()-Integer.parseInt(amount));
					mv.addObject("gvo", gvo);
					int gvoResult = goods_Service.getGoodsCurAmountUpdate(gvo);
					
					//구매자 보유 포인트 업데이트 (보유포인트 - 총구매포인트)
					MemberVO memvo = new MemberVO();
					memvo.setCur_point(mvo.getCur_point()-total_price);
					memvo.setId(loginID);
					
					mv.addObject("memvo", memvo);
					int memResult = goods_Service.getMemberCurpointUpdate(memvo);
					if (memResult > 0) {
						// point 사용내역 추가하기
						PointVO pvo = new PointVO();
						
						pvo.setId(loginID);
						pvo.setP_category("BUY");
						pvo.setRemain_point(memvo.getCur_point());
						pvo.setDeduct_point(total_price);
						pvo.setDeduct_date(salevo.getSale_date());
						int pointResult= goods_Service.getSalePointInsert(pvo);
						mv.addObject("pvo", pvo);
					}
				}
		} catch (Exception e) {
			System.out.println("goods_pay_ok_exec.do - exception" + e);
		}
		return  mv;
	}
	
	@RequestMapping("goods_popup_pay_ok.do")
	public ModelAndView getPaymentOk() {
		return new ModelAndView("goods/goods_popup_pay_ok");
	}
}





























