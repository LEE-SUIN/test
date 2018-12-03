package com.company.test.controller;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.vo.WorkVo;
import com.company.test.vo.UserVo;
import com.company.test.dao.WorkDao;
import com.company.test.vo.BuyManageVo;
import com.company.test.vo.BuyVo;
import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.vo.EmailSendVo;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.dao.EmailSendDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.UserDao;


@Controller
public class EmailSendController {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@Autowired
	private EmailSendDao EmailSendDao; 

	@Autowired
	private UserDao UserDao;
	
	@Autowired
	private CodeDao CodeDao;
	
	
	@RequestMapping(value = "/EmailSend.joil")
	public ModelAndView EmailSend(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		
  		WorkVo WorkVo = new WorkVo();
  		Date today = new Date();
  		String path = request.getRequestURI().substring(request.getContextPath().length());
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
  		Date to = null;
  		String el_seq = request.getParameter("el_seq");
  		EmailSendVo EmailSendVo = new EmailSendVo();
  		
		try {	
					if(viewName.equals("EmailSend") || viewName.equals(null) || viewName.equals(""))
					{	
						paramMap.put("use_yn", "Y");
						List<EmailSendVo> List = EmailSendDao.EmailSendList(paramMap);
					    model.put("List", List); 
					    model.put("menutitle", "메일 발송" );
					    
					    List<UserVo> UserList = UserDao.UserList(paramMap);
						model.put("UserList2", UserList);
					    
					    viewName = "EmailSend";
					    
					    paramMap.put("use_yn", "Y");
					    paramMap.put("ec_group", "P");
						List<EmailSendVo> PList = EmailSendDao.EmailSendCodeList(paramMap);
						model.put("PList", PList);
						paramMap.put("ec_group", "T");
						List<EmailSendVo> TList = EmailSendDao.EmailSendCodeList(paramMap);
						model.put("TList", TList);
						
						CodeVo cList = CodeDao.getCode(94);
						model.put("CodeVo", cList);
					    
					}
					else if(viewName.equals("EmailSendList"))
					{
						List<EmailSendVo> List = EmailSendDao.EmailSendList(paramMap);
					    model.put("List", List);
						
						List<UserVo> UserList = UserDao.UserList(paramMap);
						model.put("UserList", UserList);
						viewName = "EmailSendList";
						model.put("menutitle", "메일 인원 관리" );
						
					}
					else if(viewName.equals("EmailSendUpdate"))
					{
						EmailSendVo = EmailSendDao.getEmailSend(Integer.parseInt(el_seq));
						model.put("EmailSendVo", EmailSendVo);
						
						viewName = "EmailSendUpdate";
						model.put("menutitle", "메일 인원 관리" );
					}
					else if(viewName.equals("EmailCode"))
					{
						paramMap.put("ec_group", "P");
						List<EmailSendVo> PList = EmailSendDao.EmailSendCodeList(paramMap);
						model.put("PList", PList);
						paramMap.put("ec_group", "T");
						List<EmailSendVo> TList = EmailSendDao.EmailSendCodeList(paramMap);
						model.put("TList", TList);
						viewName = "EmailCode";
												
						CodeVo cList = CodeDao.getCode(94);
						model.put("CodeVo", cList);
						
						model.put("menutitle", "메일 코드 관리" );
					}else if(viewName.equals("EmailSendBonusList"))
					{
						paramMap.put("use_yn", "Y");
						List<EmailSendVo> List = EmailSendDao.EmailSendBonusList(paramMap);
					    model.put("List", List); 
					    model.put("menutitle", "메일 발송" );
						
					}
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/EmailSendInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		
	    
		try {
						
			resultCheck = EmailSendDao.EmailSendInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
			}
			
							
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
	
	
	@RequestMapping(value = "/EmailSendUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String el_seq = request.getParameter("el_seq");
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("el_seq", el_seq);
			
			resultCheck = EmailSendDao.EmailSendUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
			}
			
							
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
	
	@RequestMapping(value = "/EmailSendDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String el_seq = request.getParameter("el_seq");
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = EmailSendDao.EmailSendDelete(Integer.parseInt(el_seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSend");
			}
			
							
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
	
	
	
	
	@RequestMapping(value = "/EmailSendProc.joil" , method = RequestMethod.POST)
	public ModelAndView getEnterPriseInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();		
		Map resultMap = new HashMap();
		int resultCnt= 0;
		String email = request.getParameter("email");
		String contents = request.getParameter("contents");
		String title = request.getParameter("title");
		
  		DecimalFormat df = new DecimalFormat("00");
  		Calendar currentCalendar = Calendar.getInstance();
  		String strMonth = df.format(currentCalendar.get(Calendar.MONTH) );
  		String strYear = df.format(currentCalendar.get(Calendar.YEAR) );
		
		
		try {
			  String host = "smtp.naver.com";
			  final String username = "joilcor";
			  final String password = "joil0101!";
			  int port=465;
			  
			  String recipient=email;
			  String subject = title;
			  String body = contents;
			  Properties props = System.getProperties();
			  props.put("mail.smtp.user", username);
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.port", port);
			  props.put("mail.smtp.auth", "true");
			  props.put("mail.smtp.debug", "true");
			  props.put("mail.smtp.ssl.enable", "true");
			  props.put("mail.smtp.ssl.trust", host);
			  		  
			  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			  String un=username;
			  String pw=password;
			  protected PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication(un, pw);
			  }
			  });
			  
			  session.setDebug(true); //for debug
			  Message mimeMessage = new MimeMessage(session);
			  //여러명에게 보낼때
			  /*
			  InternetAddress[] toAddr = new InternetAddress[2];
			  toAddr[0] = new InternetAddress ("보내는사람 주소");
			  toAddr[1] = new InternetAddress ("보내는사람 주소");
			  //toAddr[2] = new InternetAddress ("");
			  mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
			  */
			  mimeMessage.setFrom(new InternetAddress("joilcor@naver.com","조일"));
			  mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			  mimeMessage.setSubject(subject);
			  mimeMessage.setContent(body, "text/html;charset=utf-8");
			  Transport.send(mimeMessage);
			  //System.out.println("정상적으로 메일 발송이 되었습니다.");

			  resultCnt = 1;
			  resultMap.put("resultCnt", resultCnt);
			  resultMap.put("email", email);
		      mnv.addAllObjects(resultMap);
		} catch (Exception e) {	    	
	    	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
	    }
		mnv.setViewName("jsonView");
		return mnv;
	
	}
	
	
	
	
	@RequestMapping(value = "/EmailSendCodeInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendCodeInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
						
			resultCheck = EmailSendDao.EmailSendCodeInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
			}
			
							
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
	
	
	@RequestMapping(value = "/EmailSendCodeUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendCodeUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String ec_seq = request.getParameter("ec_seq");
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("ec_seq", ec_seq);			
			resultCheck = EmailSendDao.EmailSendCodeUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
			}
			
							
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
	
	@RequestMapping(value = "/EmailSendCodeDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendCodeDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String ec_seq = request.getParameter("ec_seq");
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = EmailSendDao.EmailSendCodeDelete(Integer.parseInt(ec_seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
			}
			
							
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
	
	
	
	@RequestMapping(value = "/EmailSendCodeUseProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendCodeUseProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String ec_seq = request.getParameter("ec_seq");
	    Map resultMap = new HashMap();
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("ec_seq", ec_seq);
			
			resultCheck = EmailSendDao.EmailSendCodeUseUpdate(paramMap);
			resultMap.put("resultCheck", resultCheck);
			mnv.addAllObjects(resultMap);
			
			
							
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		mnv.setViewName("jsonView");
		return mnv;
	}
	
	
	@RequestMapping(value = "/CodeUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView CodeUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("sc_group_seq", "11");
			paramMap.put("sc_seq", "94");
			
			resultCheck = CodeDao.codeUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "onlygo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "onlygo");
				model.put("href", "/EmailSend.joil?menuname=EmailCode");
			}
			
							
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
	
	
	
	@RequestMapping(value = "/EmailSendBonusUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendBonusUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String el_seq = request.getParameter("el_seq");
	    model.put("menu_auth", "88"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("el_seq", el_seq);
			
			resultCheck = EmailSendDao.EmailSendBonusUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSendBonusList");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/EmailSend.joil?menuname=EmailSendBonusList");
			}
			
							
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
	
	
	
	
	@RequestMapping(value = "/EmailSendBonusProc.joil" , method = RequestMethod.POST)
	public ModelAndView EmailSendBonusProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();		
		Map resultMap = new HashMap();
		int resultCnt= 0;
		String email = request.getParameter("email");
		String contents = request.getParameter("contents");
		String title = request.getParameter("title");
		
  		DecimalFormat df = new DecimalFormat("00");
  		Calendar currentCalendar = Calendar.getInstance();
  		String strMonth = df.format(currentCalendar.get(Calendar.MONTH) );
  		String strYear = df.format(currentCalendar.get(Calendar.YEAR) );
		
		
		try {
			  String host = "smtp.naver.com";
			  final String username = "joilcor";
			  final String password = "joil0101!";
			  int port=465;
			  
			  String recipient=email;
			  String subject = title;
			  String body = contents;
			  Properties props = System.getProperties();
			  props.put("mail.smtp.user", username);
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.port", port);
			  props.put("mail.smtp.auth", "true");
			  props.put("mail.smtp.debug", "true");
			  props.put("mail.smtp.ssl.enable", "true");
			  props.put("mail.smtp.ssl.trust", host);
			  		  
			  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			  String un=username;
			  String pw=password;
			  protected PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication(un, pw);
			  }
			  });
			  
			  session.setDebug(true); //for debug
			  Message mimeMessage = new MimeMessage(session);
			  //여러명에게 보낼때
			  /*
			  InternetAddress[] toAddr = new InternetAddress[2];
			  toAddr[0] = new InternetAddress ("보내는사람 주소");
			  toAddr[1] = new InternetAddress ("보내는사람 주소");
			  //toAddr[2] = new InternetAddress ("");
			  mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
			  */
			  mimeMessage.setFrom(new InternetAddress("joilcor@naver.com","조일"));
			  mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			  mimeMessage.setSubject(subject);
			  mimeMessage.setContent(body, "text/html;charset=utf-8");
			  Transport.send(mimeMessage);
			  //System.out.println("정상적으로 메일 발송이 되었습니다.");

			  resultCnt = 1;
			  resultMap.put("resultCnt", resultCnt);
			  resultMap.put("email", email);
		      mnv.addAllObjects(resultMap);
		} catch (Exception e) {	    	
	    	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
	    }
		mnv.setViewName("jsonView");
		return mnv;
	
	}
	
	
	
	
	
}
