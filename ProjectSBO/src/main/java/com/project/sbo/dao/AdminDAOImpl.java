package com.project.sbo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sbo.vo.Food;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.SalesDetail;
import com.project.sbo.vo.Store;

@Repository
public class AdminDAOImpl implements AdminDAO {
 
	@Autowired
	private SqlSession sql;
	
	// 포인트 업데이트 메서드
	@Override
	public int pointUpdate(long userId, String info, int point) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("info", info);
		map.put("point", point);
		
		return sql.insert("admin.pointUpdate", map); 
	}
	
	// 운영중인 가게
	@Override
	public List<Store> myStore(long userId) {
		//System.out.println("userId 값 : "+userId);
		return sql.selectList("admin.myStore", userId);
	}
	
	// AOP 설정 관련
	@Override
	public List<Long> getMyStoreId(long userId) {
		return sql.selectList("admin.getMyStoreId", userId);
	}
	
	// 가게 정보 수정
	@Override
	public void storeInfoUpdate(Store store) {
		//System.out.println("가게 정보 수정 값은??"+store);
		sql.update("admin.storeInfoUpdate", store);
	}
	
	// 메뉴 추가 부분
	@Override
	public long addMenu(Food food) {
		sql.insert("admin.addMenu", food);
		return food.getId();
	}
	// 리턴받은 id 값을 통해 addMenuOption 실행
	@Override
	public void addMenuOption(List<Map<String, Object>> optionList) {
		sql.insert("admin.addMenuOption", optionList);
	}
	
	// 메뉴수정
	@Override
	public void updateMenu(Map<String, Object> map) {
		sql.update("admin.updateMenu", map);
	}

	// 메뉴삭제
	@Override
	public void deleteMenuOption(long foodId) {
		sql.delete("admin.deleteMenuOption", foodId);
	}

	
	@Override
	public void deleteMenu(long storeId, long[] deleteNumber) {
		sql.delete("admin.deleteMenu");
	}
	
	// 댓글 답장(관리자)
	@Override
	public void bossComment(long storeId, String orderNum, String bossComment) {
		Map<String, Object> map = new HashMap<>();
		map.put("storeId", storeId);
		map.put("bossComment", bossComment);
		map.put("orderNum", orderNum);
		sql.update("admin.bossComment", map);
	}


	// 주문목록 관련
	@Override
	public List<OrderList> order(Map<String, Object> map) {
		return sql.selectList("admin.orderList", map);
	}


	// 주문접수 처리
	@Override
	public void orderAccept(String orderNum, int time, long userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("orderNum", orderNum);
		map.put("time", time);
		map.put("userId", userId);
		sql.update("admin.orderAccept", map);
	}
	
	// 주문완료
	@Override
	public void orderComplete(Map<String, Object> map) {
		sql.update("admin.orderComplete", map);
	}
	
	// 오늘매출
	@Override
	public List<SalesDetail> salesDetail(long storeId, String date) {
		Map<String, Object> map = new HashMap<>();
		map.put("storeId", storeId);
		map.put("date", date);
		//System.out.println(storeId);
		//System.out.println(date);
		
		return sql.selectList("admin.salesDetail", map);
	}
	
	@Override
	public List<SalesDetail> weekMenu(String startDt, String endDt) {
	
		Map<String, Object> map = new HashMap<>();
		map.put("startDt", startDt);
		map.put("endDt", endDt);
		
		return sql.selectList("admin.weekMenu", map);
	}

	// 매출 그래프
	@Override
	public List<Sales> sales(Map<String, Object> map) {
		
		return sql.selectList("admin.sales", map);
	}






}