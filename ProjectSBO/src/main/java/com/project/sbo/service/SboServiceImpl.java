package com.project.sbo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sbo.dao.SboServiceDAO;
import com.project.sbo.util.FoodInfoFromJson;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.OcrData;
import com.project.sbo.vo.SalesDetail;

@Service
public class SboServiceImpl implements SboService {

	@Autowired
	private SboServiceDAO sboDAO;
	
	@Override
	public void purchaseWrite(OcrData odata) {
		sboDAO.purchaseWrite(odata);
	}
	@Override
	public List<OcrData> selectAll() {
		return sboDAO.selectAll();
	}
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
	@Override
	public Map<String, Object> weekMenu(String startDt, String endDt) {
		
		System.out.println(startDt + " : "+ endDt);
		List<SalesDetail> salesToday = sboDAO.weekMenu(startDt, endDt);
		
		System.out.println(salesToday);
		long total = 0;
		
		List<Cart> menuList = new ArrayList<>();
		
		
		for(int i=0;i<salesToday.size();i++) {
			List<Cart> cartList = FoodInfoFromJson.foodInfoFromJson(salesToday.get(i).getFoodInfo());
			
			for(int j=0;j<cartList.size();j++) {
				Cart cart = cartList.get(j);
				if(menuList.contains(cart)) {
					
					int index = menuList.indexOf(cart);
					int amount = cart.getAmount();
					int price = cart.getTotalPrice();
					
					menuList.get(index).setAmount(amount + menuList.get(index).getAmount());
					menuList.get(index).setTotalPrice(price + menuList.get(index).getTotalPrice());
					
				} else {
					menuList.add(cartList.get(j));
				}
			}
			
			total += salesToday.get(i).getTotalPrice();
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("menuList", menuList);
		map.put("total", total);
		return map;
	}
	@Override
	public List<String> bizAmountYearCheak() {
		Map<String, Object> map = new HashMap<>();
	    map.put("startDt", "!");
	    map.put("endDt", "1");
		return sboDAO.bizAmountYearCheak(map);
	}
	@Override
	public List<String> loanItemSearch(String bizDate, String bizAmount, String sort) {
		Map<String, Object> map = new HashMap<>();
	    map.put("bizDate", bizDate);
	    map.put("bizAmount", bizAmount);
	    map.put("sort", sort);
		return sboDAO.loanItemSearch(map);
	}
	
	
}
