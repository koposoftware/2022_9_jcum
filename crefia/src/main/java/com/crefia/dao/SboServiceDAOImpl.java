package com.crefia.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SboServiceDAOImpl implements SboServiceDAO {
	
	@Autowired
	private SqlSession sql;

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
}
