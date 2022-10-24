package com.project.sbo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Store {
	private int listCount;	// 매장 수
	private long id;
	// 100번 피자, 101번 치킨
	private int category;
	// 가게 이름
	private String storeName;
	private int storeAddress1;
	private String storeAddress2;
	private String storeAddress3;
	private String storePhone;
	private String storeImg;
	private String storeThumb;
	private int openingTime;
	private int closingTime;
	private int minDelevery;
	private int deleveryTime;
	private int deleveryTip;
	// 가게 소개
	private String storeDes;
	// 소상 공인 가게 등록 시 사용 할 변수들
	private String reviewImg;
	
	
	
	private float score;
	private int orderCount;
	private int reviewCount;
	private int bossCommentCount;
	private int likesCount;
	
	private int score1; // 리뷰 1점
	private int score2; // 리뷰 2점
	private int score3; // 리뷰 3점
	private int score4; // 리뷰 4점
	private int score5; // 리뷰 5점	
	
	//오픈중?
	private String isOpen;
	
	//
	private int bsTime;
	
	private int isLikes;	// 0 찜x, 1 찜o
}