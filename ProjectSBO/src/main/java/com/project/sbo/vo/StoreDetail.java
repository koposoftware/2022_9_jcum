package com.project.sbo.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class StoreDetail {
	// 매장정보
	private Store storeInfo;
	private List<Food> foodList;
	// 매장에서 확인하는 댓글
	private List<Review> reviewList;
}