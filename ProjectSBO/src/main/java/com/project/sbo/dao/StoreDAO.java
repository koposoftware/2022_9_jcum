package com.project.sbo.dao;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.Food;
import com.project.sbo.vo.FoodOption;
import com.project.sbo.vo.Review;
import com.project.sbo.vo.Store;

public interface StoreDAO {
	
	// 주문 목록
	List<Store> storeList(Map<String, Object> map);
	
	Store storeDetail(long storeId);
	
	List<Food> foodList(long storeId);
	// 음식 선택 시 해당음식 옵션가져오기
	List<FoodOption> foodOption(int foodId);
	// 리뷰작성
	void reviewWrite(Review review);
	// 매장에서 보는 리뷰
	List<Review> reviewList(long id);
	// 리뷰수정
	void reviewModify(Review review);
	// 찜 관련
	void addLikes(Map<String, Long> map);
	// 찜 관련
	void deleteLikes(Map<String, Long> map);
	// 찜하기
	Store storeDetail(long storeId, long userId);
	// 찜한 가게 목록
	List<Store> likesList(long userId);
	// 비회원 [찜]
	List<Store> likesListNonUser(String likes);
	// 매장 검색(페이징도)
	List<Store> storeSearch(Map<String, Object> map);
}