package com.project.sbo.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.sbo.util.MailHandler;
import com.project.sbo.vo.MailDto;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailSenderService {

	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "abc@ddd.com";

	public void mailSend(MailDto mailDto) {
		try {
			MailHandler mailHandler = new MailHandler(mailSender);

			// 받는 사람
			mailHandler.setTo(mailDto.getAddress());
			// 보내는 사람
			mailHandler.setFrom(MailSenderService.FROM_ADDRESS);
			// 제목
			mailHandler.setSubject(mailDto.getTitle());
			// HTML Layout
			String htmlContent = "<p>" + mailDto.getMessage() + "<p> <img src='cid:sample-img'>";
			mailHandler.setText(htmlContent, true);
			// 첨부 파일
			//mailHandler.setAttach("월간리포트.pdf", "static/NewFile.html");
			mailHandler.setAttach("월간리포트.pdf", "C:/resource/월간리포트.pdf");
			// 이미지 삽입
			mailHandler.setInline("sample-img", "static/하나상생플랫폼.jpg");

			mailHandler.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
