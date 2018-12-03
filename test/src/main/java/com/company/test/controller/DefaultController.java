package com.company.test.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.vo.ItemVo;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.dao.ItemDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.UserDao;


@Controller
public class DefaultController {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@Autowired
	private ItemDao ItemDao;

	
	@RequestMapping(value = "/1.joil")
	public ModelAndView WorkList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		WorkVo WorkVo = new WorkVo();
  		Date today = new Date();
  		String path = request.getRequestURI().substring(request.getContextPath().length());
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
  		Date to = null;
		
		try {	
				
				    List<ItemVo> List = ItemDao.ItemList(paramMap);
				    model.put("List", List);
				    model.put("menutitle", "작업 목록" );
				
					
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/2.joil" , method = RequestMethod.POST)
	public ModelAndView WorkInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		String pw_su_job = request.getParameter("pw_su_job");
	    String temp_time = request.getParameter("pw_pi_job_time");
	    float time = Float.parseFloat(temp_time);
	    
	    if(!request.getParameter("pw_select_work").equals("60")) //일반이면
	    {
	    	paramMap.put("pw_pi_job_time", ""+(time * 1.5));
	    }
	    
	    
		try {
			paramMap.put("pw_pi_job", pw_su_job);
			
			resultCheck = ItemDao.ItemInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkList");
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
	
	
	@RequestMapping(value = "/3.joil" , method = RequestMethod.POST)
	public ModelAndView WorkUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
	    	    
	    String pw_su_job = request.getParameter("pw_su_job");
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("pw_seq", seq);
			paramMap.put("pw_pi_job", pw_su_job);
			resultCheck = ItemDao.ItemUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkList");
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
	
	@RequestMapping(value = "/4.joil" , method = RequestMethod.POST)
	public ModelAndView WorkDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = ItemDao.ItemDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Work.joil?menuname=WorkList");
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
	
}
