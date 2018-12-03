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

import com.company.test.vo.ManCostVo;
import com.company.test.vo.UserVo;
import com.company.test.dao.ManCostDao;
import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.UserDao;


@Controller
public class ManCostController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManCostController.class);
	
	@Autowired
	private ManCostDao ManCostDao;
	
	@RequestMapping(value = "/ManCost.joil")
	public ModelAndView ManCostList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		String seq = request.getParameter("seq");
		ManCostVo ManCostVo = new ManCostVo();
		
		try {	
				if(viewName.equals("ManCostList"))
				{
					ManCostVo = ManCostDao.getManCost();
					model.put("ManCostVo", ManCostVo);
				    model.put("menutitle", "임률 관리" );
				}
								
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
		
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
		
	@RequestMapping(value = "/ManCostUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView ManCostUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    	    
	    
	    
	    int resultCheck=0;
	  
		try {
			
			resultCheck = ManCostDao.ManCostUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ManCost.joil?menuname=ManCostList");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ManCost.joil?menuname=ManCostList");
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
