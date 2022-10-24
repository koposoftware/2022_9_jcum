package com.project.sbo.aop;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.project.sbo.login.LoginService;
import com.project.sbo.service.AdminService;
import com.project.sbo.vo.Food;
import com.project.sbo.vo.Store;

// aop 클래스 사용
@Aspect
// 빈 등록
@Component
public class AdminAOP {
	
	@Autowired
	private AdminService adminService;

	
//	@Around는 ProceedingJoinPoint객체의 proceed()메서드를 기준으로 컨트롤러 메서드의 앞 뒤에 실행될 코드를 작성합니다
//
//	 
//
//	("@annotation(com.baemin.aop.IsMyStore)")는 com.baemin.aop에 IsMyStore라는 어노테이션이 붙은 메서드에서 실행하겠다는 의미입니다
//	 
//	ProceedingJoinPoint객체로 해당 메서드의 각종 정보들을 얻을 수 있습니다
//	검사할 가게 번호는 메서드의 첫번째 파라미터에 넣어야 된다는 규칙을 정하고 메서드의 첫번째 파라미터만 검사하겠습니다
 
	@Around("@annotation(com.project.sbo.aop.IsMyStore)")
	public Object myStore(ProceedingJoinPoint j) throws Throwable   {
		
//		ProceedingJoinPoint객체의 Args()로 메서드의 파라미터를 가져옵니다
//
//		파라미터의 첫번째 값인 args[0]을 체크하고 isMyStore() 메서드를 실행해 내 계정에 등록된 가게인지 검사 후 통과한다면 j.proceed()를 반환해 해당 페이지에 접근할 수 있게합니다
		long storeId = 0;
		Object[] args = j.getArgs();
		if(args.length > 0) {
			Object arg = args[0];
			
			if(arg instanceof Long) {
				storeId = (long) arg;
			} else if(arg instanceof Store) {
				storeId = ((Store) arg).getId();
			} else if(arg instanceof Food) {
				storeId = ((Food) arg).getStoreId();
			} 
		}
		if(!isMyStore(storeId)) { 
			System.out.println("aop 에러");
			return new ResponseEntity<Object>(HttpStatus.UNAUTHORIZED);
		}
		Object returnObj = j.proceed();
		return returnObj;
	}
//	세션에 등록된 mystore 리스트를 가져옵니다
//
//	null이라면 시큐리티 세션의 계정의 id로 db에서 select해 세션에 저장합니다
	public boolean isMyStore(long storeId) throws IOException {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		List<Long> storeIdList = (List<Long>) session.getAttribute("myStore");
		
		if(storeIdList == null) {
			SecurityContext sc = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
			LoginService user = (LoginService) sc.getAuthentication().getPrincipal();
			long userId = user.getUser().getId();
			storeIdList = adminService.getMyStoreId(userId);
			System.out.println("rrrrrrrr"+storeIdList);
	        	session.setAttribute("myStore", storeIdList);
		} 
		
		if(storeIdList.size() == 0) {
			return false;
		} else {
			if(storeIdList.contains(storeId)) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	
}