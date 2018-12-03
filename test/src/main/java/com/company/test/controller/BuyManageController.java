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

import com.company.test.dao.BuyManageDao;
import com.company.test.dao.BuyDao;
import com.company.test.dao.CodeDao;
import com.company.test.vo.BuyManageVo;
import com.company.test.vo.BuyVo;
import com.company.test.vo.Paging;
import com.company.test.vo.CodeVo;
import com.company.test.vo.ProductCostVo;
import com.company.test.dao.ProductCostDao;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.springframework.web.servlet.view.document.AbstractExcelView;


@Controller
public class BuyManageController extends AbstractExcelView{
	
	

	
	private static final Logger logger = LoggerFactory.getLogger(BuyManageController.class);
	
	@Autowired
	private BuyManageDao BuyManageDao;

	@Autowired
	private BuyDao BuyDao;
	
	@Autowired
	private CodeDao CodeDao;

	@Autowired
	private ProductCostDao ProductCostDao;
	
	@RequestMapping(value = "/BuyManage.joil")
	public ModelAndView BuyManage(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		String search_group = request.getParameter("search_group");
  		String search_word = request.getParameter("search_word");
  		String search_enterprise = request.getParameter("search_enterprise");
  		String search_start_date = request.getParameter("search_start_date");
  		String search_end_date = request.getParameter("search_end_date");
  		BuyManageVo BuyManageVo = new BuyManageVo();
  		BuyVo BuyVo = new BuyVo();
  		Date today = new Date();
  		String path = request.getRequestURI().substring(request.getContextPath().length());
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
  		DecimalFormat df = new DecimalFormat("00");
  		Date to = null;
		
  		Calendar currentCalendar = Calendar.getInstance();
  		String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
  		String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
  		
  		model.put("today", strYear);
  		model.put("month", strMonth);
  		
  		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		
		try {	
				if(viewName.equals("BuyEnterPriseList"))				
				{
				    //List<ItemVo> List = BuyManageDao.ItemList(paramMap);
				    //model.put("List", List);
					paramMap.put("search_word", search_word);	
					int totalCount = BuyManageDao.getBuyManageCount(paramMap);
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
				    paramMap.put("totalCount", totalCount+"");
				    paramMap.put("paging", paging+"");
				  
				   
				    
				    List<BuyManageVo> List = BuyManageDao.BuyEnterPriseList(paramMap);
				    model.put("List", List);
				    model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);
					
				    model.put("menutitle", "매입 업체 관리" );
				    
				    Map<String,String> codeMap = new HashMap(); 
				    
				    codeMap.put("pageNo", "0");
				    codeMap.put("pageSize", "99999");
				    codeMap.put("sc_group_seq", "10");
					List<CodeVo> aList = CodeDao.CodeList(codeMap);
					model.put("aList", aList);
				    
				}
				else if(viewName.equals("BuyEnterPriseInsert"))
				{
					paramMap.put("pageNo", "0");
					paramMap.put("pageSize", "99999");
					paramMap.put("sc_group_seq", "10");
					List<CodeVo> aList = CodeDao.CodeList(paramMap);
					model.put("aList", aList);
					
					model.put("BuyManageVo", BuyManageVo);
					model.put("menutitle", "매입 업체 등록" );
					
				}else if(viewName.equals("BuyEnterPriseUpdate"))
				{
					BuyManageVo = BuyManageDao.getBuyManage(Integer.parseInt(seq));
					
					paramMap.put("pageNo", "0");
					paramMap.put("pageSize", "99999");
					paramMap.put("sc_group_seq", "10");
					List<CodeVo> aList = CodeDao.CodeList(paramMap);
					model.put("aList", aList);
					
					viewName = "BuyEnterPriseInsert";
					model.put("BuyManageVo", BuyManageVo);
					model.put("menutitle", "매입 업체 수정" );
				}else if(viewName.equals("BuyList"))
				{						
					paramMap.put("search_enterprise", search_enterprise);
					paramMap.put("search_start_date", search_start_date);
					paramMap.put("search_end_date", search_end_date);
					paramMap.put("search_word", search_word);
					paramMap.put("search_group", search_group);
					
					model.put("search_enterprise",search_enterprise);
					model.put("search_start_date",search_start_date);
					model.put("search_end_date",search_end_date);
					model.put("search_group",search_group);
					
					int totalCount = BuyDao.getBuyCount(paramMap);
					
					Paging paging = new Paging();
			        
					pageSize = 15;
			        paging.setPageNo(pageNo);
			        paging.setPageSize(15);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
				    paramMap.put("totalCount", totalCount+"");
				    paramMap.put("paging", paging+"");
				  
				    
				    List<BuyVo> List = BuyDao.BuyList(paramMap);
				    model.put("List", List);
				    model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);					
					model.put("menutitle", "매입 목록" );
					
					Map<String,String> codeMap = new HashMap(); 
					
					codeMap.put("pageNo", "0");
					codeMap.put("pageSize", "99999");
					codeMap.put("sc_group_seq", "10");
					List<CodeVo> aList = CodeDao.CodeList(codeMap);
					model.put("aList", aList);
					
				}	
				else if(viewName.equals("BuyBook"))
				{
					
					String tmp_start_date = request.getParameter("start_date");
					String tmp_end_date = request.getParameter("end_date");
					
					ArrayList array67 = new ArrayList(); //원재료
					array67.add("67");					
					Map Map67 = new HashMap();
					Map67.put("pl_sc_seq", array67);
					
					Map67.put("start_date", tmp_start_date);
					Map67.put("end_date", tmp_end_date);
					List<ProductCostVo> List67 = ProductCostDao.ProductBuyBook(Map67);
					int tmp=ProductCostDao.getProductRows(Map67);
					model.put("List67_row", tmp);
					model.put("List67", List67);
					
					ArrayList array68 = new ArrayList(); //표준품
					array68.add("68");					
					Map Map68 = new HashMap();
					Map68.put("pl_sc_seq", array68);
					Map68.put("start_date", tmp_start_date);
					Map68.put("end_date", tmp_end_date);
					List<ProductCostVo> List68 = ProductCostDao.ProductBuyBook(Map68);
					tmp=ProductCostDao.getProductRows(Map68);
					model.put("List68_row", tmp);
					model.put("List68", List68);
					
					ArrayList array91 = new ArrayList(); //부자재
					array91.add("91");					
					Map Map91 = new HashMap();
					Map91.put("pl_sc_seq", array91);
					Map91.put("start_date", tmp_start_date);
					Map91.put("end_date", tmp_end_date);
					List<ProductCostVo> List91 = ProductCostDao.ProductBuyBook(Map91);
					tmp=ProductCostDao.getProductRows(Map91);
					model.put("List91_row", tmp);
					model.put("List91", List91);
					
					ArrayList array7078 = new ArrayList(); //외주가공비
					array7078.add("70");
					array7078.add("71");
					array7078.add("72");
					array7078.add("73");
					array7078.add("74");
					array7078.add("75");
					array7078.add("76");
					array7078.add("77");
					array7078.add("78");
					array7078.add("85");
					Map Map7078 = new HashMap();
					Map7078.put("pl_sc_seq", array7078);
					Map7078.put("start_date", tmp_start_date);
					Map7078.put("end_date", tmp_end_date);
					List<ProductCostVo> List7078 = ProductCostDao.ProductBuyBook(Map7078);
					tmp=ProductCostDao.getProductRows(Map7078);
					model.put("List7078_row", tmp);
					model.put("List7078", List7078);
					
					ArrayList array69 = new ArrayList(); //설계비
					array69.add("69");					
					Map Map69 = new HashMap();
					Map69.put("pl_sc_seq", array69);
					Map69.put("start_date", tmp_start_date);
					Map69.put("end_date", tmp_end_date);
					List<ProductCostVo> List69 = ProductCostDao.ProductBuyBook(Map69);
					tmp=ProductCostDao.getProductRows(Map69);
					model.put("List69_row", tmp);
					model.put("List69", List69);
					
					
					
					Map Map88 = new HashMap(); //관리비
					Map88.put("abe_group", "88");
				
					Map88.put("start_date", tmp_start_date);
					Map88.put("end_date", tmp_end_date);
					List<BuyVo> List88 = BuyDao.BuyBook(Map88);
					tmp=BuyDao.getBuyRows(Map88);
					model.put("List88_row", tmp);
					model.put("List88", List88);
					
					
					Map Map89 = new HashMap();  //투자비
					Map89.put("abe_group", "89");
					Map89.put("start_date", tmp_start_date);
					Map89.put("end_date", tmp_end_date);		
					List<BuyVo> List89 = BuyDao.BuyBook(Map89);
					tmp=BuyDao.getBuyRows(Map89);
					model.put("List89_row", tmp);
					model.put("List89", List89);
					
					
					
					Map Map90 = new HashMap(); //기타
					Map90.put("abe_group", "90");
				
					Map90.put("start_date", tmp_start_date);
					Map90.put("end_date", tmp_end_date);
					List<BuyVo> List90 = BuyDao.BuyBook(Map90);
					tmp=BuyDao.getBuyRows(Map90);
					model.put("List90_row", tmp);
					model.put("List90", List90);
					
					model.put("PrintVal", "1");
					model.put("PrintCheck", "BuyBook");
					model.put("menutitle", "매입 대장" );
					
					model.put("start_date", tmp_start_date);
					model.put("end_date", tmp_end_date);
					model.put("menuname", viewName);
				}
				
				
					
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/BuyEnterPriseInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView BuyManageInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = BuyManageDao.BuyManageInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseList");
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
	
	
	@RequestMapping(value = "/BuyEnterPriseUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView BuyManageUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			paramMap.put("abe_seq", seq);
			resultCheck = BuyManageDao.BuyManageUpdate(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseUpdate&seq="+seq);
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseList");
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
	
	
	
	@RequestMapping(value = "/BuyEnterPriseDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView WorkDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			paramMap.put("abe_seq", seq);
			resultCheck = BuyManageDao.BuyManageDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyEnterPriseList");
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
	
	
	
	
	
	
	@RequestMapping(value = "/BuyInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView BuyInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = BuyDao.BuyInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyList");
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
	
	
	@RequestMapping(value = "/BuyUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView BuyUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    	    
	    String ab_seq = request.getParameter("update_ab_seq");
	    String ab_buy_name = request.getParameter("update_ab_buy_name");
	    String ab_price = request.getParameter("update_ab_price");
	    ab_price = ab_price.replaceAll(",", "");
	    String ab_amount = request.getParameter("update_ab_amount");
	    ab_amount = ab_amount.replaceAll(",", "");
	    String ab_sum = request.getParameter("update_ab_sum");
	    ab_sum = ab_sum.replaceAll(",", "");
	    String ab_sum_vat = request.getParameter("update_ab_sum_vat");
	    ab_sum_vat = ab_sum_vat.replaceAll(",", "");
	    String ab_date = request.getParameter("update_ab_date");
	    
	    int resultCheck=0;
	    
		try {
			paramMap.put("ab_seq", ab_seq);
			paramMap.put("ab_buy_name", ab_buy_name);
			paramMap.put("ab_price", ab_price);
			paramMap.put("ab_amount", ab_amount);
			paramMap.put("ab_sum", ab_sum);
			paramMap.put("ab_sum_vat", ab_sum_vat);
			paramMap.put("ab_date", ab_date);
			resultCheck = BuyDao.BuyUpdate(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyList");
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyList");
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
	
	
	
	@RequestMapping(value = "/BuyDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView BuyDelete(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "7"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			paramMap.put("ab_seq", seq);
			resultCheck = BuyDao.BuyDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyList");
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/BuyManage.joil?menuname=BuyList");
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
	
	
	
	
	
	@RequestMapping(value = "/getEnterPriseInfo.joil" , method = RequestMethod.POST)
	public ModelAndView getEnterPriseInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		
		Map resultMap = new HashMap();
		String abe_group = request.getParameter("ab_group");
		
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		try {
			paramMap.put("use_yn", "Y");
			paramMap.put("abe_group", abe_group);				
			paramMap.put("pageNo", "0");
			paramMap.put("pageSize", "99999");	
			
			List<BuyManageVo> eList = BuyManageDao.BuyEnterPriseList(paramMap);
			resultMap.put("eList", eList);
			
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
	
	
	
	@SuppressWarnings("unchecked")
	 @Override
	 @RequestMapping(value = "/forExcel.joil")
	 protected void buildExcelDocument(Map<String, Object> model,
	   HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
	   throws Exception {
		int total_row=0;
		String tmp_start_date = request.getParameter("start_date");
		String tmp_end_date = request.getParameter("end_date");
		
		
		
		
		ArrayList array67 = new ArrayList(); //원재료
		array67.add("67");					
		Map Map67 = new HashMap();
		Map67.put("pl_sc_seq", array67);
		
		Map67.put("start_date", tmp_start_date);
		Map67.put("end_date", tmp_end_date);
		List<ProductCostVo> List67 = ProductCostDao.ProductBuyBook(Map67);
		int tmp=ProductCostDao.getProductRows(Map67);
		total_row = total_row +tmp; //총 row수 카운트
				
		ArrayList array68 = new ArrayList(); //표준품
		array68.add("68");					
		Map Map68 = new HashMap();
		Map68.put("pl_sc_seq", array68);
		Map68.put("start_date", tmp_start_date);
		Map68.put("end_date", tmp_end_date);
		List<ProductCostVo> List68 = ProductCostDao.ProductBuyBook(Map68);
		tmp=ProductCostDao.getProductRows(Map68);
		total_row = total_row +tmp; //총 row수 카운트
		ArrayList array91 = new ArrayList(); //부자재
		array91.add("91");					
		Map Map91 = new HashMap();
		Map91.put("pl_sc_seq", array91);
		Map91.put("start_date", tmp_start_date);
		Map91.put("end_date", tmp_end_date);
		List<ProductCostVo> List91 = ProductCostDao.ProductBuyBook(Map91);
		tmp=ProductCostDao.getProductRows(Map91);
		total_row = total_row +tmp; //총 row수 카운트
		ArrayList array7078 = new ArrayList(); //외주가공비
		array7078.add("70");
		array7078.add("71");
		array7078.add("72");
		array7078.add("73");
		array7078.add("74");
		array7078.add("75");
		array7078.add("76");
		array7078.add("77");
		array7078.add("78");
		array7078.add("85");
		Map Map7078 = new HashMap();
		Map7078.put("pl_sc_seq", array7078);
		Map7078.put("start_date", tmp_start_date);
		Map7078.put("end_date", tmp_end_date);
		List<ProductCostVo> List7078 = ProductCostDao.ProductBuyBook(Map7078);
		tmp=ProductCostDao.getProductRows(Map7078);
		total_row = total_row +tmp; //총 row수 카운트
		ArrayList array69 = new ArrayList(); //설계비
		array69.add("69");					
		Map Map69 = new HashMap();
		Map69.put("pl_sc_seq", array69);
		Map69.put("start_date", tmp_start_date);
		Map69.put("end_date", tmp_end_date);
		List<ProductCostVo> List69 = ProductCostDao.ProductBuyBook(Map69);
		tmp=ProductCostDao.getProductRows(Map69);
		total_row = total_row +tmp; //총 row수 카운트
		Map Map88 = new HashMap(); //관리비
		Map88.put("abe_group", "88");	
		Map88.put("start_date", tmp_start_date);
		Map88.put("end_date", tmp_end_date);
		List<BuyVo> List88 = BuyDao.BuyBook(Map88);
		tmp=BuyDao.getBuyRows(Map88);
		total_row = total_row +tmp; //총 row수 카운트
		Map Map89 = new HashMap();  //투자비
		Map89.put("abe_group", "89");
		Map89.put("start_date", tmp_start_date);
		Map89.put("end_date", tmp_end_date);		
		List<BuyVo> List89 = BuyDao.BuyBook(Map89);
		tmp=BuyDao.getBuyRows(Map89);
		total_row = total_row +tmp; //총 row수 카운트
		Map Map90 = new HashMap(); //기타
		Map90.put("abe_group", "90");
		Map90.put("start_date", tmp_start_date);
		Map90.put("end_date", tmp_end_date);
		List<BuyVo> List90 = BuyDao.BuyBook(Map90);
		tmp=BuyDao.getBuyRows(Map90);
		total_row = total_row +tmp; //총 row수 카운트	
		
		
		 try{
			   HSSFRow row = null;
			   HSSFCell cell = null;
			   HSSFWorkbook wb = new HSSFWorkbook();			   
			   HSSFSheet sheet = wb.createSheet();
			   wb.setSheetName(0, "test");
			   HSSFCellStyle cs = wb.createCellStyle();
			   
			   HSSFDataFormat df = (HSSFDataFormat) wb.createDataFormat();
			   cs.setDataFormat(df.getFormat("#,###"));
			     
			   
			   

			   int cellCount = total_row;			   
			   
			   //모든건 0부터 시작
			   //제목들
			   HSSFRow headerRow = sheet.createRow((short)0);
			   
			   
			   cell = headerRow.createCell(0); cell.setCellValue("구분");
			   cell = headerRow.createCell(1); cell.setCellValue("업체명"); 
			   cell = headerRow.createCell(2); cell.setCellValue("주거래품목"); 
			   cell = headerRow.createCell(3); cell.setCellValue("공급가액"); 
			   cell = headerRow.createCell(4); cell.setCellValue("합계(VAT포함)"); 
			   cell = headerRow.createCell(5); cell.setCellValue("지급일"); 
			   cell = headerRow.createCell(6); cell.setCellValue("원가율");
			   cell = headerRow.createCell(7); cell.setCellValue("누계");
			  
			   
			   //여기서 부터 데이터 넣어야 돼.
			   int row_count = 1;
			   long excel_sum=0;
			   long excel_sum_vat=0;
			   long excel_total=0;
			   for(int i=0;i<List67.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("원재료"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List67.get(i).getOe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List67.get(i).getSc_name()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List67.get(i).getSum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List67.get(i).getSum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List67.get(i).getSum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List68.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("표준품"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List68.get(i).getOe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List68.get(i).getSc_name()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List68.get(i).getSum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List68.get(i).getSum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List68.get(i).getSum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			  		
			   
			   for(int i=0;i<List91.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("부자재"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List91.get(i).getOe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List91.get(i).getSc_name()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List91.get(i).getSum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List91.get(i).getSum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List91.get(i).getSum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List7078.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("외주가공비"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List7078.get(i).getOe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List7078.get(i).getSc_name()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List7078.get(i).getSum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List7078.get(i).getSum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List7078.get(i).getSum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List69.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("설계비"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List69.get(i).getOe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List69.get(i).getSc_name()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List69.get(i).getSum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List69.get(i).getSum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List69.get(i).getSum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List88.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("설계비"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List88.get(i).getAbe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List88.get(i).getAbe_main()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List88.get(i).getAb_sum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List88.get(i).getAb_sum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List88.get(i).getAb_sum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List89.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("투자비"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List89.get(i).getAbe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List89.get(i).getAbe_main()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List89.get(i).getAb_sum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List89.get(i).getAb_sum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List89.get(i).getAb_sum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   
			   for(int i=0;i<List90.size();i++)
			   {
				   row = sheet.createRow(row_count++); //이게 row 생성하는 구문
				   cell = row.createCell(0); //생성한 해당 row의 셀을 생성
				   cell.setCellValue("기타"); //그 셀에 데이터 삽입
				   cell = row.createCell(1); 
				   cell.setCellValue(List90.get(i).getAbe_name()); //업체명
				   cell = row.createCell(2); 
				   cell.setCellValue(List90.get(i).getAbe_main()); //주거래품목
				   cell = row.createCell(3); 
				   cell.setCellValue(List90.get(i).getAb_sum()); //공급가액
				   cell.setCellStyle(cs);
				   cell = row.createCell(4);
				   cell.setCellValue(List90.get(i).getAb_sum_vat()); //합계(VAT포함)
				   cell.setCellStyle(cs);
				   excel_sum_vat = excel_sum_vat + List90.get(i).getAb_sum_vat();
				   cell = row.createCell(5); 
				   cell.setCellValue(""); //지급일
				   cell = row.createCell(6); 
				   cell.setCellValue(""); //원가율
				   cell = row.createCell(7); 
				   cell.setCellValue(excel_sum_vat); //누계
				   cell.setCellStyle(cs);
			   }
			   //sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 4));	
			   //시작 행번호,마지막 행번호,시작 열번호,마지막 열번호
			   
			   //autuSizeColumn after setColumnWidth setting!!
			   for (int i=0;i<cellCount;i++)  
			   { 
			     sheet.autoSizeColumn(i);
			     sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+512 );
			   }
			   
			   response.setContentType("application/vnd.ms-excel;charset=utf-8");
			   response.setHeader("Content-Disposition", "attachment;filename=" +new String(("test").getBytes("KSC5601"),"8859_1")+".xls");
			   wb.write(response.getOutputStream());
			  }catch (Exception e) {
			   e.printStackTrace();
			  }
    }
 


		
	
	
	
	
	
	
}
