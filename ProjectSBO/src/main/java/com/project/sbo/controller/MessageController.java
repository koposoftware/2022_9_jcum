package com.project.sbo.controller;

import java.util.Map;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.project.sbo.vo.Message;

@Controller
public class MessageController {
	
	// 주문했을때
	@MessageMapping("/order-complete-message/{storeId}")
	@SendTo("/topic/order-complete/{storeId}")
	public String message(@DestinationVariable long storeId, String message) {
		//System.out.println("가게번호 : " + storeId);
		//System.out.println("메세지 도착 :" + message);
		return message;
	}
	
	
	// 메세지 컨트롤러
	
	// 여기서 메세지가 오면 방목록 업데이트
	@MessageMapping("/roomList")
	@SendTo("/topic/roomList")
	public String roomList() {
		//System.out.println("들어오나??"); 
		return "";
	}
	
	// 채팅방에서 메세지 보내기
	@MessageMapping("/sendMessage/{roomNumber}")
	@SendTo("/topic/message/{roomNumber}")
	public Message sendMessage(@DestinationVariable String roomNumber, Message message) {
		//System.out.println(message);
		return message;
	}
	
	// 채팅방에 입장 퇴장 메세지 보내기
	@MessageMapping("/notification/{roomNumber}")
	@SendTo("/topic/notification/{roomNumber}")
	public Map<String, Object> notification(@DestinationVariable String roomNumber, Map<String, Object> chatingRoom) {
		//System.out.println("입장 : "+chatingRoom);
		return chatingRoom;
	}

 
}

