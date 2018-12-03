package com.company.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.dao.UserDao;
import com.company.test.vo.UserVo;
import com.company.test.controller.*;

/**
 * 메인 컨트롤러. 
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	
	@Autowired
	private UserDao UserDao;
	private UserVo UserVo;

	@RequestMapping(value = "/main.joil")
	public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) {
		
	    ModelAndView mnv = new ModelAndView();	
	    HttpSession hs = request.getSession();
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		
		try {
			
			/*logger.error("getId = "+hs.getId());
			logger.error("getLastAccessedTime = "+hs.getLastAccessedTime());
			logger.error("getMaxInactiveInterval = "+hs.getMaxInactiveInterval());
			logger.error("getSessionContext = "+hs.getSessionContext());*/
			//UserVo = (UserVo) hs.getAttribute("UserInfo");
			//model.put("menu_auth", UserVo.getSu_menu_auth()); //메뉴 권한 
			mnv.setViewName("main");
							
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }		
		model.put("title", "조일 ERP");
		model.put("path", path );				
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
}
