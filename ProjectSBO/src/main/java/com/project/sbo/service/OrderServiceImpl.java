package com.project.sbo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.project.sbo.dao.AdminDAO;
import com.project.sbo.dao.OrderDAO;
import com.project.sbo.login.LoginService;
import com.project.sbo.util.UserInfoSessionUpdate;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.CartList;
import com.project.sbo.vo.OrderDetail;
import com.project.sbo.vo.OrderInfo;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Page;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private AdminDAO adminDAO;

	
	@Transactional
	@Override
	public long orderPriceCheck(CartList cartList) {
 
		//System.out.println("cartDetail = " + cartList);
 
		List<Cart> cart = cartList.getCart();
		List<Integer> foodPriceList = orderDAO.foodPriceList(cart);
		List<Integer> optionPriceList = orderDAO.optionPriceList(cart);
		int deleveryTip = orderDAO.getDeleveryTip(cartList.getStoreId());
		//System.out.println("foodPriceList = " + foodPriceList);
		//System.out.println("optionPriceList = " + optionPriceList);
		
		int sum = 0;
		
		for (int i = 0; i < cart.size(); i++) {
			int foodPrice = foodPriceList.get(i);
			int amount = cart.get(i).getAmount();
			int optionPrice = optionPriceList.get(i);
 
			sum += (foodPrice + optionPrice) * amount;
		}
 
		return sum + deleveryTip; 
	}
	
	
	
	// 주문처리 관련
	@Transactional
	@Override
	public String order(CartList cart, OrderInfo info, LoginService user, HttpSession session) {
		Gson gson = new Gson();
		
		int total = cart.getCartTotal();
		
		info.setStoreId(cart.getStoreId());
		info.setTotalPrice(total);
		
		long userId = 0;
		
		if (user != null) {
			//System.out.println("첫번쨰??");
			userId = user.getUser().getId();
			//System.out.println("userId : "+userId);
			info.setUserId(userId);
			
			// 회원포인트 적립
			String storeName = cart.getStoreName();
			int point = (int)(total * 0.01); 
			int result = adminDAO.pointUpdate(userId, storeName, point);
			if(result == 1) {
				//System.out.println("들어오긴하제?");
				//UserInfoSessionUpdate.sessionUpdate(point+"", "point", user,session);
				UserInfoSessionUpdate.sessionUpdate(point+"", "point", user);
			}else {
				System.out.println("포인트 적립 실패");
			}
			
			
		}
//		if (user != null) {
//			System.out.println("첫번쨰??");
//			userId = user.getUser().getId();
//			info.setUserId(userId);
//		}
//		
//		// 회원 포인트 적립
//		if (user != null) {
//			System.out.println("두번쨰??");
//		    String storeName = cart.getStoreName();
//		    int point = (int)(total * 0.01); 
//		    int result = adminDAO.pointUpdate(userId, storeName, point);
//		    if(result == 1) {
//		        UserInfoSessionUpdate.sessionUpdate(point+"", "point", user, session);
//		    }
//		}
		
		// 포인트 차감메서드
		// 로그인 사용자가 포인트 사용했을때
		if(info.getUsedPoint() != 0 ) {
		    String storeName =  cart.getStoreName();
		    int usedPoint =  -info.getUsedPoint();
		    int result = adminDAO.pointUpdate(userId, storeName, usedPoint);
		    
		    if(result == 1) {
		        UserInfoSessionUpdate.sessionUpdate(usedPoint+"", "point", user);
		    }
		}
		
		
		List<Cart> cartList = cart.getCart();
		
		//System.out.println("cart 정보: "+ cart);
		
		OrderDetail[] detail = new OrderDetail[cartList.size()];
		
		
		for(int i = 0; i < detail.length; i++) {
			String cartJSON = gson.toJson(cartList.get(i));
			detail[i] = new OrderDetail(info.getOrderNum(), cartJSON);
			//System.out.println("뽑아보자"+detail[i]+"/");
		}
		
		orderDAO.order(info);
		//orderDAO.orderDetail(detail, userId);
		orderDAO.orderDetail(detail, Long.parseLong(info.getOrderNum()));
		
		
		
		return null;
	}
	
	
	// 주문 목록처리
	@Override
	public List<OrderList> orderList(long userId, Page p) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("firstList", p.getFirstList());
		map.put("lastList", p.getLastList());
		
//		System.out.println("첫번째 목록 = " + p.getFirstList() + " 마지막 목록 = " + p.getLastList());
//		System.out.println("첫번째 = " + p.getFirstPage() + " 마지막 = " + p.getLastPage() );
//		System.out.println("이전페이지 = " + p.getPrevPage());
//		System.out.println("다음페이지 = " + p.getNextPage());
		return orderDAO.orderList(map);
	}
	
	// 주문목록 상세보기
	@Override
	public OrderList orderListDetail(String orderNum) {
		return orderDAO.orderListDetail(orderNum);
	}

	// 여신협회 데이터 처리
	@Override
	public void crefiaInsert(OrderInfo info) {
		orderDAO.crefiaInsert(info);
	}
}
