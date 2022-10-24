package com.project.sbo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderInfo {

	private String orderNum;
	private long storeId;
	private long userId;
	private Date orderDate;
	private String deleveryStatus;
	private int deleveryAddress1;
	private String deleveryAddress2;
	private String deleveryAddress3;
	private String payMethod;
	private int totalPrice;
	private int usedPoint;
	private String phone;
	private String request;
	
	private String impUid = ""; // 아임포트 결제번호 추가
	
	// 여신협회에서 사용할 변수
	private int APPROVAL_NO;
	private String CARD_NAME;
	private String CARD_NUMBER;
	private int APPROVAL_AMOUNT;
	private String paid_at;
	private String DEAL_DATE;
	private String DEAL_TIME;
	private String BUSINESS_NO;
	
}
