package com.company.test.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.vo.UserVo;

@Controller
public class testController {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String test = "1|2|3|4|5|6|7|8|99";
		String tmp[] = test.split("[|]");
		
		SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		System.out.println(" = "+sdf.format(date));
		
		System.out.println(UUID.randomUUID());
		
		System.out.println(String.format("%03d", 8));
	}

	@RequestMapping(value = "/test.joil")
	public ModelAndView test1(HttpServletRequest request, HttpServletResponse response) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();

		mnv.setViewName("test");
		mnv.addAllObjects(model);
		return mnv;
	}
	
}
