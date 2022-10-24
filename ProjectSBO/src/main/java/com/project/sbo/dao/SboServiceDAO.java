package com.project.sbo.dao;

import java.util.List;
import java.util.Map;

import com.project.sbo.vo.OcrData;
import com.project.sbo.vo.SalesDetail;

public interface SboServiceDAO {
	
	// 매입등록
	void purchaseWrite(OcrData odata);
	// 매입조회
	List<OcrData> selectAll();
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
	// 주간 가장많이 팔린 메뉴
	List<SalesDetail> weekMenu(String statrDt, String endDt);
	// 연매출 가져오기
	List<String> bizAmountYearCheak(Map<String, Object> map);
	// 연매출, 사업장 운영 기간으로 대출상품 가져오기
	List<String> loanItemSearch(Map<String, Object> map);
}
