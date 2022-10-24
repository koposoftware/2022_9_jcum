package com.project.sbo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sbo.dao.StoreDAO;
import com.project.sbo.vo.Food;
import com.project.sbo.vo.FoodOption;
import com.project.sbo.vo.Page;
import com.project.sbo.vo.Review;
import com.project.sbo.vo.Store;
import com.project.sbo.vo.StoreDetail;

@Service
public class StoreServiceImpl implements StoreService {
 
	@Autowired
	private StoreDAO storeDAO;
	
	// 주문목록
	@Override
	public List<Store> storeList(int category, int address) {
	    return storeList(category, address, "주문접수 대기 중", 1);
	}
	 
	
	@Override
	public List<Store> storeList(int category, int address1, String sort, int page) {
	    Page p = new Page(page, 8);
	    Map<String, Object> map = new HashMap<>();
	    map.put("category", category);
	    map.put("address1", address1);
	    map.put("firstList", p.getFirstList());
	    map.put("lastList", p.getLastList());
	    map.put("sort", sort);
	    return storeDAO.storeList(map);
	}
	
	// 가게정보, 음식리스트, 댓글리스트 처리
	@Override
	public StoreDetail storeDetail(long storeId) {
		Store storeInfo = storeDAO.storeDetail(storeId); 
		// 음식 목록 가져오기
		List<Food> foodList = storeDAO.foodList(storeId);
		// 매장에서 보는 댓글 리스트
		List<Review> reviewList = storeDAO.reviewList(storeId);
		
		return new StoreDetail(storeInfo, foodList, reviewList);
	}
	
	// 음식선택 시 옵션 가져오기
	@Override
	public List<FoodOption> foodOption(int foodId) {
		return storeDAO.foodOption(foodId);
	}
	// 리뷰작성
	@Override
	public void reviewWrite(Review review) {
		storeDAO.reviewWrite(review);
	}
	// 리뷰수정
	@Override
	public void reviewModify(Review review) {
	    storeDAO.reviewModify(review);
	}
	
	// 찜 하기 처리
	@Override
	public void likes(long storeId, String likes, long userId) {
	    Map<String, Long> map = new HashMap<>();
	    map.put("storeId", storeId);
	    map.put("userId", userId);
	    
	    if(likes.equals("on")) {
	        storeDAO.addLikes(map);
	    } else {
	        storeDAO.deleteLikes(map);
	    }
	}
	
	// 찜하기 관련
	@Override
	public StoreDetail storeDetail(long storeId, long userId) {
	    Store storeInfo = storeDAO.storeDetail(storeId, userId); 
	    List<Food> foodList = storeDAO.foodList(storeId);
	    List<Review> reviewList = storeDAO.reviewList(storeId);
	     
	    return new StoreDetail(storeInfo, foodList, reviewList);
	}
	
	// 찜한 가게 목록
	@Override
	public List<Store> likesList(long userId) {
		return storeDAO.likesList(userId);
	}
	
	// 비회원 처리 [찜]
	@Override
	public List<Store> likesListNonUser(String likes) {
		return storeDAO.likesListNonUser(likes);
	}
	
	// 매장 검색 및 페이징 처리
	@Override
	public List<Store> storeSearch(String keyword, int address, Page p) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("keyword", keyword);
	    map.put("address", address);
	    map.put("firstList", p.getFirstList());
	    map.put("lastList", p.getLastList());
	    
	    return storeDAO.storeSearch(map);
	}
	
 
}