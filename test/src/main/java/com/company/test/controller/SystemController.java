package com.company.test.controller;


import java.io.Console;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.vo.Paging;
import com.company.test.util.util;
import com.company.test.dao.UserDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.CodeDao;
import com.company.test.vo.CodeVo;
import com.company.test.dao.UserJobDao;
import com.company.test.vo.UserJobVo;
import com.company.test.dao.UtilDao;
import com.company.test.vo.UtilVo;
/**
 * 시스템 관리 컨트롤러. 사용자 관리,
 */
@Controller
public class SystemController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	
	
	@Autowired
	private UserDao UserDao;
	@Autowired
	private CodeDao CodeDao;
	@Autowired
	private UserJobDao UserJobDao;
	@Autowired
	private UtilDao UtilDao;
    
	
	@RequestMapping(value = "/user.joil")
	public ModelAndView UserList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		String seq = request.getParameter("seq");
		model.put("menu_auth", "8");
		UserVo UserVo = new UserVo();
		Date today = new Date();
		paramMap.put("pageNo","0");
		paramMap.put("pageSize","99999");
		model.put("menu_name", viewName);
		try {			 
				if(viewName.equals("userList"))
				{					
				    List<UserVo> List = UserDao.UserList(paramMap);
				    
				    for(int i=0;i<List.size();i++)
				    {
				    	paramMap.put("f_data_seq",List.get(i).getSu_seq()+"");
						paramMap.put("f_menu_name","UserFile" );
						List<UtilVo> fileList = UtilDao.FileList(paramMap);
				    	List.get(i).setFilelist(fileList);
				    	//System.out.println(" "+i+" =  "+List.get(i).getFilelist());
				    }
				    paramMap.put("sc_group_seq", "3");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
				    
				    model.put("List", List);
				    model.put("menutitle", "사용자 목록" );
				}
				else if(viewName.equals("userInsert"))
				{
					paramMap.put("sc_group_seq", "1");
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					paramMap.put("sc_group_seq", "2");
					List<CodeVo> rList = CodeDao.CodeList(paramMap);
					model.put("rList", rList);
					
					paramMap.put("sc_group_seq", "3");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					
					paramMap.put("sc_group_seq", "7");
					List<CodeVo> dList = CodeDao.CodeList(paramMap);
					model.put("dList", dList);
					
					UserVo.setSu_birth(today);
					UserVo.setSu_join_date(today);
					model.put("UserVo", UserVo);
					model.put("menutitle", "사용자 등록" );
				}	
				else if(viewName.equals("userUpdate"))
				{
					paramMap.put("sc_group_seq", "1");
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					paramMap.put("sc_group_seq", "2");
					List<CodeVo> rList = CodeDao.CodeList(paramMap);
					model.put("rList", rList);
					paramMap.put("sc_group_seq", "3");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);					
					model.put("jList", jList);
					paramMap.put("sc_group_seq", "7");
					List<CodeVo> dList = CodeDao.CodeList(paramMap);
					model.put("dList", dList);
					
					viewName = "userInsert";
					UserVo = UserDao.getUser(Integer.parseInt(seq));
					
				 	paramMap.put("f_data_seq",seq+"");
					paramMap.put("f_menu_name","UserFile" );
					List<UtilVo> fileList = UtilDao.FileList(paramMap);
					UserVo.setFilelist(fileList);
					model.put("UserVo", UserVo);
					
					model.put("fileList", fileList );
					
					model.put("menutitle", "사용자 수정" );
					
					
				}else if(viewName.equals("userStats"))
				{
					paramMap.put("use_yn", "Y");
					List<UserVo> List = UserDao.UserList(paramMap);
					List<UserVo> sList = UserDao.UserStats(paramMap);
					
					model.put("List", List);
					model.put("sList", sList);
					model.put("menutitle", "직원 통계" );
					model.put("menu_auth", "2");
				}
				
				
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    } 

		model.put("menu_name","UserFile" );
		 //메뉴 권한 확인을 위해 값 입력
		model.put("path", path );
		
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	
	
	private FileOutputStream fos;
	
	@RequestMapping(value = "/userInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView userInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    Map insertMap = new HashMap();
	    Map FileMap = new HashMap();
	    insertMap = paramMap;
	    String root = "C:\\_workplace_sts\\test\\src\\main\\webapp\\";
	    //String root = request.getSession().getServletContext().getRealPath("/resources");
	    System.out.println("root = "+root);
	    
	    model.put("menu_auth", "8"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
		try {
			
        	
        	/* 업무,업무권한은 배열로 받아서 | 넣어서 다시 insert */            
        	String su_job="";
        	String su_menu_auth="";
            String[] tmp_job = request.getParameterValues("su_job");
            for(int i=0;i<tmp_job.length;i++)
            {
            	su_job = su_job+tmp_job[i]+"|";
            }
            String[] tmp_menu_auth = request.getParameterValues("su_menu_auth");
            for(int i=0;i<tmp_menu_auth.length;i++)
            {
            	su_menu_auth = su_menu_auth+tmp_menu_auth[i]+"|";
            }
            insertMap.put("su_job",su_job);
            insertMap.put("su_menu_auth",su_menu_auth);
            
            UserDao.userInsert(insertMap);
            resultCheck =  Integer.parseInt(insertMap.get("su_seq").toString());
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userInsert");				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "UserFile");
				FileMap.put("f_data_seq", resultCheck+"");
				FileMap.put("check", "1");
				
				UtilDao.FileUpdate(FileMap);
				
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userList");
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
	
	@RequestMapping(value = "/userUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView userUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    Map FileMap = new HashMap();
	    
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "8"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
		
			/* 업무,업무권한은 배열로 받아서 | 넣어서 다시 insert */            
			String su_job="";
			String su_menu_auth="";
			String[] tmp_job = request.getParameterValues("su_job");
			for(int i=0;i<tmp_job.length;i++)
			{
				su_job = su_job+tmp_job[i]+"|";
			}
			String[] tmp_menu_auth = request.getParameterValues("su_menu_auth");
			for(int i=0;i<tmp_menu_auth.length;i++)
			{
				su_menu_auth = su_menu_auth+tmp_menu_auth[i]+"|";
			}
			paramMap.put("su_job",su_job);
			paramMap.put("su_menu_auth",su_menu_auth);
			
			paramMap.put("su_seq", seq);
			resultCheck = UserDao.userUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "UserFile");
				FileMap.put("f_data_seq", seq+"");
				UtilDao.FileUpdate(FileMap);
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userList");
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
	
	
	
	@RequestMapping(value = "/userPasswordUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView userPasswordUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    Map FileMap = new HashMap();
	    
	    String su_id = request.getParameter("su_id");
	    String su_password = request.getParameter("su_password");
	    
	    int resultCheck=0;
	    
		try {
			
			paramMap.put("su_id", su_id);
			paramMap.put("su_password", su_password);
			resultCheck = UserDao.userPasswordUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/main.joil");				
			}
			else //성공시
			{	
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/main.joil");
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
	
	
	@RequestMapping(value = "/code.joil")
	public ModelAndView CodeList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		String seq = request.getParameter("seq");
		CodeVo CodeVo = new CodeVo();
		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		String search_word = request.getParameter("search_word");
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		try {	
				if(viewName.equals("codeList"))
				{
					
					paramMap.put("search_word", search_word);
					int totalCount = CodeDao.getTotalCount(paramMap);
			        Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			        pageNo = (pageNo-1)*pageSize;
			        
			        paramMap.put("pageNo",pageNo+"" );
			        paramMap.put("pageSize",pageSize+"" );
				    List<CodeVo> List = CodeDao.CodeList(paramMap);
				    model.put("totalCount", totalCount);
				    model.put("search_word", search_word);
				    model.put("List", List);
				    model.put("paging", paging);
				    model.put("menutitle", "코드목록" );
				}
				else if(viewName.equals("codeInsert"))
				{	
					model.put("CodeVo", CodeVo);
					model.put("menutitle", "코드 등록" );
				}			
				else if(viewName.equals("codeUpdate"))
				{
					viewName = "codeInsert";
					CodeVo = CodeDao.getCode(Integer.parseInt(seq));
					
					model.put("CodeVo", CodeVo);
					model.put("menutitle", "코드 수정" );
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
	
	
	@RequestMapping(value = "/codeInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			
			resultCheck = CodeDao.codeInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeList");
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
	
	
	@RequestMapping(value = "/codeUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			paramMap.put("sc_seq", seq);
			resultCheck = CodeDao.codeUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeList");
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
	
	@RequestMapping(value = "/codeDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView codeDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			
			resultCheck = CodeDao.codeDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/code.joil?menuname=codeList");
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
	
	
	
	
	
	@RequestMapping(value = "/userDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView userDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();	    
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "99"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
		try {
			
			resultCheck = UserDao.userDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/user.joil?menuname=userList");
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
	
	
	
	
	
	
	
	//프린트
	@RequestMapping(value = "/forPrint.joil")
	public ModelAndView forPrint(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		//가로세로는 값 받아서 하자.
		String print_html = request.getParameter("print_html");
		String PrintVal = request.getParameter("PrintVal");
		if(PrintVal.equals("") || PrintVal.equals(null))
		{
			PrintVal = "0";
		}
		else
		{
			PrintVal = "1";
		}
		try {			 
				model.put("print_html", print_html);
				model.put("PrintVal", PrintVal);
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }

		mnv.setViewName("forPrint");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	
	
	
	
}
