package com.project.sbo.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.sbo.login.LoginService;
import com.project.sbo.vo.CartList;
import com.project.sbo.vo.OrderInfo;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Page;

public interface OrderService {
	 
	//	장바구니에 담긴 금액과 db의 금액이 같은지 확인
	long orderPriceCheck(CartList cartList);
	// 주문완료 처리
	public String order(CartList cart, OrderInfo info, LoginService user, HttpSession session);
	// 주문목록
	List<OrderList> orderList(long userId, Page p);
	// 주문목록 상세보기
	OrderList orderListDetail(String orderNum);
	// 여신협회 데이터 넣기
	//void crefiaInsert(String APPROVAL_NO, int APPROVAL_AMOUNT, String BUSINESS_NO,
	//		String CARD_NAME, String CARD_NUMBER, String DEAL_DATE, String DEAL_TIME);
	void crefiaInsert(OrderInfo info);
	


}