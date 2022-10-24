package com.project.sbo.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/*
 * 스프링부트 환경설정 클래스임을 명시, 자동으로 빈 등록
 * 이 에너테이션이 붙게되면 @ComponentScan 시 이 클래스에 @Bean 으로 지정된 모든 빈들도 IoC 컨테이너에 등록됨
 * 
 * */

@Configuration
@PropertySource("classpath:/application.properties")
public class DBConfiguration {

	@Autowired
	private ApplicationContext applicationContext;
	
	/*
	 * 히카리 설정 CP
	 * @Bean : return되는 객체를 IoC 컨테이너에 등록 주입은 오토와이어드
	 * 특별히 지정하는 이름이 없다면 IoC 컨테이너에 해당 메서드명으로 등록, 이름도 지정가능
	 * application.properties 파일로 부터 데이터베이스 관련된 정보를 읽어와서 히카리 설정 객체를 리턴
	 * 접두어는 해당 접두어로 시작하는 정보들을 읽어온다.
	 */
	
	// 히카리 설정
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.hikari")
	public HikariConfig hikariConfig() {
		
		return new HikariConfig();
	}
	
	// 히카리 설정
	@Bean
	public DataSource datasSource() {
		
		DataSource dataSource = new HikariDataSource(hikariConfig());
		
		return dataSource;
	}
	
	// 마이바티스 설정
	/*
	 * 설정 3가지
	 * 1. setDataSource : 빌드된 DataSource를 셋팅
	 * 2. setMapperLocations : SQL 구문이 작성된 "Mapper.xml의 경로를 정확히 지정
	 * 3. setTypeAliasesPackage : 인자로 Alias 대상 클래스가 위치한 패키지 경로.
	 * 
	 * */
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
	
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource);
		// Membermapper, boardmapper ~
		factoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*Mapper.xml"));
		
		/**
		 * 리소스 참고 방법
		 * 1. ApplicationContext(프레임워크 컨테이너) 객체가 가지고 있음
		 * 2. 
		 */
		//factoryBean.setTypeAliasesPackage("com.mybatis2.dto");
		factoryBean.setTypeAliasesPackage("com.project.sbo.vo");
		
		return factoryBean.getObject();
		
	}
	
	// 마이바티스 설정
	/*
	 * 1. MyBatis의 sqlSession 객체가 Spring+MyBatis 연동 모듈에서는 sqlSessionTemplate가 대체. 
	 */
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception{
	
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
}
