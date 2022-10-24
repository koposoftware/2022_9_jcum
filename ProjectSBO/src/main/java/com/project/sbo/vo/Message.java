package com.project.sbo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private String message;
	private String nickname;
	private Date date;
	private String type;
 
	Message(){
		date = new Date();
	}
}
