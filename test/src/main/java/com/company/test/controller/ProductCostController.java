package com.company.test.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;


import com.company.test.vo.ProductCostVo;

import com.company.test.vo.UserVo;

import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.vo.ItemVo;
import com.company.test.vo.Paging;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.dao.ItemDao;
import com.company.test.vo.ProductCostVo;
import com.company.test.dao.ProductCostDao;


@Controller
public class ProductCostController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductCostController.class);
	
	@Autowired
	private ProductCostDao ProductCostDao;
	@Autowired
	private CodeDao CodeDao;
	@Autowired
	private EnterpriseDao EnterpriseDao;
	@Autowired
	private ItemDao ItemDao;
	
	
	
	@RequestMapping(value = "/ProductCost.joil")
	public ModelAndView ProductCostList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		ProductCostVo ProductCostVo = new ProductCostVo();
  		
  		Date today = new Date();
  		String path = request.getRequestURI().substring(request.getContextPath().length());
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
  		Date to = null;
  		Map<String,String> codeMap = new HashMap(); 
  		
  		String search_date = request.getParameter("search_date");
  		String search_word = request.getParameter("search_word");
  		model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력		
  		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
	
		try {	
				if(viewName.equals("ProductCostList"))  
				{
					paramMap.put("use_yn", "Y");
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체 목록
					model.put("EList", EList);
					
					paramMap.put("search_date", search_date);
					paramMap.put("search_word", search_word);
					
					model.put("search_date",search_date );
					model.put("search_word",search_word );
					int totalCount = ProductCostDao.getProductCostCount(paramMap);
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
				    paramMap.put("totalCount", totalCount+"");
				    paramMap.put("paging", paging+"");
				  
					model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_date", search_date);
					
					
					List<ProductCostVo> List = ProductCostDao.ProductCostList(paramMap);
				    model.put("List", List);
				    model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);
				    model.put("menutitle", "품목 목록" );
				    
				    
				}else if(viewName.equals("ProductCostInsert"))
				{
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체 목록
					model.put("EList", EList);
					ProductCostVo.setPl_date(today);		
					model.put("ProductCostVo", ProductCostVo);
					model.put("menutitle", "원가 등록" );
				}else if(viewName.equals("ProductCostUpdate"))
				{
					
					viewName = "ProductCostInsert";
					ProductCostVo = ProductCostDao.getProductCost(Integer.parseInt(seq)); 
							
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체 목록
					model.put("EList", EList);
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					model.put("ProductCostVo", ProductCostVo);
					model.put("menutitle", "원가 수정" );
				}else if(viewName.equals("ProductCostBook"))
				{
					paramMap.put("use_yn", "Y");
					String enterprise = (request.getParameter("enterprise") == null)? "1":request.getParameter("enterprise");
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체 목록
					model.put("EList", EList);
					paramMap.put("pi_e_seq", enterprise);
					List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
					model.put("enterprise", enterprise);
				    model.put("List", List);
					model.put("PrintCheck", "ProductCostBook");
					model.put("menutitle", "원가 대장" );
				}
				else if(viewName.equals("ProductCostStats"))
				{
					
					String process_group = request.getParameter("process_group");
					String ow_group = request.getParameter("ow_group");
					String ow_group_detail = request.getParameter("ow_group_detail");
					paramMap.put("process_group", process_group);
					paramMap.put("ow_group", ow_group);
					paramMap.put("ow_group_detail", ow_group_detail);
										
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999999");
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					int totalCount = ProductCostDao.getProductCostCount(paramMap);
					model.put("totalCount", totalCount);
					model.put("process_group",process_group );
					model.put("ow_group",ow_group );
					model.put("ow_group_detail",ow_group_detail );
					
					
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
					model.put("totalCount", totalCount);
					model.put("paging", paging);
					
					List<ProductCostVo> List = ProductCostDao.ProductCostList(paramMap);
				    model.put("List", List);
					
					
					model.put("menutitle", "원가 검색" );
				}
				else if(viewName.equals("ProductCostChart"))
				{
					paramMap.put("use_yn", "Y");
					List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
				    model.put("List", List);
				    model.put("ListSize", List.size());
					model.put("menutitle", "원가 통계" );
				}
				else if(viewName.equals("CostStandard"))
				{
					
					model.put("PrintCheck", "CostStandard");
					model.put("menutitle", "외주매입 투입예산" );
				}
				else if(viewName.equals("ProductCostDetail"))
				{
					List<ItemVo> IList = ItemDao.ItemList(paramMap);
					model.put("IList", IList );
					model.put("menutitle", "원가 상세" );
				}
				
				
				
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/ProductCostInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView ProductCostInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		String tmp_pl_amount = request.getParameter("pl_amount");
		String pl_price = request.getParameter("pl_price");
		pl_price = pl_price.replace(",", "");
		paramMap.put("pl_price", pl_price+"");
		
		int pl_amount = Integer.parseInt(tmp_pl_amount);
		if(pl_amount == 0)
		{
			pl_amount = 1;
		}
		
		try {
			paramMap.put("pl_amount", pl_amount+"");
			resultCheck = ProductCostDao.ProductCostInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostList");
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
	
	
	@RequestMapping(value = "/ProductCostUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView ProductCostUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	   
	    int resultCheck=0;
		String pl_price = request.getParameter("pl_price");
		pl_price = pl_price.replace(",", "");
		paramMap.put("pl_price", pl_price+"");
		try {
			paramMap.put("pl_seq", seq);
		
			resultCheck = ProductCostDao.ProductCostUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostList");
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
	
	@RequestMapping(value = "/ProductCostDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView ProductCostDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = ProductCostDao.ProductCostDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/ProductCost.joil?menuname=ProductCostList");
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
	
	
	
	

	
	
	@RequestMapping(value = "/forSales.joil" , method = {RequestMethod.GET,RequestMethod.POST})	
	public ModelAndView forSales(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();
		
		String tmp_seq = (request.getParameter("seq") == null)? "0":request.getParameter("seq");
		int seq= Integer.parseInt(tmp_seq);
		
		try {
			paramMap.put("use_yn", "Y");
			List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
			model.put("EList", EList);
			
			paramMap.put("pageNo", "0");
			paramMap.put("pageSize", "99999");
			List<ItemVo> IList = ItemDao.ItemList(paramMap);
			model.put("IList", IList);
			
			paramMap.put("pi_seq", seq+"");
			List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
			model.put("List", List);
			
		} catch (SQLException e) {
			StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
		} 
		
		/*
		model.put("path", path );
        model.put("result", "onlygo");
        model.put("message", "");
        model.put("href", "/");
        */
		model.put("title", "구매/영업" );
		mnv.setViewName("forSales");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	
	
	@RequestMapping(value = "/ForSalesUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView ForSalesUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    
	    String seq = request.getParameter("seq");
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("pi_seq", seq);
		
			resultCheck = ProductCostDao.ForSalesUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/forSales.joil?seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/forSales.joil?seq="+paramMap.get("seq"));
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
	
	
	
	@RequestMapping(value = "/forSalesGraph.joil" , method = {RequestMethod.GET,RequestMethod.POST})	
	public ModelAndView forSalesGraph(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();
		
		String tmp_seq = (request.getParameter("seq") == null)? "0":request.getParameter("seq");
		int seq= Integer.parseInt(tmp_seq);
		
		//String pi_e_code = (request.getParameter("pi_e_code") == null)? "":request.getParameter("pi_e_code");
		
		
		try {
			paramMap.put("use_yn", "Y");
			List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
			model.put("EList", EList);
			
			paramMap.put("pageNo", "0");
			paramMap.put("pageSize", "99999");
			List<ItemVo> IList = ItemDao.ItemList(paramMap);
			model.put("IList", IList);
						
			paramMap.put("pi_seq", seq+"");
			List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
			model.put("List", List);
			
		} catch (SQLException e) {
			StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
		} 
		
		/*
		model.put("path", path );
        model.put("result", "onlygo");
        model.put("message", "");
        model.put("href", "/");
        */
		model.put("title", "구매/영업" );
		mnv.setViewName("forSalesGraph");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	

	
	@RequestMapping(value = "/forSQ.joil" , method = {RequestMethod.GET,RequestMethod.POST})	
	public ModelAndView forSQ(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		Map model = new HashMap();
		
		String tmp_seq = (request.getParameter("seq") == null)? "0":request.getParameter("seq");
		int seq= Integer.parseInt(tmp_seq);
		
		//String pi_e_code = (request.getParameter("pi_e_code") == null)? "":request.getParameter("pi_e_code");
		
		
		try {
			paramMap.put("use_yn", "Y");
			List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
			model.put("EList", EList);
			
			paramMap.put("pageNo", "0");
			paramMap.put("pageSize", "99999");
			List<ItemVo> IList = ItemDao.ItemList(paramMap);
			model.put("IList", IList);
						
			paramMap.put("pi_seq", seq+"");
			List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
			model.put("List", List);
			
		} catch (SQLException e) {
			StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
		} 
		
		/*
		model.put("path", path );
        model.put("result", "onlygo");
        model.put("message", "");
        model.put("href", "/");
        */
		model.put("title", "구매/영업" );
		mnv.setViewName("forSQ");
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	 @RequestMapping(value = "/forExcelProductCostBook.joil")
	 protected void buildExcelDocument(Map<String, Object> model,
	   HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap)
	   throws Exception {
		int total_row=0;
		
		
		paramMap.put("use_yn", "Y");
		String enterprise = (request.getParameter("enterprise") == null)? "1":request.getParameter("enterprise");
		
		List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체 목록
		model.put("EList", EList);
		paramMap.put("pi_e_seq", enterprise);
		List<ProductCostVo> List = ProductCostDao.ProductCostBook(paramMap);
		
		
		ArrayList array67 = new ArrayList(); //원재료
		array67.add("67");					
		Map Map67 = new HashMap();
		Map67.put("pl_sc_seq", array67);
		
		
		List<ProductCostVo> List67 = ProductCostDao.ProductBuyBook(Map67);
		int tmp=ProductCostDao.getProductRows(Map67);
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
			   
			   
			   cell = headerRow.createCell(0); cell.setCellValue("제번");
			   cell = headerRow.createCell(1); cell.setCellValue("ITEMS"); 
			   cell = headerRow.createCell(2); cell.setCellValue("수주가격"); 
			   cell = headerRow.createCell(3); cell.setCellValue("구분"); 
			   cell = headerRow.createCell(4); cell.setCellValue("원재료"); 
			   cell = headerRow.createCell(5); cell.setCellValue("표준,구매품"); 
			   cell = headerRow.createCell(6); cell.setCellValue("소계");
			   cell = headerRow.createCell(7); cell.setCellValue("외주설계");
			   cell = headerRow.createCell(8); cell.setCellValue("ASSY형상");
			   cell = headerRow.createCell(9); cell.setCellValue("면삭,제관");
			   cell = headerRow.createCell(10); cell.setCellValue("선반");
			   cell = headerRow.createCell(11); cell.setCellValue("밀링");
			   cell = headerRow.createCell(12); cell.setCellValue("와이어");
			   cell = headerRow.createCell(13); cell.setCellValue("MCT");
			   cell = headerRow.createCell(14); cell.setCellValue("연마");
			   cell = headerRow.createCell(15); cell.setCellValue("블록");
			   cell = headerRow.createCell(16); cell.setCellValue("열,표면처리");
			   cell = headerRow.createCell(17); cell.setCellValue("기타가공");
			   cell = headerRow.createCell(18); cell.setCellValue("조립작업");
			   cell = headerRow.createCell(19); cell.setCellValue("트라이아웃");
			   cell = headerRow.createCell(20); cell.setCellValue("가공비합계");
			   cell = headerRow.createCell(21); cell.setCellValue("제조원가");
			   cell = headerRow.createCell(21); cell.setCellValue("매입률");
			  
			   
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


	
	
	
	@RequestMapping(value = "/forSalesDetailPopup.joil" , method = RequestMethod.POST)
	public ModelAndView forSalesDetailPopup(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		
		Map resultMap = new HashMap();
		
		String pl_pi_seq  = request.getParameter("pl_pi_seq");
		String pl_sc_seq  = request.getParameter("pl_sc_seq");
		
		try {
			paramMap.put("pl_pi_seq",pl_pi_seq+"" );
			paramMap.put("pl_sc_seq",pl_sc_seq+"" );
			List<ProductCostVo> List = ProductCostDao.forSalesDetailPopup(paramMap);
			
			resultMap.put("List", List);
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
	
	
	
	
	
	
	
	

