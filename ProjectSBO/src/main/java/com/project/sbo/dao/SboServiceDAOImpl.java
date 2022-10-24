package com.project.sbo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sbo.vo.OcrData;
import com.project.sbo.vo.SalesDetail;

@Repository
public class SboServiceDAOImpl implements SboServiceDAO {
	
	@Autowired
	private SqlSession sql;

	// 매입등록
	@Override
	public void purchaseWrite(OcrData odata) {
		sql.insert("sbo.purchaseWrite", odata);
	}
	// 매입 내역 조회
	@Override
	public List<OcrData> selectAll() {
		return sql.selectList("sbo.selectPurchaseAll");
	}
	@Override
	public List<String> salesToday(Map<String, Object> map) {
		//System.out.println("1 : "+map.get("today"));
		//System.out.println("2 : "+map.get("pastday"));
		return sql.selectList("sbo.salesToday", map);
	}
	@Override
	public List<String> salesAmPmCnt(Map<String, Object> map) {
		return sql.selectList("sbo.salesAmPmCnt", map);
	}
	@Override
	public List<String> salesWeekSum(Map<String, Object> map) {
		return sql.selectList("sbo.salesWeekSum", map);
	}
	@Override
	public List<String> salesRangePurchaseCnt(Map<String, Object> map) {
		return sql.selectList("sbo.salesRangePurchaseCnt", map);
	}
	@Override
	public List<String> salesRangeCnt(Map<String, Object> map) {
		return sql.selectList("sbo.salesRangeCnt", map);
	}
	@Override
	public List<String> onSitePayment(Map<String, Object> map) {
		return sql.selectList("sbo.onSitePayment", map);
	}
	@Override
	public List<String> daysAvgPay(Map<String, Object> map) {
		return sql.selectList("sbo.daysAvgPay", map);
	}
	@Override
	public List<SalesDetail> weekMenu(String statrDt, String endDt) {
		Map<String, Object> map = new HashMap<>();
		map.put("statrDt", statrDt);
		map.put("endDt", endDt);
		return sql.selectList("sbo.weekMenu", map);
	}
	@Override
	public List<String> bizAmountYearCheak(Map<String, Object> map) {
		return sql.selectList("sbo.bizAmountYearCheak");
	}
	@Override
	public List<String> loanItemSearch(Map<String, Object> map) {
		return sql.selectList("sbo.loanItemSearch", map);
	}
	
	
}
