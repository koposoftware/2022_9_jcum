package com.project.sbo.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.sbo.vo.User;

@Service
public class LoginDetailService implements UserDetailsService {

	@Autowired
	private SqlSession sql;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("값은? : "+username);
		User user = sql.selectOne("user.login", username);

		System.out.println(user);
		if (user != null) {
			LoginService loginDetail = new LoginService();

			loginDetail.setUser(user);

			return loginDetail;
		} else {
			throw new UsernameNotFoundException("유저없음");
		}
	}

}