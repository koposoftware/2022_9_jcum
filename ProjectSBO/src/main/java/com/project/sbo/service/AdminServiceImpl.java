package com.project.sbo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.sbo.dao.AdminDAO;
import com.project.sbo.util.FoodInfoFromJson;
import com.project.sbo.util.SalesSort;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.Food;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Page;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.SalesDetail;
import com.project.sbo.vo.Store;

@Service
public class AdminServiceImpl implements AdminService {
 
	@Autowired
	private AdminDAO adminDAO;
	
	// 운영중인 가게
	@Override
	public List<Store> myStore(long userId) {
		return adminDAO.myStore(userId);
	}
	
	// AOP 설정 관련
	@Override
	public List<Long> getMyStoreId(long userId) {
		return adminDAO.getMyStoreId(userId);
	}
	
	// 가게 정보 수정
	@Override
	public void storeInfoUpdate(Store store) {
		adminDAO.storeInfoUpdate(store);
	}
	// 메뉴추가
	@Transactional
	@Override
	public void addMenu(Food food, String[] foodOption, Integer[] foodOptionPrice) {
		long foodId = adminDAO.addMenu(food);
		
		if(foodOption != null) {
			List<Map<String, Object>> optionList = new ArrayList<>();
			
			for(int i=0;i<foodOption.length;i++) {
				Map<String, Object> optionMap = new HashMap<>();
				optionMap.put("optionName", foodOption[i]);
				optionMap.put("optionPrice", foodOptionPrice[i]);
				optionMap.put("foodId", foodId);
				optionList.add(optionMap);
			}
			
			adminDAO.addMenuOption(optionList);
		}
	}
	
	// 메뉴수정 메서드
	@Transactional
	@Override
	public void updateMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, Integer[] optionId) {
		Map<String, Object> map = new HashMap<>();
		if(foodOption == null) {
			adminDAO.deleteMenuOption(food.getId());
		} else {
			List<Map<String, Object>> optionList = new ArrayList<>();
			
			for(int i=0;i<foodOption.length;i++) {
				Map<String, Object> optionMap = new HashMap<>();
				long oid = -1;
				if(optionId.length != 0 && optionId[i] != null) {
					oid = optionId[i];
				}
				
				optionMap.put("optionId", oid);
				optionMap.put("optionName", foodOption[i]);
				optionMap.put("optionPrice", foodOptionPrice[i]);
				
				optionList.add(optionMap);
			}
			
			map.put("optionList", optionList);
		}
		map.put("food", food);
		adminDAO.updateMenu(map);
	}

	// 메뉴삭제
	@Override
	public void deleteMenu(long storeId, long[] deleteNumber) {
		adminDAO.deleteMenu(storeId, deleteNumber);
	}

	
	// 댓글 답장
	@Override
	public String bossComment(long storeId, String orderNum, String bossComment) {
		bossComment = bossComment.replace("\n","<br>").replaceAll(" ", "&nbsp");
		adminDAO.bossComment(storeId, orderNum, bossComment);
		return bossComment; 
	}

	
	// 주문목록 출력
	@Override
	public List<OrderList> order(long storeId, String list, int page) {
		Page p = new Page(page);
		
		Map<String, Object> map = new HashMap<>();
//		System.out.println("1 : "+storeId);
//		System.out.println("2 : "+list);
//		System.out.println("3 : "+p.getFirstList());
//		System.out.println("4 : "+p.getLastList());
		
		map.put("storeId", storeId);
		map.put("list", list);
		map.put("firstList", p.getFirstList());
		map.put("lastList", p.getLastList());
		
		return adminDAO.order(map);
	}

	
	// 주문접수 처리
	@Override
	public void orderAccept(String orderNum, int time,long userId) {
		adminDAO.orderAccept(orderNum, time,userId);
	}
	
	// 주문 완료
	@Override
	public void orderComplete(String orderNum, long userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("orderNum", orderNum);
		map.put("userId", userId);
		adminDAO.orderComplete(map);
	}
	
	
	// 오늘 매출
	@Override
	public Map<String, Object> salesDetail(long storeId, String date, String sort) {
		//System.out.println("1 : "+storeId);
		//System.out.println("2 : "+date);
		//System.err.println("3 : "+sort);
		List<SalesDetail> salesToday = adminDAO.salesDetail(storeId, date);
		
		long total = 0;
		
		List<Cart> menuList = new ArrayList<>();
		
		
		for(int i=0;i<salesToday.size();i++) {
			List<Cart> cartList = FoodInfoFromJson.foodInfoFromJson(salesToday.get(i).getFoodInfo());
			
			for(int j=0;j<cartList.size();j++) {
				Cart cart = cartList.get(j);
				if(menuList.contains(cart)) {
					
					int index = menuList.indexOf(cart);
					int amount = cart.getAmount();
					int price = cart.getTotalPrice();
					
					menuList.get(index).setAmount(amount + menuList.get(index).getAmount());
					menuList.get(index).setTotalPrice(price + menuList.get(index).getTotalPrice());
					
				} else {
					menuList.add(cartList.get(j));
				}
			}
			
			total += salesToday.get(i).getTotalPrice();
		}
		
		// 정렬하기
		new SalesSort(menuList, sort);
		
		Map<String, Object> map = new HashMap<>();
		
 
		
		map.put("menuList", menuList);
		map.put("total", total);
		
		return map;
	}
	
	// 주간 가장많이 팔린 메뉴
	@Override
	public Map<String, Object> weekMenu(String StartDt, String endDt) {
		List<SalesDetail> salesToday = adminDAO.weekMenu(StartDt, endDt);

		long total = 0;
		
		List<Cart> menuList = new ArrayList<>();

		for (int i = 0; i < salesToday.size(); i++) {
			List<Cart> cartList = FoodInfoFromJson.foodInfoFromJson(salesToday.get(i).getFoodInfo());

			for (int j = 0; j < cartList.size(); j++) {
				Cart cart = cartList.get(j);
				if (menuList.contains(cart)) {

					int index = menuList.indexOf(cart);
					int amount = cart.getAmount();
					int price = cart.getTotalPrice();

					menuList.get(index).setAmount(amount + menuList.get(index).getAmount());
					menuList.get(index).setTotalPrice(price + menuList.get(index).getTotalPrice());

				} else {
					menuList.add(cartList.get(j));
				}
			}

			total += salesToday.get(i).getTotalPrice();
		}

		Map<String, Object> map = new HashMap<>();
		map.put("menuList", menuList);
		map.put("total", total);

		return map;
	}

	// 매출 그래프
	@Override
	public List<Sales> sales(long storeId, String date, String term) {
		// 날짜 형식 맞추기
		date = date + "-01";
		
		Map<String, Object> map = new HashMap<>();
		map.put("storeId", storeId);
		map.put("date", date);
		map.put("term", term);
	
		//System.out.println("!"+storeId);
		//System.out.println("!!"+date);
		//System.out.println("!!!"+term);
		
		return adminDAO.sales(map);
	}
}
