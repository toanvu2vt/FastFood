package com.poly.service;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import com.poly.util.MailInfo;

public interface MailService {
	void send(MailInfo mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	void queue(MailInfo mail);
	void queue(String to, String subject, String body) throws MessagingException;
}
