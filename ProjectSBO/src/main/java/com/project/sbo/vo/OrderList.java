package com.project.sbo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderList {
	// 목록 총개수
	private int listCount;
	private String orderNum;
	private long userId;
	private Date orderDate;
	private String payMethod;
	private String deleveryStatus;
	private int deleveryAddress1;
	private String deleveryAddress2;
	private String deleveryAddress3;
	private long storeId;
	private int totalPrice;
	private int usedPoint;
	private String request;
	private String foodInfo;
	private String storeName;
	private String storeImg;
	private String storeThumb;
	private int deleveryTip;	
	private String reviewContent;
	private float score;
	private String reviewImg;
	private String phone;
	
	// 주문 받기 에서 count1, count2 값 처리
	private int count1;
	private int count2;
	private int rn;
	
	
}
