package com.project.sbo.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
 
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// endpoint 설정
		registry.addEndpoint("/websocket").withSockJS();
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 메모리 기반 메세지 브로커가 해당 api 구독하고 있는 클라이언트에게 메세지 전달
		registry.enableSimpleBroker("/topic");
		// 서버에서 클라이언트로부터의 메세지를 받을 api의 prefix
		registry.setApplicationDestinationPrefixes("/message");
	}
}



//@EnableWebSocketMessageBroker 웹소켓 사용
//addEndpoint - 웹 소켓으로 사용할 주소
//withSockJs()  - 버전이 낮은 브라우저에서도 사용가능
//enableSimpleBroker - "/topic"이 붙은 클라이언트에게 메세지를 전송
//setApplicationDestinationPrefixes - 클라이언트에게서 메세지를 받을 서버주소의 prefix
