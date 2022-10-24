package com.crefia.dao;

import java.util.List;
import java.util.Map;

public interface SboServiceDAO {
	
	// 매출 정보 가져오기
	List<String> salesToday(Map<String, Object> map); 
	// 오전/오후 건수 가져오기
	List<String> salesAmPmCnt(Map<String, Object> map);
	// 오늘 기준으로 1주일, 전주 계산
	List<String> salesWeekSum(Map<String, Object> map);
	// 매입 건수
	List<String> salesRangePurchaseCnt(Map<String, Object> map);
	// 매출 건수
	List<String> salesRangeCnt(Map<String, Object> map);
	// 요일별 매장방문 고객수
	List<String> onSitePayment(Map<String, Object> map);
	// 요일별 평균결제 금액
	List<String> daysAvgPay(Map<String, Object> map);
}
