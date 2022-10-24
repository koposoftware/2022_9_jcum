package com.crefia.service;

import java.util.List;

public interface SboService {

	// 매출 정보 가져오기
	List<String> salesToday(String today, String pastday);
	// 오전/오후 건수 가져오기
	List<String> salesAmPmCnt(String yesterDay, String pastyesterDay);
	// 오늘 기준으로 1주일, 전주 계산
	List<String> salesWeekSum(String todayWeek, String today);
	// 매입, 매출 건수 (1주일, 1개월, 6개월 , 1년)
	List<String> salesRangePurchaseCnt(String startDt, String endDt);
	// 매출
	List<String> salesRangeCnt(String startDt, String endDt);
	// 요일별 가게 방문고객 수
	List<String> onSitePayment(String startDt, String endDt);
	// 요일별 평균결제금액
	List<String> daysAvgPay(String startDt, String endDt);
}
