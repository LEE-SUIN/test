package com.company.test.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.vo.OutSideVo;
import com.company.test.vo.OutSideWorkVo;
import com.company.test.vo.UserVo;
import com.company.test.dao.OutSideDao;
import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.vo.ItemVo;
import com.company.test.vo.Paging;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.dao.ItemDao;
import com.company.test.vo.OutSideVo;
import com.company.test.dao.OutSideDao;


@Controller
public class OutSideController {
	
	private static final Logger logger = LoggerFactory.getLogger(OutSideController.class);
	
	@Autowired
	private OutSideDao OutSideDao;
	@Autowired
	private CodeDao CodeDao;
	@Autowired
	private EnterpriseDao EnterpriseDao;
	
	

	
	@RequestMapping(value = "/OutSide.joil")
	public ModelAndView OutSideList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		OutSideVo OutSideVo = new OutSideVo();
  		OutSideWorkVo OutSideWorkVo = new OutSideWorkVo();
  		Date today = new Date();
  		String path = request.getRequestURI().substring(request.getContextPath().length());
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
  		Date to = null;
  		Map<String,String> codeMap = new HashMap(); 
  		
  		String search_word = request.getParameter("search_word");
  		model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력		
  		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
	
		try {	
				if(viewName.equals("OutSideList"))  
				{
					codeMap.put("sc_group_seq", "8");
					codeMap.put("pageNo", "0");
					codeMap.put("pageSize", "99999");					
					List<CodeVo> jList = CodeDao.CodeList(codeMap);
					model.put("jList", jList);
					
					paramMap.put("search_word", search_word);			
					int totalCount = OutSideDao.getOutSideCount(paramMap);
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
					model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);
					
					
					List<OutSideVo> List = OutSideDao.OutSideList(paramMap);
				    model.put("List", List);
				    model.put("menutitle", "업체 목록" );
				    
				    
				}else if(viewName.equals("OutSideInsert"))
				{
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					
					model.put("OutSideVo", OutSideVo);
					
					model.put("menutitle", "업체 등록" );
				}else if(viewName.equals("OutSideUpdate"))
				{
					
					viewName = "OutSideInsert";
					OutSideVo = OutSideDao.getOutSide(Integer.parseInt(seq)); 
							
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					model.put("OutSideVo", OutSideVo);
					model.put("menutitle", "업체 수정" );
				}else if(viewName.equals("OutSideWorkList")) // 외주 가공 품목 관리
				{
					
					
					paramMap.put("search_word", search_word);			
					int totalCount = OutSideDao.getOutSideWorkCount(paramMap);
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
					model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);
					List<OutSideWorkVo> OutSideWorkList =  OutSideDao.OutSideWorkList(paramMap);					
					model.put("List", OutSideWorkList);
					
					codeMap.put("sc_group_seq", "8");
					codeMap.put("pageNo", "0");
					codeMap.put("pageSize", "99999");					
					List<CodeVo> jList = CodeDao.CodeList(codeMap); //원가 분류 코드
					model.put("jList", jList);
					
					model.put("menutitle", "가공 목록" );
				}else if(viewName.equals("OutSideWorkInsert")) 
				{
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
					model.put("EList", EList);
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					
					model.put("OutSideWorkVo", OutSideWorkVo);
					
					model.put("menutitle", "가공 등록" );
				}else if(viewName.equals("OutSideWorkUpdate"))
				{
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
					model.put("EList", EList);
					viewName = "OutSideWorkInsert";
					OutSideWorkVo = OutSideDao.getOutSideWork(Integer.parseInt(seq)); 
							
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					
					paramMap.put("sc_group_seq", "8");
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					model.put("OutSideWorkVo", OutSideWorkVo);
					model.put("menutitle", "가공 수정" );
				}else if(viewName.equals("OutSideStats"))
				{
					paramMap.put("pageNo","0");
					paramMap.put("pageSize","99999");
					List<OutSideVo> List = OutSideDao.OutSideList(paramMap);
					
					List<OutSideVo> oList = OutSideDao.OutSideStats(paramMap);
					
				    model.put("List", List);
				    model.put("oList", oList);
				    model.put("menuname", "OutSideStats");
				    
					model.put("menutitle", "외주 업체 통계" );
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
	
	
	@RequestMapping(value = "/OutSideInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		
		String[] tmp_oe_items = request.getParameterValues("oe_items");
	    String oe_items="";
        for(int i=0;i<tmp_oe_items.length;i++)
        {
        	oe_items = oe_items+tmp_oe_items[i]+"|";
        }
	    paramMap.put("oe_items", oe_items);
		
		try {
		
			
			resultCheck = OutSideDao.OutSideInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideList");
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
	
	
	@RequestMapping(value = "/OutSideUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    	    
	    String[] tmp_oe_items = request.getParameterValues("oe_items");
	    String oe_items="";
        for(int i=0;i<tmp_oe_items.length;i++)
        {
        	oe_items = oe_items+tmp_oe_items[i]+"|";
        }
	    paramMap.put("oe_items", oe_items);
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("oe_seq", seq);
			paramMap.put("oe_items", oe_items);
			resultCheck = OutSideDao.OutSideUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideList");
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
	
	@RequestMapping(value = "/OutSideDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = OutSideDao.OutSideDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideList");
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
	
	
	
	
	//가공 분류 선택시 그룹 존재하는지 체크.있으면 list 반환
	@RequestMapping(value = "/getOutSideGroupInfo.joil" , method = RequestMethod.POST)
	public ModelAndView getOutSideGroupInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		Map resultMap = new HashMap();
		String seq = request.getParameter("ow_sc_seq");
		
		Map<String,String> codeMap = new HashMap();
		try {
			codeMap.put("sc_int_etc1", seq);
			codeMap.put("pageNo", "0");
			codeMap.put("pageSize", "99999");					
			List<CodeVo> gList = CodeDao.CodeList(codeMap);
			resultMap.put("gList", gList);

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
	
	
	//가공 종류 선택시 그룹 존재하는지 체크.있으면 list 반환
		@RequestMapping(value = "/getOutSideGroupDetailInfo.joil" , method = RequestMethod.POST)
		public ModelAndView getOutSideGroupDetailInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
			ModelAndView mnv = new ModelAndView();
			Map resultMap = new HashMap();
			String seq = request.getParameter("pl_ow_group");
			
			Map<String,String> codeMap = new HashMap();
			try {
				
				codeMap.put("pageNo", "0");
				codeMap.put("pageSize", "99999");
				codeMap.put("ow_group", seq);
				List<OutSideWorkVo> dList =  OutSideDao.OutSideWorkList(codeMap);
				resultMap.put("dList", dList);
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
	
	
	
		
		//가공 분류 선택시 해당 하는 업체 목록. list 반환
		@RequestMapping(value = "/getOutSideEnterPrise.joil" , method = RequestMethod.POST)
		public ModelAndView getOutSideEnterPrise(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
			ModelAndView mnv = new ModelAndView();
			Map resultMap = new HashMap();
			String seq = request.getParameter("oe_items");
			
			Map<String,String> codeMap = new HashMap();
			try {
				
				
				codeMap.put("pl_oe_items", seq);
				List<OutSideVo> oeList =  OutSideDao.OutSideEnterPrise(codeMap);
				resultMap.put("oeList", oeList);
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
		
	
	@RequestMapping(value = "/OutSideWorkInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideWorkInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
				
		try {
			
			resultCheck = OutSideDao.OutSideWorkInsert(paramMap);
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkInsert");
				
			}
			else //성공시
			{
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkList");
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
	
	
	@RequestMapping(value = "/OutSideWorkUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideWorkUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("ow_seq", seq);			
			resultCheck = OutSideDao.OutSideWorkUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkList");
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
	
	@RequestMapping(value = "/OutSideWorkDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView OutSideWorkDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "3"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = OutSideDao.OutSideWorkDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/OutSide.joil?menuname=OutSideWorkList");
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
