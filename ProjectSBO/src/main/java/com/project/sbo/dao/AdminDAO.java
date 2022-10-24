package com.project.sbo.dao;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.Food;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.SalesDetail;
import com.project.sbo.vo.Store;

public interface AdminDAO {
	
	// 포인트 업데이트 관련 메서드
	int pointUpdate(long userId, String info, int point);
	
	// 운영중인 가게
	List<Store> myStore(long userId);
	
	// AOP 설정
	List<Long> getMyStoreId(long userId);
	// 가게정보 수정
	void storeInfoUpdate(Store store);
	// 메뉴추가
	long addMenu(Food food);
	void addMenuOption(List<Map<String, Object>> optionList);
	
	// 메뉴수정
	void updateMenu(Map<String, Object> map);
	// 메뉴삭제
	void deleteMenuOption(long foodId);
	// 
	void deleteMenu(long storeId, long[] deleteNumber);
	
	// 댓글 답장 - 관리자
	void bossComment(long storeId, String orderNum, String bossComment);
	// 주문 목록
	List<OrderList> order(Map<String, Object> map);
	// 주문 접수 처리
	void orderAccept(String orderNum, int time, long userId);
	// 주문 완료
	void orderComplete(Map<String, Object> map);
	// 오늘 매출
	List<SalesDetail> salesDetail(long storeId, String date);
	// 주간 매출 건수
	List<SalesDetail> weekMenu(String startDt, String endDt);
	// 매출 그래프
	List<Sales> sales(Map<String, Object> map);
}