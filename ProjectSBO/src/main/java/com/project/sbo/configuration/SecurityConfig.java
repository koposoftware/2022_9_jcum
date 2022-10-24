package com.project.sbo.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.project.sbo.login.LoginDetailService;
import com.project.sbo.login.LoginFail;
import com.project.sbo.login.LoginSuccess;

@EnableWebSecurity
@Configuration
public class SecurityConfig  extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private LoginFail loginFail;
	 
	@Autowired
	private LoginSuccess loginSuccess;
	
	@Autowired
	private LoginDetailService loginDetailService;

	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	// //이중슬래시 허용
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}
    
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		//http.cors().and().csrf().disable();
		
		
		http.authorizeRequests()
			.antMatchers("/user/point").hasRole("USER")
			.antMatchers("/user/pointRegist").hasRole("USER")
			.antMatchers("/user/myReview").hasRole("USER")
			.antMatchers("/user/review").hasRole("USER")
			.antMatchers("/user/myInfo").hasRole("USER")
			.antMatchers("/user/info").hasRole("USER")
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/user/**").hasAnyRole("ADMIN, USER")
			.anyRequest().permitAll()
		.and()
			.formLogin()
			.loginPage("/") // 인증 필요한 페이지 접근시 이동페이지
			.loginProcessingUrl("/login")
			.successHandler(loginSuccess)
			.failureHandler(loginFail)
		.and()
			.logout()
			.logoutSuccessUrl("/myPage")
		.and()
			.rememberMe()
			.key("rememberKey")
			.rememberMeCookieName("rememberMeCookieName")
			.rememberMeParameter("remember-me")
			.tokenValiditySeconds(60 * 60 * 24 * 7)
			.userDetailsService(loginDetailService)
		;
		
	}
	
}



//@Configuration 설정파일로 등록
//@EnableWebSecurity 아래 구현하는 시큐리티 필터를 사용
//.antMatchers("/admin/**").hasRole("ADMIN")  /admin으로 시작하는 url은 권한이 ADMIN인 사람만 가능
//.antMatchers("/user/**").hasAnyRole("ADMIN, USER") /user로 시작하는 url은 권한이 ADMIN 또는 USER인 사람만 가능
//.anyRequest().permitAll() 이 외의 요청은 누구나 가능
//.loginPage("/") 권한이 없는데 권한이 필요한 페이지로 이동시 "/"페이지로 이동
//.loginProcessingUrl("/login") 실제 로그인을 처리할 주소
//.logoutSuccessUrl("/myPage") 로그아웃 성공시 이동할 페이지
//key("rememberKey") 쿠키값을 암호화할때 사용되는 키
//rememberMeParameter("remember-me")  로그인페이지의 체크박스 name과 일치해야합니다 이옵션을 쓰지 않으면 기본값은 "remember-me" 
//rememberMeCookieName("rememberMeCookieName") 저장할 쿠키의 이름 기본값은 "remember-me" 
//tokenValiditySeconds(60 * 60 * 24 * 7) 쿠키의 유지시간 - 일주일 
//userDetailsService(loginDetailService) 유저정보를 받아올 UserDetailsService를 넣으면 되는데 위에서 구현한 loginDetailService를 사용