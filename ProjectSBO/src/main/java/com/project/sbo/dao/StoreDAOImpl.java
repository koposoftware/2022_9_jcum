package com.project.sbo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sbo.vo.Food;
import com.project.sbo.vo.FoodOption;
import com.project.sbo.vo.Review;
import com.project.sbo.vo.Store;

@Repository
public class StoreDAOImpl implements StoreDAO {
 
	@Autowired
	private SqlSession sql;
	
	// 주문목록
	@Override
	public List<Store> storeList(Map<String, Object> map) {
		return sql.selectList("store.storeList", map);
	}
	@Override
	public Store storeDetail(long storeId) {
		return sql.selectOne("store.storeDetail", storeId);
	}
	
	@Override
	public List<Food> foodList(long id) {
		return sql.selectList("store.foodList", id);
	}
	
	// 음시선택 시 해당 옵션가져오기
	@Override
	public List<FoodOption> foodOption(int foodId) {
		return sql.selectList("store.foodOption", foodId);
	}
	// 리뷰작성
	@Override
	public void reviewWrite(Review review) {
		sql.insert("store.reviewWrite", review);
	}
	// 매장에서 보는 리뷰 리스트
	@Override
	public List<Review> reviewList(long id) {
		return sql.selectList("store.reviewList", id);
	}
	// 리뷰수정
	@Override
	public void reviewModify(Review review) {
		sql.update("store.reviewModify", review);
	}
	
	// 찜하기
	@Override
	public void addLikes(Map<String, Long> map) {
	    sql.insert("store.addLikes", map);
	}
	// 찜하기
	@Override
	public void deleteLikes(Map<String, Long> map) {
	    sql.insert("store.deleteLikes", map);
	}
	
	// 찜하기
	@Override
	public Store storeDetail(long storeId, long userId) {
	    Map<String, Long> map = new HashMap<>();
	    map.put("storeId", storeId);
	    map.put("userId", userId);
	    return sql.selectOne("store.storeDetail", map);
	}
	// 찜한 가게목록
	@Override
	public List<Store> likesList(long userId) {
		return sql.selectList("store.likesList", userId);
	}
	
	// 비회원 [찜]
	@Override
	public List<Store> likesListNonUser(String likes) {
	    return sql.selectList("store.likesListNonUser", likes);
	}
	// 매장 검색 및 페이징도
	@Override
	public List<Store> storeSearch(Map<String, Object> map) {
		return sql.selectList("store.storeSearch", map);
	}
	
}