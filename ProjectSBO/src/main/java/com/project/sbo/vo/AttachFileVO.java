package com.project.sbo.vo;

import lombok.Data;

@Data
public class AttachFileVO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
