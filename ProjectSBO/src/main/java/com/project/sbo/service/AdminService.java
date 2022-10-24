package com.project.sbo.service;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.Food;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.Store;

// 관리자 페이지
public interface AdminService {
	
	// 운영중인 가게
	List<Store> myStore(long userId);
	// AOP 설정
	List<Long> getMyStoreId(long userId);
	// 가게정보 수정
	void storeInfoUpdate(Store store);
	// 메뉴추가
	void addMenu(Food food, String[] foodOption, Integer[] foodOptionPrice);
	// 메뉴수정
	void updateMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, Integer[] optionId);
	// 메뉴삭제
	void deleteMenu(long storeId, long[] deleteNumber);
	// 댓글 답장
	String bossComment(long storeId, String orderNum, String bossComment);
	// 주문목록
	List<OrderList> order(long storeId, String list, int page);
	// 주문접수 처리
	void orderAccept(String orderNum, int time,long userId);
	// 주문완료
	void orderComplete(String orderNum, long userId);
	// 오늘 매출
	Map<String, Object> salesDetail(long storeId, String date, String sort);
	// 주간 매출 그래프
	Map<String, Object> weekMenu(String StartDt, String endDt);
	// 매출 그래프
	List<Sales> sales(long storeId, String date, String term);
	
	
}