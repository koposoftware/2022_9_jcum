package com.project.sbo.service;

import java.util.List;

import com.project.sbo.vo.FoodOption;
import com.project.sbo.vo.Page;
import com.project.sbo.vo.Review;
import com.project.sbo.vo.Store;
import com.project.sbo.vo.StoreDetail;

public interface StoreService {
	// 매장목록 가져오기
	List<Store> storeList(int category, int address);
	StoreDetail storeDetail(long id);
	
	// 해당 메뉴의 옵션 가져오기(음식에 있는 옵션)
	List<FoodOption> foodOption(int foodId);
	// 리뷰작성
	void reviewWrite(Review review);
	// 리뷰 수정
	void reviewModify(Review review);
	// 페이징
	List<Store> storeList(int category, int address, String sort, int page);
	// 찜
	void likes(long storeId, String likes, long userId);
	// 찜 관련
	StoreDetail storeDetail(long id, long userId);
	// 찜한 가게들
	List<Store> likesList(long userId);
	// 비회원 처리[찜]
	List<Store> likesListNonUser(String likes);
	// 매장 검색 및 페이징 처리 
	List<Store> storeSearch(String keyword, int address, Page p);


}
