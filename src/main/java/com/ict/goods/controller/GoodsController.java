package com.ict.goods.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.basket.model.service.BasketService;
import com.ict.basket.model.vo.Goods_BasketVO;
import com.ict.common.Paging;
import com.ict.goods.model.service.Goods_Service;
import com.ict.goods.model.vo.GoodsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;

@Controller
public class GoodsController {
	
	@Autowired
	private Goods_Service goods_Service;
	
	@Autowired
	private BasketService basketService;
	
	
	/* 굿즈 리스트 보기 */
	@RequestMapping("goods_list.do")
	public ModelAndView getGoodsList(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("goods/goods_list");
		String loginID = (String)request.getSession().getAttribute("memberID");
		
			try {
				List<GoodsVO> goodsList = goods_Service.getGoodsList();	
				mv.addObject("goodsList", goodsList);
				System.out.println("굿즈 리스트 : " + goodsList.size());
				
			} catch (Exception e) {
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
	
	/* 굿즈 판매 관련 - 바로 구매하는 경우 */
	@RequestMapping("goods_direct_sale.do")
	public ModelAndView getGoodsDirectOrder(
			@ModelAttribute("goods_idx") String goods_idx,
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("goods/goods_direct_sale");
		//form에서 수량가져오는 경우
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
	
	/* 굿즈 판매 관련 - 바구니에서 목록에서 하나만 구매하는 경우 */
	@RequestMapping("goods_basket_direct_sale.do")
	public ModelAndView getGoodsBasketDirectOrder(
			@ModelAttribute("goods_idx") String goods_idx,
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("goods/goods_direct_sale");
		//form에서 수량가져오는 경우
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
	
	
	/* 굿즈바구니에서 주문창으로 이동하기 */
	@RequestMapping("goods_basket_sale.do")
	public ModelAndView getGoodsBasketOrder(
			HttpServletRequest request
			) {
	    ModelAndView mv = new ModelAndView("goods/goods_basket_sale");

	    try {
	        String loginID = (String) request.getSession().getAttribute("memberID");
	        String[] goods_basket_idxs = request.getParameterValues("goods_basket_idx");
	        String[] goods_idxs = request.getParameterValues("goods_idx");
	        String[] amounts = request.getParameterValues("amount");
	        String[] prices = request.getParameterValues("price");
	        
	        List<Goods_BasketVO> goodsBasketlist = new ArrayList<Goods_BasketVO>();
	        for(int i=0; i < goods_idxs.length; i++) {	
	        	String goods_basket_idx = goods_basket_idxs[i];
	        	int amount = Integer.parseInt(amounts[i]);
	        	// basket_idx 
	        	Goods_BasketVO gbvo = basketService.getBasketGoodsOneList(goods_basket_idx);
	        	gbvo.setAmount(amount);
	        	goodsBasketlist.add(gbvo);
	        }
	        mv.addObject("goodsBasketlist", goodsBasketlist); // 바구니에 담긴 굿즈 정보들을 리스트에 저장하자.
	        System.out.println("goodsBasketlist : " + goodsBasketlist.size());
	        // 멤버 정보 가져오기 : 보유포인트 확인에 필요.
	        MemberVO mvo = goods_Service.getmemberInfo(loginID);
	        mv.addObject("mvo", mvo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mv;
	}
	
	/* input에 들어간 배송정보를 저장하자 */
	@RequestMapping("goods_delivary_addr_save.do")
	public ModelAndView delivaryAdderSave(
			@ModelAttribute("goods_idx") String goods_idx,
			HttpServletRequest request
			) {
		System.out.println("주소저장왔어?");
		ModelAndView mv = new ModelAndView("redirect:goods_direct_sale.do");
		// redirect는 값이 없어지기 떄문에 그 전의 정보를 다시 넣어줘야 한다.
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		String loginID = (String)request.getSession().getAttribute("memberID");
		
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String addr = request.getParameter("address");
		String detailAddr = request.getParameter("detailAddress");
		String memo = request.getParameter("memo");
		
		String address = postcode;
		address = address.concat("/");
		address = address.concat(addr);
		address = address.concat("/");
		address = address.concat(detailAddr);
		address = address.concat("/");
		address = address.concat(memo);
		
		try {
			
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx);
			
			MemberVO mvo = goods_Service.getmemberInfo(loginID);
				if (mvo.getAddress() != null || mvo.getLast_address() != null) {
					mvo.setLast_address(address);
					mvo.setAddress(mvo.getAddress());
				} else if (mvo.getAddress() != null || mvo.getLast_address() == null) {
					mvo.setLast_address(address);
					mvo.setAddress(mvo.getAddress());
				} else if(mvo.getAddress() == null){
					mvo.setAddress(address);
					mvo.setLast_address(address);
				} else {
					mvo.setAddress(address);
					mvo.setLast_address(address);
				}

			mv.addObject("amount", amount);
			mv.addObject("gvo", gvo);
			mv.addObject("mvo", mvo);
			
			int addrUpdateResult = goods_Service.delivaryUpdate(mvo);
			
		} catch (Exception e) {
		}
		return mv;
	}
	
	/* 주문결제 팝업 - 바로결제 하는경우 */
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
			
			//여기서 넣는것이 맞는가...
			Goods_BasketVO gbvo = basketService.getBasketGoodsOne(loginID, goods_idx);
			if (gbvo != null) { 				
				gbvo.getGoods_basket_idx();
				mv.addObject("gbvo", gbvo);
			}
			
			mv.addObject("mvo", mvo);
			mv.addObject("amount", amount);
			mv.addObject("gvo", gvo);
			
			System.out.println("goods_popup_pay.do :"+gvo);
		} catch (Exception e) {
			System.out.println("goods_popup_pay.do 오류:" + e);
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/*목록에서 바로결제 하는 경우 실행하는 곳.*/
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
		 * 바구니에서 결제했다면, 바구니 목록에서 삭제하기.
		 * 
		 * */
		ModelAndView mv = new ModelAndView("redirect:goods_popup_pay_ok.do");
		String loginID = (String)request.getSession().getAttribute("memberID");
		try {
			MemberVO mvo = goods_Service.getmemberInfo(loginID); /*주문자 정보*/
			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx); /*주문상품정보*/
			Goods_BasketVO gbvo = basketService.getBasketGoodsOne(loginID, goods_idx);
		
		
			int total_price = (gvo.getPrice()*Integer.parseInt(amount))+gvo.getDelivery_charge();
			
			mv.addObject("gbvo", gbvo);
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
						int pointResult = goods_Service.getSalePointInsert(pvo);
						mv.addObject("pvo", pvo);
					}
					int gbvoResult = basketService.getBasketGoodsDelete(String.valueOf(gbvo.getGoods_basket_idx()));
					System.out.println("gbvoResult 결과가 1이면 성공! : " + gbvoResult );
				}
		} catch (Exception e) {
			System.out.println("goods_pay_ok_exec.do - exception" + e);
		}
		return  mv;
	}
	
	

	/* 주문결제 팝업2 - 바구니에서 다중결제 하는경우 */
	@RequestMapping("goods_basketPopup_pay.do")
	public ModelAndView getBasketPayment(
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView("goods/goods_basketPopup_pay");
		
		return mv;
		
	}
	
	
	/*바구니에서 다중결제 하는 경우 실행하는 곳.*/
	@RequestMapping("goods_basketpay_ok_exec.do")
	public ModelAndView getBasketPaymentExec(
			HttpServletRequest request
			) {
		/* 결제를 실제 실행하는 곳. 
		 * 구매자아이디, 상품정보, 구매수량, 배송비 정보 가져오기
		 * 구매자 현재 보유 포인트 - 총 결제 포인트 => 보유포인트 업데이트
		 * 바구니에서 결제했다면, 바구니 목록에서 삭제하기.
		 * 
		 * */
		ModelAndView mv = new ModelAndView("redirect:goods_popup_pay_ok.do");
		String loginID = (String)request.getSession().getAttribute("memberID");
		
//		try {
//			MemberVO mvo = goods_Service.getmemberInfo(loginID); /*주문자 정보*/
//			GoodsVO gvo = goods_Service.getGoodsDetail(goods_idx); /*주문상품정보*/
//			Goods_BasketVO gbvo = basketService.getBasketGoodsOne(loginID, goods_idx);
//		
//			int total_price = (gvo.getPrice()*Integer.parseInt(amount))+ 6; //6나누미로 하드코딩했음.
////			int total_price = (gvo.getPrice()*Integer.parseInt(amount))+gvo.getDelivery_charge();
//			
//			mv.addObject("mvo", mvo);
//			mv.addObject("amount", amount);
//			mv.addObject("gvo", gvo);
//			
//			// 판매내역 삽입하기. 언제?
//			// 구매자 보유 포인트에서 최종 금액을 뺀 나머지 금액으로 업데이트하기
//			// 구매 완료 했다면 배송지정보 삽입하기
//			Goods_SaleVO salevo = new Goods_SaleVO(); /*판매정보를 담을 곳*/
//				salevo.setId(loginID);
//				salevo.setGoods_idx(Integer.parseInt(goods_idx));
//				salevo.setAmount(Integer.parseInt(amount));
//				salevo.setPrice(gvo.getPrice());
//				salevo.setG_s_state("주문");
//				salevo.setGoods_name(gvo.getGoods_name());
//				salevo.setGoods_code(gvo.getGoods_code());
//				salevo.setGoods_f_name(gvo.getGoods_main_img());
//				salevo.setTotal_price(total_price);
//				
//				int saleResult = goods_Service.getGoodsSaleInsert(salevo);
//				
//				if (saleResult > 0) {
//					mv.addObject("salevo", salevo);
//					// 주문수량만큼 재고수량차감하기
//					gvo.setCur_amount(gvo.getCur_amount()-Integer.parseInt(amount));
//					mv.addObject("gvo", gvo);
//					int gvoResult = goods_Service.getGoodsCurAmountUpdate(gvo);
//					
//					//구매자 보유 포인트 업데이트 (보유포인트 - 총구매포인트)
//					MemberVO memvo = new MemberVO();
//					memvo.setCur_point(mvo.getCur_point()-total_price);
//					memvo.setId(loginID);
//					
//					mv.addObject("memvo", memvo);
//					int memResult = goods_Service.getMemberCurpointUpdate(memvo);
//					if (memResult > 0) {
//						// point 사용내역 추가하기
//						PointVO pvo = new PointVO();
//						
//						pvo.setId(loginID);
//						pvo.setP_category("BUY");
//						pvo.setRemain_point(memvo.getCur_point());
//						pvo.setDeduct_point(total_price);
//						pvo.setDeduct_date(salevo.getSale_date());
//						int pointResult = goods_Service.getSalePointInsert(pvo);
//						mv.addObject("pvo", pvo);
//						
//					// 바구니 목록에서 구매한 상품목록은 삭제하기
//						
//						
//					}
//				}
//		} catch (Exception e) {
//			System.out.println("goods_pay_ok_exec.do - exception" + e);
//		}
		return  mv;
	}
	
	
	
	@RequestMapping("goods_popup_pay_ok.do")
	public ModelAndView getPaymentOk() {
		return new ModelAndView("goods/goods_popup_pay_ok");
	}
}





























