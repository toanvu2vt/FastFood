package com.poly.util;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class ValidationConfig {
	@Bean("AccountValidation")
	public MessageSource getMessageSource() {
		ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource
		= new ReloadableResourceBundleMessageSource();
		reloadableResourceBundleMessageSource.setBasename("classpath:messages/account.properties");
		reloadableResourceBundleMessageSource.setDefaultEncoding("utf-8");
		return reloadableResourceBundleMessageSource;
	}
	
}
