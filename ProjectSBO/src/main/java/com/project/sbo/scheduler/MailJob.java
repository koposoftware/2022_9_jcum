package com.project.sbo.scheduler;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.sbo.service.MailSenderService;
import com.project.sbo.vo.MailDto;

@Component
public class MailJob {
	
	@Autowired
	MailSenderService mailService;
	
	// 매달 1일 01시 30분에
	//@Scheduled(cron = "* 50 * * * *")
	public void mailJob() throws MessagingException, IOException {
		
		MailDto mailDto = new MailDto();
		mailDto.setAddress("abctmxk@naver.com");
		mailDto.setMessage("월간리포트 입니다");
		mailDto.setTitle("하나상생플랫폼에서 보내는 월간리포트입니다");
        System.out.println("### SEND MAIL START ###");
		mailService.mailSend(mailDto);
		System.out.println("#### SEND MAIL END ####");
	}

}
