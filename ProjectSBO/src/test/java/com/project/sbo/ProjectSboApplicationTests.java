package com.project.sbo;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

@SpringBootTest
class ProjectSboApplicationTests {

	@Autowired
	SqlSession sql;
	@Test
	void contextLoads() {
	}
	
//	@Test
//	public void orderDetail() {
//		//OrderDetail[] detail;
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("userId", 20228246199431818L);
//		map.put("detail", "{qwdqwdqwD:qwdqwd");
//		
//		sql.insert("order.orderDetail", map);
//		System.out.println(map);
//	}
	
	
    @Autowired
    ResourceLoader resourceLoader;

    @Test
    public void test() {
        System.out.println(resourceLoader.getClass());

        Resource resource = resourceLoader.getResource("key.json");
        System.out.println(resource.getClass());

        ResourceLoader defulatResourceLoader = new DefaultResourceLoader();
        Resource defaultResource = defulatResourceLoader.getResource("classpath:key.json");
        System.out.println(defaultResource.getClass());
    }

}
