package com.company.test.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.vo.EnterpriseVo;
import com.company.test.dao.EnterpriseDao;


@Controller
public class EnterpriseController {

	@Autowired
	private EnterpriseDao EnterpriseDao;
	
	@RequestMapping(value = "/enterprise.joil")
	public ModelAndView CodeList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		String seq = request.getParameter("seq");
		EnterpriseVo EnterpriseVo = new EnterpriseVo();
		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		
		try {	
				if(viewName.equals("EnterpriseList"))
				{
					
				    List<EnterpriseVo> List = EnterpriseDao.EnterpriseList(paramMap);
				    model.put("List", List);
				    model.put("menutitle", "업체 목록" );
				}
				else if(viewName.equals("EnterpriseInsert"))
				{	
					model.put("EnterpriseVo", EnterpriseVo);
					model.put("menutitle", "업체 등록" );
				}			
				else if(viewName.equals("EnterpriseUpdate"))
				{
					viewName = "EnterpriseInsert";
					EnterpriseVo = EnterpriseDao.getEnterprise(Integer.parseInt(seq));
					
					model.put("EnterpriseVo", EnterpriseVo);
					model.put("menutitle", "업체 수정" );
				}
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }

		
		model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
		model.put("path", path );
		
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/EnterpriseInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			
			resultCheck = EnterpriseDao.EnterpriseInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseList");
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
	
	
	@RequestMapping(value = "/EnterpriseUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			paramMap.put("se_seq", seq);
			resultCheck = EnterpriseDao.EnterpriseUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseList");
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
	
	@RequestMapping(value = "/EnterpriseDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			
			resultCheck = EnterpriseDao.EnterpriseDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/enterprise.joil?menuname=EnterpriseList");
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
	
	@RequestMapping(value = "/getEnterpriseInfo.joil" , method = RequestMethod.POST)
	public ModelAndView getEnterpriseInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		Map resultMap = new HashMap();
		String seq = request.getParameter("pw_se_seq");
		try {
			paramMap.put("se_seq", seq);
			List<EnterpriseVo> eList = EnterpriseDao.EnterpriseList(paramMap);
			 resultMap.put("elist", eList);

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
