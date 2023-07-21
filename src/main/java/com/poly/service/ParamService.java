package com.poly.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext context;
	
	
	public String getString(String name,String defaultValue) {
		String result = request.getParameter(name);
		return result != null ? result : defaultValue;
	}
	
	public int getInt(String name,Integer defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Integer.parseInt(result) : defaultValue;
	}
	
	public Double getDouble(String name,Double defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Double.parseDouble(result) : defaultValue;
	}
	
	public Boolean getBoolean(String name,Boolean defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Boolean.valueOf(result): defaultValue;
	}
	
	public Date getDate(String name, String pattern) {
		try {
			SimpleDateFormat formater = new SimpleDateFormat(pattern);
			return formater.parse(request.getParameter(name));
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public File save(MultipartFile file, String path) throws Exception {
		File dir = new File(context.getRealPath(path));
		if (!dir.exists())
			dir.mkdirs();
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new Exception();
		}
	}
}
