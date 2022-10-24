package com.project.sbo.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.project.sbo.login.LoginService;
import com.project.sbo.vo.Join;
import com.project.sbo.vo.Point;
import com.project.sbo.vo.Review;

public interface UserService {
	void join(Join join);
	int overlapCheck(String value, String valueType);
	// 내 포인트
	List<Point> myPoint(long id);
	// 상품권 등록
	ResponseEntity<Map<String, Object>> pointRegist(String giftCardNum, LoginService user);
	// 내 댓글 처리
	List<Review> myReviewList(long id);
	// 내 댓글 처리
	void deleteReview(long id, String orderNum);
	// 내 정보 처리
	void modifyInfo(String username, String valueType, String value);
	// smtp 
	List<String> findId(String email);
	boolean emailCheck(String username, String email);
	boolean phoneCheck(String username, String phone);
}