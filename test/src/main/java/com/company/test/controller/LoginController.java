package com.company.test.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.company.test.dao.UtilDao;
import com.company.test.vo.UserVo;
import com.company.test.vo.UtilVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserDao UserDao;
	private UserVo UserVo;
	
	@Autowired
	private UtilDao UtilDao;
	private UtilVo UtilVo;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login.joil")
	public ModelAndView LoginCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();
		HttpSession hs = request.getSession();
		String path = request.getRequestURI().substring(request.getContextPath().length());
		HashMap<String, Object> map = new HashMap();		
		try {			
			String su_id = request.getParameter("su_id");
			String su_password = request.getParameter("su_password");
			map.put("su_id", su_id);
			map.put("su_password", su_password);
			UserVo = UserDao.LoginCheck(map);
			if(UserVo == null || UserVo.getSu_name().equals("") || UserVo.getSu_name().equals(null))
			{				
		        model.put("result", "alertgo");
		        model.put("message", "아이디 또는 비밀번호가 틀립니다.");
		        model.put("href", "/");
			}
			else
			{
				Map paramMap = new HashMap();
			    //model.put("su_menu_auth", UserVo.getSu_menu_auth());
			    paramMap.put("f_data_seq",UserVo.getSu_seq() +"");
				paramMap.put("f_menu_name","UserFile" );
				List<UtilVo> fileList = UtilDao.FileList(paramMap);
				UserVo.setFilelist(fileList);
				hs.setMaxInactiveInterval(21600); //단위 초  3600 = 1시간
				hs.setAttribute("UserInfo", UserVo);
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
				logger.error("postHandle : 접속자 이름  = "+UserVo.getSu_name() + ", 접속자 아이디 : "+UserVo.getSu_id());
		    	logger.error("postHandle : 접속 시간 : "+formatter.format(date));
				
				model.put("result", "onlygo");
				model.put("href", "/main.joil");
			}
			
		} catch (Exception e) {
	    	
	    	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
	    }
		
		model.put("path", path );
		mnv.setViewName("action");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	@RequestMapping(value = "/error.joil")
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();
		HttpSession hs = request.getSession();
		String path = request.getRequestURI().substring(request.getContextPath().length());
		HashMap<String, Object> map = new HashMap();		
		
		mnv.setViewName("error");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/logout.joil")
	public ModelAndView Logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();		
		HttpSession hs = request.getSession();
		HashMap<String, Object> map = new HashMap();		
		try {			
		        model.put("result", "alertgo");
		        model.put("message", "로그아웃 하셨습니다.");
		        model.put("href", "/");		
		        hs.invalidate();
		} catch (Exception e) {
	    	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
	    }
		mnv.setViewName("action");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
}
