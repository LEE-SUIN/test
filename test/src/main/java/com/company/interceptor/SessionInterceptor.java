package com.company.interceptor;

import java.io.PrintWriter;
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
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.company.test.controller.LoginController;
import com.company.test.dao.UtilDao;
import com.company.test.vo.UserVo;
import com.company.test.vo.UtilVo;
import com.company.test.util.util;
/**
 * 세션 체크 인터셉터.
 */

 public class SessionInterceptor extends HandlerInterceptorAdapter {
	 
  private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
  private UserVo UserVo;
  
  public SessionInterceptor()
  {
	  //int i=0;
	  //logger.info(" SessionInterceptor init1  = "+i++);
		
  }
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
   //System.out.println("Interceptor : PreHandle");
	  //logger.info(" preHandle start  ");
   // Session userid check
   HttpSession hs = request.getSession();   
   UserVo = (UserVo) hs.getAttribute("UserInfo");

   // Login false
   if(UserVo ==null || UserVo.getSu_name().equals("") || UserVo.getSu_name().equals(null)) {	
	//logger.error("PreHandle : Session Check Fail");
	//util.resultToMassage("세션이 만료되었습니다.", response);	
    // login page 로 이동
	ModelAndView mnv = new ModelAndView();
    Map model = new HashMap();
    
    model.put("result", "alertgo");
	model.put("href", "/");
	model.put("message","세션이 만료되었습니다.로그인 페이지로 이동합니다." );
	model.put("title", "조일 ERP");
	mnv.setViewName("action");
	mnv.addAllObjects(model);
    throw new ModelAndViewDefiningException(mnv);	
    //response.sendRedirect("/");
    //return false;
   } 
   // Login true
   else {	
	   
	//logger.error("PreHandle : Session Check true");
    //return super.preHandle(request, response, handler);
	return true;
   }   
  }
  
  
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	  //logger.info("postHandle : start");
	  HttpSession hs = request.getSession();   
	  UserVo = (UserVo) hs.getAttribute("UserInfo");
	  ModelAndView mnv = new ModelAndView();
	  Map model = new HashMap();
	  Date date = new Date();
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	  boolean authCheck = false;
      if(modelAndView != null)
      {   
          Map<String, Object> map = modelAndView.getModel();
          if(map.get("menu_auth") != null)
          {    
        	  String[] menu_auth = UserVo.getSu_menu_auth().split("[|]");
        	  for(int i=0;i< menu_auth.length;i++)
        	  {  
        		  if(menu_auth[i].equals(map.get("menu_auth")) )
        		  {
        			  authCheck =true;
        		  }
        	  }
          }          
          else if(map.get("menu_auth") == null || map.get("menu_auth").equals("") ) /* 로그인 후 메인 화면으로 갈 경우 기본적으로 통과 한다 */
          {
        	  authCheck= true;
          }
      }
      
      
      
      if(authCheck == false)
      {
    	  hs.invalidate();
    	  logger.error("postHandle : 메뉴 권한 오류 ");
    	  logger.error("postHandle : 접속자 이름  = "+UserVo.getSu_name() + ", 접속자 아이디 : "+UserVo.getSu_id());
    	  logger.error("postHandle : 접속 시간 : "+formatter.format(date));
    	    
    	  model.put("result", "alertgo");
    	  model.put("href", "/");
    	  model.put("message","메뉴 권한이 없습니다.로그인 페이지로 이동합니다." );
    	 
    	  mnv.setViewName("action");
    	  mnv.addAllObjects(model);
    	  throw new ModelAndViewDefiningException(mnv);
      }
      //logger.error("postHandle : su_menu_auth =  "+UserVo.getSu_menu_auth());
      
      
      modelAndView.addObject("title", "조일 ERP");
      modelAndView.addObject("UserInfo", UserVo);
      modelAndView.addObject("su_menu_auth", UserVo.getSu_menu_auth());
      
      super.postHandle(request, response, handler, modelAndView);
      
      
            
  }

  
  
  
  
  
  
  
  
 }
