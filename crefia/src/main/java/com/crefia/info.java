package com.crefia;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crefia.service.SboService;

@RestController
public class info {
	
	@Autowired
	private SboService sbo;
	
	@PostMapping("/crefia/info")
	public Map<String, Object> hello(String startDt, String endDt, String type) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		if(type.equals("marketCustom")) {
			rmap.put("onSitePayment",sbo.onSitePayment(startDt, endDt));
		}else if(type.equals("daysAvgPay")) {
			rmap.put("daysAvgPay",sbo.daysAvgPay(startDt, endDt));
		}else if(type.equals("weekMenu")) {
		}
		else {
			rmap.put("salesPurRange",sbo.salesRangePurchaseCnt(startDt, endDt));
			rmap.put("salesRange",sbo.salesRangeCnt(startDt, endDt));
		}
		return rmap;
	}

}
