package com.project.sbo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.sbo.login.LoginService;
import com.project.sbo.service.UserService;
import com.project.sbo.vo.Join;
import com.project.sbo.vo.Point;
import com.project.sbo.vo.Review;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	
	
	@GetMapping("/myPage")
	public String myPage() {
		return "user/myPage";
	}
	
	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		// referer 객체는 페이지 이동 시 남는 흔적, 어느 페이지에서 왔는지 확인가능
		String referer = (String) request.getHeader("referer");
		session.setAttribute("referer", referer);
		return "user/login";
	}
	
	@GetMapping("/join")
	public String join() {
	    return "user/join";
	}
	
	@PostMapping("/join")
	public String joinProc(@Valid Join join, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			List<FieldError> list = bindingResult.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<>();
			for(int i=0;i<list.size();i++) {
				String field = list.get(i).getField(); 
				String message = list.get(i).getDefaultMessage(); 
				errorMsg.put(field, message);
			}
			model.addAttribute("errorMsg", errorMsg);
			return "user/join";
		}
		
		// 비밀번호 암호화 처리부분
		String encPwd = pwdEncoder.encode(join.getPassword());
		join.setPassword(encPwd);
		
		userService.join(join);
		
		return "redirect:/login";
	}
	
	
	@ResponseBody
	@GetMapping("/overlapCheck")
	public int overlapCheck(String value, String valueType) {
//		value = 중복체크할 값
//		valeuType = username, nickname
		//System.out.println(value);
		//System.out.println(valueType);
		int count = userService.overlapCheck(value, valueType);
		
		//System.out.println(count);
		return count;
	}
	
	// 내포인트
	@GetMapping("/user/point")
	public String point(@AuthenticationPrincipal LoginService user, Model model) {
		long id = user.getUser().getId();
		List<Point> myPoint = userService.myPoint(id);
		model.addAttribute("myPoint", myPoint);
		model.addAttribute("point", user.getUser().getPoint());
		
		return "user/point";
	}
	
	// 상품권 등록 처리
	@PostMapping("/user/pointRegist")
	public ResponseEntity<Map<String, Object>> pointRegist(String giftCardNum, @AuthenticationPrincipal LoginService user, HttpSession session) {
		ResponseEntity<Map<String, Object>> point = userService.pointRegist(giftCardNum, user);
		return point;
	}
	
	// 내 댓글 처리
	@GetMapping("/user/myReview")
	public String myreView(@AuthenticationPrincipal LoginService user, Model model) {
		long id = user.getUser().getId();
		List<Review> myReviewList = userService.myReviewList(id);
		model.addAttribute("myReviewList", myReviewList);
		return "user/myReview";
	}
	
	// 내 댓글 처리
	@DeleteMapping("/user/review")
	public ResponseEntity<String> deleteReview(@AuthenticationPrincipal LoginService user, String orderNum) {
		long id = user.getUser().getId();
		userService.deleteReview(id, orderNum);
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	// 내 정보 수정
	@GetMapping("/user/myInfo")
	public String myInfo() {
		return "user/myInfo";
	}




	
	

}
