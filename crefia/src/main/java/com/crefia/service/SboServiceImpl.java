package com.crefia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crefia.dao.SboServiceDAO;

@Service
public class SboServiceImpl implements SboService {

	@Autowired
	private SboServiceDAO sboDAO;
	
	@Override
	public List<String> salesToday(String today, String pastday) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("today", today);
	    map.put("pastday", pastday);
		return sboDAO.salesToday(map);
	}
	@Override
	public List<String> salesAmPmCnt(String yesterDay, String pastyesterDay) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("yesterDay", yesterDay);
	    map.put("pastyesterDay", pastyesterDay);
		return sboDAO.salesAmPmCnt(map);
	}
	@Override
	public List<String> salesWeekSum(String todayWeek, String today) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("todayWeek", todayWeek);
	    map.put("today", today);
		return sboDAO.salesWeekSum(map);
	}
	@Override
	public List<String> salesRangePurchaseCnt(String startDt, String endDt) {
		Map<String, Object> map = new HashMap<>();
	    map.put("startDt", startDt);
	    map.put("endDt", endDt);
		return sboDAO.salesRangePurchaseCnt(map);
	}
	@Override
	public List<String> salesRangeCnt(String startDt, String endDt) {
		Map<String, Object> map = new HashMap<>();
	    map.put("startDt", startDt);
	    map.put("endDt", endDt);
		return sboDAO.salesRangeCnt(map);
	}
	@Override
	public List<String> onSitePayment(String startDt, String endDt) {
		Map<String, Object> map = new HashMap<>();
	    map.put("startDt", startDt);
	    map.put("endDt", endDt);
		return sboDAO.onSitePayment(map);
	}
	@Override
	public List<String> daysAvgPay(String startDt, String endDt) {
		Map<String, Object> map = new HashMap<>();
	    map.put("startDt", startDt);
	    map.put("endDt", endDt);
		return sboDAO.daysAvgPay(map);
	}
	
}
