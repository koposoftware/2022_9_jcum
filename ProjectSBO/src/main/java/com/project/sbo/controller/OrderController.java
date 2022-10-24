package com.project.sbo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.sbo.login.LoginService;
import com.project.sbo.service.OrderService;
import com.project.sbo.service.PaymentService;
import com.project.sbo.util.CreateOrderNum;
import com.project.sbo.util.FoodInfoFromJson;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.CartList;
import com.project.sbo.vo.OrderInfo;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Page;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PaymentService paymentService;

	// 스프링 시큐리티 로인 시 유저정보는 @AuthenticationPrincipal 접근가능
	@GetMapping("/order/{storeId}")
	public String order(HttpSession session, Model model, @AuthenticationPrincipal LoginService user,
			HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept");
		response.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS,DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
 
		CartList cartList = (CartList) session.getAttribute("cartList");
 
		model.addAttribute("cartList", cartList);
 
		if (user != null) {
			model.addAttribute("user", user.getUser());
		}
		// 결제 기능 넣으면서 삭제 처리
		String orderNum = CreateOrderNum.createOrderNum();
		model.addAttribute("orderNum", orderNum);
		return "order/order";
	}
 

 

	// 주문정보 검증 메서드
	@ResponseBody
	@PostMapping("/order/payment-cash")
	public ResponseEntity<String> payment(HttpSession session, OrderInfo orderInfo, long totalPrice, @AuthenticationPrincipal LoginService user) throws IOException {
	    
	    CartList cartList = (CartList) session.getAttribute("cartList");
	    
	    long orderPriceCheck = orderService.orderPriceCheck(cartList);
	    
	    if(orderPriceCheck == totalPrice) {
	        orderService.order(cartList, orderInfo, user, session);
	        session.removeAttribute("cartList");
	    }
	 
	    return new ResponseEntity<>(HttpStatus.OK);
	}

	
	// 주문 완료 후 주문 목록
	@GetMapping({"/orderList", "/orderList/{page}"})
	public String orderList(@AuthenticationPrincipal LoginService user, Model model, @PathVariable(required = false) Integer page) {
	    if (user == null) {
	        //System.out.println("비로그인");
	    } else {
	        //System.out.println("로그인");
	        long userId = user.getUser().getId();
	 
	        Page p = new Page(page);
	        List<OrderList> orderList = orderService.orderList(userId, p);
	 
	        if (orderList.size() == 0) {
	            return "order/orderList";
	        }
	 
	        List<List<Cart>> cartList = new ArrayList<>();
	 
	        for (int i=0;i<orderList.size();i++) {
	            cartList.add(FoodInfoFromJson.foodInfoFromJson(orderList.get(i).getFoodInfo()));
	        }
	        
	        p.totalPage(orderList.get(0).getListCount());
	        model.addAttribute("page", p);
	        model.addAttribute("user", user.getUser());
	        model.addAttribute("cartList", cartList);
	        model.addAttribute("orderList", orderList);
	    }
	 
	    return "order/orderList";
	}
	
	// 주문 상세 페이지
	// 주문번호로 주문상세를 불러오고 비로그인 사용자, 주문자 아이디가 일치하지 않으면 접근 불가
	@GetMapping("/orderListDetail/{orderNum}")
	public String orderDetail(@PathVariable String orderNum, Model model, @AuthenticationPrincipal LoginService user) {
	 
	    OrderList orderDetail = orderService.orderListDetail(orderNum);
	    
	    if (user != null && (user.getUser().getId() != orderDetail.getUserId())) {
	        //System.out.println("다른 사용자");
	        return "redirect:/";
	    } else if (user == null) {
	        //System.out.println("비로그인");
	        return "redirect:/";
	    }
	    
	    List<Cart> list = FoodInfoFromJson.foodInfoFromJson(orderDetail.getFoodInfo());
	    
	    //System.out.println("list 값은 ? : "+list);
	 
	    model.addAttribute("orderDetail", orderDetail);
	    model.addAttribute("cart", list);
	 
	    return "order/orderListDetail";
	}
	
	
	// 카드 결제 성공 후
	@PostMapping("/order/payment/complete")
	public ResponseEntity<String> paymentComplete(HttpSession session, OrderInfo orderInfo, 
			long totalPrice, @AuthenticationPrincipal LoginService user) throws IOException {
		
		String token = paymentService.getToken();
	    //System.out.println("토큰 : " + token);
	    // 결제 완료된 금액
	    int amount = paymentService.paymentInfo(orderInfo.getImpUid(), token);
	    
	    try {
	        // 주문 시 사용한 포인트
	        int usedPoint = orderInfo.getUsedPoint();
	        
	        if (user != null) {
	            int point = user.getUser().getPoint();
	            
	            // 사용된 포인트가 유저의 포인트보다 많을 때
	            if (point < usedPoint) {
	                paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "유저 포인트 오류");
	                return new ResponseEntity<String>("유저 포인트 오류", HttpStatus.BAD_REQUEST);
	            }
	 
	        } else {
	            // 로그인 하지않았는데 포인트사용 되었을 때
	            if (usedPoint != 0) {
	                paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "비회원 포인트사용 오류");
	                return new ResponseEntity<String>("비회원 포인트 사용 오류", HttpStatus.BAD_REQUEST);
	            }
	        }
	        
	        CartList cartList = (CartList) session.getAttribute("cartList");
	        // 실제 계산 금액 가져오기
	        long orderPriceCheck = orderService.orderPriceCheck(cartList)  - usedPoint;
	        
	        // 계산 된 금액과 실제 금액이 다를 때
	        if (orderPriceCheck != amount) {
	            paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "결제 금액 오류");
	            return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
	        }
	        
	        orderService.order(cartList, orderInfo, user, session);
	        session.removeAttribute("cartList");
	        
	        String DEAL_DATE = orderInfo.getPaid_at().split(" ")[0];
	        String DEAL_TIME = orderInfo.getPaid_at().split(" ")[1];
	        
	        orderInfo.setDEAL_DATE(DEAL_DATE);
	        orderInfo.setDEAL_TIME(DEAL_TIME);
	        orderInfo.setBUSINESS_NO("610-11-46885");
	        
	        //System.out.println(orderInfo);
	        
	        orderService.crefiaInsert(orderInfo);
	        
	        //orderService.crefiaInsert(orderInfo.getAPPROVAL_NO(),
	        //		orderInfo.getAPPROVAL_AMOUNT(), "610-11-46885", orderInfo.getCARD_NAME(),
	        //		orderInfo.getCARD_NUMBER(),DEAL_DATE, DEAL_TIME);
	        
	        
	        
	        return new ResponseEntity<>("주문이 완료되었습니다", HttpStatus.OK);
	        
	    } catch (Exception e) {
	        paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "결제 에러");
	        return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
	    }
	    
		// 1. 아임포트 API 키와 SECRET키로 토큰을 생성
	    
		// 2. 토큰으로 결제 완료된 주문정보를 가져옴
	    
	    // 3. 로그인하지 않았는데 사용포인트가 0 이상일경우 결제 취소
	    
	    // 4. 로그인 사용자가 현재포인트보다 사용포인트가 많을 경우 결제 취소
	    
	    // 5. DB에서 실제 계산되어야 할 가격가져오기
	    
	    // 6. 결제 완료된 금액과 실제 계산되어야 할 금액이 다를경우 결제 취소
	    
	    // 7. 결제에러시 결제 취소
	}

	

}