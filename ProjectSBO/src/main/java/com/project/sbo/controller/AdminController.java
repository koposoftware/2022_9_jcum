package com.project.sbo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.sbo.aop.IsMyStore;
import com.project.sbo.login.LoginService;
import com.project.sbo.service.AdminService;
import com.project.sbo.service.StoreService;
import com.project.sbo.util.FoodInfoFromJson;
import com.project.sbo.util.UploadFile;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.Food;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.Store;
import com.project.sbo.vo.StoreDetail;

@Controller
public class AdminController {
	@Autowired
	private UploadFile uploadFile;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StoreService storeService;
	
	// 운영중인가게
	@GetMapping("/admin/myStore") 
	public String myStore(@AuthenticationPrincipal LoginService user, Model model) {
		long userId = user.getUser().getId(); 
		List<Store> storeList = adminService.myStore(userId);
		//System.out.println("user값 : "+userId);
		//System.out.println(storeList);
		model.addAttribute("storeList", storeList);
		return "admin/myStore";
	}
	
	// 가게 상세보기
	@IsMyStore
	@GetMapping("/admin/management/detail/{id}") 
	public String detail(@PathVariable long id, @AuthenticationPrincipal LoginService user, Model model) {
		long userId = user.getUser().getId();
		StoreDetail storeDetail = storeService.storeDetail(id, userId);
		model.addAttribute("store", storeDetail);
		model.addAttribute("adminPage", true);
		
		return "admin/detail";
	}
	
	// 가게 정보 수정
	@IsMyStore
	//@RequestMapping(value="/admin/management/storeInfo",method = RequestMethod.POST)
	@PatchMapping("/admin/management/storeInfo")
	public ResponseEntity<Store> storeInfoUpdate(Store store, MultipartFile file) throws IOException {
		if(!file.isEmpty()){
			String img = uploadFile.fildUpload(file);
			store.setStoreImg(img);
			store.setStoreThumb(img);
		}
		adminService.storeInfoUpdate(store);
		return new ResponseEntity<Store>(store,HttpStatus.OK);
	}
	
	// 메뉴추가
	@IsMyStore
	@PostMapping("/admin/management/menu")
	public ResponseEntity<Food> addMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, MultipartFile file) throws IOException {
		if(file.isEmpty()) {
			String img = File.separator + "img" + File.separator + "none.gif";
			food.setFoodImg(img);
			food.setFoodThumb(img);
		} else {
			String img = uploadFile.fildUpload(file);
			food.setFoodImg(img);
			food.setFoodThumb(img);
		}
		
		adminService.addMenu(food, foodOption, foodOptionPrice);
		return new ResponseEntity<Food>(food,HttpStatus.OK);
	}
	
	// 메뉴 수정 메서드
	@IsMyStore
	@PatchMapping("/admin/management/menu")
	public ResponseEntity<Food> updateMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, Integer[] optionId, MultipartFile file) throws IOException {
		
		System.out.println(food);
		if(file.isEmpty()) {
			String img = File.separator + "img" + File.separator + "none.gif";
			food.setFoodImg(img);
			food.setFoodThumb(img);
		} else {
			String img = uploadFile.fildUpload(file);
			food.setFoodImg(img);
			food.setFoodThumb(img);
		}
		
		adminService.updateMenu(food, foodOption, foodOptionPrice, optionId);
		return new ResponseEntity<Food>(food, HttpStatus.OK);
	}

	
	// 메뉴 삭제
	@IsMyStore
	@DeleteMapping("/admin/management/menu")
	public ResponseEntity<Object> deleteMenu(long storeId, long[] deleteNumber) {
		adminService.deleteMenu(storeId, deleteNumber);
		return new ResponseEntity<>(HttpStatus.OK);
	}


	
	// 댓글 답장
	@IsMyStore
	@PatchMapping("/admin/management/bossComment")
	public ResponseEntity<String> bossComment(long storeId, String orderNum, String bossComment, HttpServletResponse response) throws IOException {
		String reviewContent = adminService.bossComment(storeId, orderNum, bossComment);
		return new ResponseEntity<String>(reviewContent, HttpStatus.OK);
	}

	
	// 주문 접수 페이지
	@IsMyStore
	@GetMapping("/admin/management/order/{id}")
	public String order(@PathVariable long id) {
		return "admin/order";
		//return "sbo/store/order";
	}

	
	// 주문목록 리스트 출력
	//가게id, 출력하고 싶은 목록(접수 대기중 목록, 처리 중 목록), 페이지를 받아서 주문목록을 SELECT
	//주문목록에 담긴 JSON형태의 메뉴 정보를 util패키지에 만들었던 메서드로 객체로 변환후 리스트에 담기
	@IsMyStore
	@GetMapping("/admin/management/orderList")
	public ResponseEntity<Map<String, Object>> orderList(long storeId, String list, int page) {
	 
//		System.out.println(storeId);
//		System.out.println(list);
//		System.out.println("page = " + page);
		List<OrderList> orderList = adminService.order(storeId, list, page);
		Map<String, Object> map = new HashMap<>();
		List<List<Cart>> menuList = new ArrayList<>();
		//System.out.println(orderList);
		if(orderList.size() != 0 && orderList.get(0).getFoodInfo() != null) {
			for (int i=0;i<orderList.size();i++) {
				menuList.add(FoodInfoFromJson.foodInfoFromJson(orderList.get(i).getFoodInfo()));
			}
		}
		
		map.put("orderList", orderList);
		map.put("cartList", menuList);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	
	// 주문 접수 처리
	// 주문번호, 배달시간, 주문자ID만 받아서 UPDATE 처리
	@PatchMapping("/admin/management/orderAccept")
	public ResponseEntity<String> orderAccept(String orderNum, int time, long userId) {
//			userId == 0 비회원
		adminService.orderAccept(orderNum, time, userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 주문 완료
	@PatchMapping("/admin/management/orderComplete")
	public ResponseEntity<String> orderComplete(String orderNum, long userId) {
//			userId == 0 비회원
		adminService.orderComplete(orderNum, userId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 매출관리 페이지 이동
	@IsMyStore
	@GetMapping("/admin/management/sales/{id}")
	public String sales(@PathVariable long id) {
		return "admin/sales";
	}
	
	// 오늘 매출 데이터 메서드, 매출 상세
	@IsMyStore
	@GetMapping("/admin/management/salesDetail")
	public ResponseEntity<Map<String, Object>> salesDetail(long storeId, String date, String sort){
		//System.out.println("매출 상세");
		
		//System.out.printf("가게 번호 : %d, 날짜 : %s, 정렬 : %s%n ", storeId, date, sort);
		Map<String, Object> salseToday = adminService.salesDetail(storeId, date, sort);
		
		return new ResponseEntity<Map<String, Object>>(salseToday, HttpStatus.OK);
	}
	
	// 매출 그래프 데이터
	@IsMyStore
	@GetMapping("/admin/management/sales")
	public ResponseEntity<List<Sales>> sales(long storeId, String date, String term) {
//			term =
//			week, month, year
		
		List<Sales> sales = adminService.sales(storeId, date, term);
		//System.out.println("값은"+sales);
		return new ResponseEntity<List<Sales>>(sales, HttpStatus.OK);
	}


	










 
}
