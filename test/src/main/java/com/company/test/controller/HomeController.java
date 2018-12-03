package com.company.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mnv = new ModelAndView();
		//Map model = new HashMap();
		//String path = request.getRequestURI().substring(request.getContextPath().length());
		/*
		model.put("path", path );
		model.put("title", "조일 ERP 로그인" );
        model.put("result", "onlygo");
        model.put("message", "");
        model.put("href", "/");
        */
		mnv.setViewName("login");
		//mnv.addAllObjects(model);
		return mnv;
	}
	
	
	
	
}
