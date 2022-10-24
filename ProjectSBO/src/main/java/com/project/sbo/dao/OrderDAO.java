package com.project.sbo.dao;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.Cart;
import com.project.sbo.vo.OrderDetail;
import com.project.sbo.vo.OrderInfo;
import com.project.sbo.vo.OrderList;

public interface OrderDAO {
	 
	// 메뉴 총합가격 계산시 배달팁 가져오기
	int getDeleveryTip(long storeId);
	
	//	메뉴 총합가격 계산시 음식가격
	List<Integer> foodPriceList(List<Cart> cartList);
	
	//	메뉴 총합가격 계산시 음식 추가 옵션가격
	List<Integer> optionPriceList(List<Cart> cart);
	
	// 주문 정보 입력, 주문완료 처리
	void order(OrderInfo info);
	
	// 주문 상세정보 입력, 주문완료 처리
	void orderDetail(OrderDetail[] detail, long userId);
	//void orderDetail(OrderDetail[] detail, String userId);
	
	// 주문 목록
	List<OrderList> orderList(Map<String, Object> map);
	//List<OrderList> orderList(long userId, Page P);
	
	// 주문목록 상세보기 페이지
	OrderList orderListDetail(String orderNum);
	
	// 여신협회 데이터 처리
	void crefiaInsert(OrderInfo info);


}