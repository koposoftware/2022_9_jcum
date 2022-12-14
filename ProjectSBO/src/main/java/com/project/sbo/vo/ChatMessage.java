package com.project.sbo.vo;

import lombok.Data;

@Data
public class ChatMessage {
	  private String roomId;            // 방 번호
	  private String messageId;        // 메세지 번호
	  private String message;            // 메세지 내용
	  private String name;            // 보낸이 이름
	  private String email;            // 보낸이 이메일
	  private int unReadCount;        // 안 읽은 메세지 수
	  private int sessionCount;        // 현재 세션 수
	    
}
