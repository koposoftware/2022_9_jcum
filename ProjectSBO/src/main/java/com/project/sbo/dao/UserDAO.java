package com.project.sbo.dao;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.Join;
import com.project.sbo.vo.Point;
import com.project.sbo.vo.Review;

public interface UserDAO {
	void join(Join join);
	int overlapCheck(String value, String valueType);
	// 내포인트
	List<Point> myPoint(long id);
	// 상품권
	Map<String, Object> getGiftCart(String giftCardNum, long userId);
	// 상품권
	void pointRegist(long userId, String info, String giftCardNum, int point);
	// 내 댓글 처리
	List<Review> myReviewList(long id);
	// 내 댓글 처리
	void deleteReview(Map<String, Object> map);
	// 내 정보 처리
	void modifyInfo(Map<String, Object> map);
	// 메일 보내기
	List<String> findId(String email);
	String emailCheck(Map<String, Object> map);
	String phoneCheck(Map<String, Object> map);
}