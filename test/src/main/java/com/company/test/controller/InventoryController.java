package com.company.test.controller;

import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.company.test.dao.InventoryDao;
import com.company.test.vo.InventoryVo;
import com.company.test.vo.Paging;
import com.company.test.vo.UtilVo;





@Controller
public class InventoryController {
		
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	@Autowired
	private InventoryDao InventoryDao;
	
	@RequestMapping(value = "/Inventory.joil")
	public ModelAndView Inventory(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		
  		String tmp_search_date = request.getParameter("tmp_search_date");
  		String tmp_search_word = request.getParameter("tmp_search_word");
  		
  		InventoryVo InventoryVo = new InventoryVo();
  		
		try {	
				if(viewName.equals("InventoryList"))				
				{
				    
					paramMap.put("tmp_search_date", tmp_search_date);
					paramMap.put("tmp_search_word", tmp_search_word);
					List<InventoryVo> List = InventoryDao.InventoryList(paramMap);
				    
									    
				    for(int i=0;i<List.size();i++)
				    {
				    	paramMap.put("ide_il_seq",List.get(i).getIl_seq()+"");
						List<InventoryVo> detailList = InventoryDao.InventoryDetailList(paramMap);
				    	List.get(i).setDetailList(detailList);
				    	//System.out.println(" "+i+" =  "+List.get(i).getFilelist());
				    }
				    model.put("search_date", tmp_search_date);
				    model.put("search_word", tmp_search_word);
				    model.put("List", List);
				    model.put("menutitle", "재고 관리" ); 
				}
							
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "4"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/InventoryInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView InventoryInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "4"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = InventoryDao.InventoryInsertProc(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
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
	
	
	
	@RequestMapping(value = "/InventoryDetailInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView InventoryDetailInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "4"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = InventoryDao.InventoryDetailInsertProc(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
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
	
	
	@RequestMapping(value = "/InventoryUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView InventoryUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "4"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			paramMap.put("abe_seq", seq);
			resultCheck = InventoryDao.InventoryUpdate(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
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
	
	
	
	@RequestMapping(value = "/InventoryDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView WorkDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    String seq = request.getParameter("il_seq");
	    model.put("menu_auth", "4"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultDetailCheck=0;
	    int resultCheck=0;
	    
		try {
			paramMap.put("il_seq", seq);
			
			
			resultDetailCheck = InventoryDao.InventoryDetailDelete(Integer.parseInt(seq));
			if(resultDetailCheck==0 || resultDetailCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Inventory.joil?menuname=InventoryList");
			}
			else
			{
				resultCheck = InventoryDao.InventoryDelete(Integer.parseInt(seq));
				
				if(resultDetailCheck==0 || resultDetailCheck <0) //실패시
				{
					model.put("message", "삭제에 실패하였습니다.");
					model.put("result", "alertgo");
					model.put("href", "/Inventory.joil?menuname=InventoryList");
				}			
				else //성공시
				{
					model.put("message", "삭제 하였습니다.");
					model.put("result", "alertgo");
					model.put("href", "/Inventory.joil?menuname=InventoryList");
				}
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
