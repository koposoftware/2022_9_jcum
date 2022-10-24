package com.project.sbo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sbo.vo.Cart;
import com.project.sbo.vo.OrderDetail;
import com.project.sbo.vo.OrderInfo;
import com.project.sbo.vo.OrderList;

@Repository
public class OrderDAOImpl implements OrderDAO {
 
	@Autowired
	private SqlSession sql;
 
	// 주문페이지 관련
	@Override
	public int getDeleveryTip(long storeId) {
		return sql.selectOne("order.getDeleveryTip", storeId);
	}
 
	@Override
	public List<Integer> foodPriceList(List<Cart> cartList) {
		return sql.selectList("order.foodPriceList", cartList);
	}
 
	@Override
	public List<Integer> optionPriceList(List<Cart> cart) {
		return sql.selectList("order.optionPriceList", cart);
	}
	// 주문관련 끝
	
	// 주문한거 인설트, 주문처리
	@Override
	public void order(OrderInfo info) {
		//System.out.println("info 값은? : "+ info.getOrderNum());
		sql.insert("order.order", info);
	}
 
	// 주문처리
	@Override
	//public void orderDetail(OrderDetail[] detail, String userId) {
	public void orderDetail(OrderDetail[] detail, long userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("detail", detail);
		
		for(int i = 0; i < detail.length; i++) {
			//System.out.println("찍어보자"+detail[i].getOrderNum() + ":" + detail[i].getFoodInfoJSON());			
		}
		sql.insert("order.orderDetail", map);
	}
	
	// 주문완료 후 리스트 보여주는 곳
	@Override
	public List<OrderList> orderList(Map<String, Object> map){
	//public List<OrderList> orderList(long userId, Page P) {
		return sql.selectList("order.orderList", map);
	}
	
	// 주문목록 상세보기
	@Override
	public OrderList orderListDetail(String orderNum) {
		return sql.selectOne("order.orderListDetail", orderNum);
	}

	// 여신협회 데이터 처리
	@Override
	public void crefiaInsert(OrderInfo info) {
		sql.insert("order.crefia", info);
	}
	
 
	
}