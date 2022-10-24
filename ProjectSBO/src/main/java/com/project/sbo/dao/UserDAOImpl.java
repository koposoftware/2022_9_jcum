package com.project.sbo.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sbo.vo.Join;
import com.project.sbo.vo.Point;
import com.project.sbo.vo.Review;

@Repository
public class UserDAOImpl implements UserDAO {
 
	@Autowired
	private SqlSession sql;
	
	// 회원가입 처리
	@Override
	public void join(Join join) {
		sql.insert("user.join" , join);	
	}
	
	// ajax 체크 부분
	@Override
	public int overlapCheck(String value, String valueType) {
		Map<String, String> map = new HashMap<>();
		map.put("value", value);
		map.put("valueType", valueType);
		
		return sql.selectOne("user.overlapCheck" ,map);
	}
	
	// 내 포인트
	@Override
	public List<Point> myPoint(long id) {
		return sql.selectList("user.myPoint", id);
	}
	
	// 상품권
	@Override
	public Map<String, Object> getGiftCart(String giftCardNum, long userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("giftCardNum", giftCardNum);
		return sql.selectOne("user.getGiftCart", map);
	}
	
	// 상품권
	@Override
	public void pointRegist(long userId, String info, String giftCardNum, int point) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("info", info);
		map.put("giftCardNum", giftCardNum);
		map.put("point", point);
		sql.insert("user.pointRegist", map);
	}
	
	// 내 댓글 처리
	@Override
	public List<Review> myReviewList(long id) {
		return sql.selectList("user.myReviewList", id);
	}
	// 내 댓글 처리
	@Override
	public void deleteReview(Map<String, Object> map) {
		sql.delete("user.deleteReview", map);
		
	}
	// 내 정보 수정 처리
	@Override
	public void modifyInfo(Map<String, Object> map) {
	    sql.update("user.modifyInfo", map);
	}
	
	// smtp 메일 보내기
	@Override
	public List<String> findId(String email) {
	    return sql.selectList("user.findId", email);
	}

	
	@Override
	public String emailCheck(Map<String, Object> map) {
	    return sql.selectOne("user.emailCheck", map);
	}
	 
	@Override
	public String phoneCheck(Map<String, Object> map) {
	    return sql.selectOne("user.phoneCheck", map);
	}





 
}
