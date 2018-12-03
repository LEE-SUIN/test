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
import com.company.test.vo.ManCostVo;
import com.company.test.vo.Paging;
import com.company.test.dao.ManCostDao;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.dao.ItemDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.UserDao;


@Controller
public class WorkController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	@Autowired
	private ItemDao ItemDao;
	@Autowired
	private WorkDao WorkDao;
	@Autowired
	private EnterpriseDao EnterpriseDao;
	@Autowired
	private CodeDao CodeDao;
	@Autowired
	private UserDao UserDao;
	@Autowired
	private ManCostDao ManCostDao;
	
	@RequestMapping(value = "/Work.joil")
	public ModelAndView WorkList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		String seq = request.getParameter("seq");
		WorkVo WorkVo = new WorkVo();
		ManCostVo ManCostVo = new ManCostVo();
		Date today = new Date();
		String path = request.getRequestURI().substring(request.getContextPath().length());
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		Date to = null;
		paramMap.put("pageNo","0");
		paramMap.put("pageSize","99999");
		
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		
		try {	
				if(viewName.equals("WorkList"))
				{
					String search_word = request.getParameter("search_word");
					String search_date = request.getParameter("search_date");
					model.put("search_word",search_word );
					model.put("search_date",search_date );
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					paramMap.put("search_word",search_word);
					paramMap.put("search_date",search_date);
					
					int totalCount = WorkDao.getWorkCount(paramMap);
					Paging paging = new Paging();

					paging.setPageNo(pageNo);
					paging.setPageSize(pageSize);
					paging.setTotalCount(totalCount);

					pageNo = (pageNo-1)*pageSize;

					paramMap.put("pageNo",pageNo+"" );
					paramMap.put("pageSize",pageSize+"" );

					model.put("totalCount", totalCount);
					model.put("paging", paging);
					
				    List<WorkVo> List = WorkDao.WorkList(paramMap);
				    model.put("List", List);
				    model.put("menutitle", "작업 목록" );
				}
				else if(viewName.equals("WorkInsert"))
				{	
					paramMap.put("sc_group_seq", "3"); //업무
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					paramMap.put("sc_group_seq", "4"); //진행상황
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					
					paramMap.put("sc_group_seq", "5"); //금액현황
					List<CodeVo> mList = CodeDao.CodeList(paramMap);
					model.put("mList", mList);
					
					paramMap.put("sc_group_seq", "6"); //업무선택
					List<CodeVo> wList = CodeDao.CodeList(paramMap);
					model.put("wList", wList);
					
					paramMap.put("use_yn", "Y"); 
					List<UserVo> uList = UserDao.UserList(paramMap);	
					model.put("uList", uList);
					WorkVo.setPw_work_date(today);					
					model.put("WorkVo", WorkVo);
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체
					model.put("EList", EList);
					
					model.put("menutitle", "작업 등록" );
				}			
				else if(viewName.equals("WorkUpdate"))
				{
					
					paramMap.put("sc_group_seq", "3"); //업무
					List<CodeVo> jList = CodeDao.CodeList(paramMap);
					model.put("jList", jList);
					paramMap.put("sc_group_seq", "4"); //진행상황
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					
					paramMap.put("sc_group_seq", "5"); //금액현황
					List<CodeVo> mList = CodeDao.CodeList(paramMap);
					model.put("mList", mList);
					
					paramMap.put("sc_group_seq", "6"); //업무선택
					List<CodeVo> wList = CodeDao.CodeList(paramMap);
					model.put("wList", wList);
					
					paramMap.put("use_yn", "Y"); 
					List<UserVo> uList = UserDao.UserList(paramMap);	
					model.put("uList", uList);
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap); //업체
					model.put("EList", EList);
					
					viewName = "WorkInsert";
					WorkVo = WorkDao.getWork(Integer.parseInt(seq));					
					model.put("WorkVo", WorkVo);
					
					model.put("menutitle", "작업 수정" );
				}else if(viewName.equals("WorkState"))
				{
					paramMap.put("use_yn", "Y");
					
					paramMap.put("pageNo", "0");
					paramMap.put("pageSize", "99999");	
					paramMap.put("se_group", "C");
					List<EnterpriseVo> CEList = EnterpriseDao.EnterpriseList(paramMap); // 자동차 업체
					model.put("CEList", CEList);
					
					List<ItemVo> aList = ItemDao.ItemList(paramMap); //전체 품목
					model.put("aList", aList);
					
					paramMap.put("pi_group", "E");
					paramMap.put("pi_group_temp", "A");
					List<ItemVo> LGAList = ItemDao.ItemList(paramMap); //엘지 에어컨
					model.put("LGAList", LGAList);
					paramMap.put("pi_group", "E");
					paramMap.put("pi_group_temp", "R");
					List<ItemVo> LGRList = ItemDao.ItemList(paramMap); //엘지 냉장고
					model.put("LGRList", LGRList);
					paramMap.put("pi_group", "E");
					paramMap.put("pi_group_temp", "C");
					List<ItemVo> LGCList = ItemDao.ItemList(paramMap); //엘지 조리기구
					model.put("LGCList", LGCList);
					paramMap.put("pi_group", "E");
					paramMap.put("pi_group_temp", "Z");
					List<ItemVo> LGZList = ItemDao.ItemList(paramMap); //엘지 시방
					model.put("LGZList", LGZList);
										
					String start_date = request.getParameter("start_date");
					String end_date = request.getParameter("end_date");
					paramMap.put("start_date", start_date);
					paramMap.put("end_date", end_date);
					List<WorkVo> wList = WorkDao.WorkState(paramMap);
					model.put("wList", wList);
					model.put("start_date",start_date );
					model.put("end_date",end_date );
					
					

					ManCostVo = ManCostDao.getManCost();
					model.put("ManCostVo", ManCostVo);
					
					
					model.put("menutitle", "작업 현황" );
					
					
				}else if(viewName.equals("WorkStats"))
				{
					String start_date = request.getParameter("tmp_start_date");
					String end_date = request.getParameter("tmp_end_date");
					List<EnterpriseVo> List = EnterpriseDao.EnterpriseList(paramMap); 
					model.put("List", List);
					
					paramMap.put("start_date", start_date);
					paramMap.put("end_date", end_date);
					List<WorkVo> sList = WorkDao.WorkStats(paramMap);
					model.put("sList", sList);
					model.put("start_date", start_date);
					model.put("end_date", end_date);
					model.put("PrintCheck", "WorkStats");
					model.put("menutitle", "작업 통계" );
				}
				else if(viewName.equals("WorkAllInsert"))
				{
					paramMap.put("use_yn", "Y");
					List<UserVo> uList = UserDao.UserList(paramMap);
					model.put("uList", uList);
					
					paramMap.put("pageNo", "0");
					paramMap.put("pageSize", "99999");					
					List<ItemVo> iList = ItemDao.ItemList(paramMap);					
					model.put("iList", iList);
					
				}
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		
		model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
		model.put("path", path );
		
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/WorkInsertProc.joil" , method = RequestMethod.POST)
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
			
			resultCheck = WorkDao.WorkInsert(paramMap);
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
	
	@RequestMapping(value = "/WorkAllInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView WorkAllInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();		
		Map resultMap = new HashMap();
		int resultCnt= 0;
		String pw_pi_job_time =  request.getParameter("pw_pi_job_time");
		String pw_se_seq =  request.getParameter("pw_se_seq");
		String pw_se_group =  request.getParameter("pw_se_group");
		String pw_se_group_temp =  request.getParameter("pw_se_group_temp");
		try {
			paramMap.put("pw_pi_job_time", pw_pi_job_time);
			paramMap.put("pw_se_seq", pw_se_seq);
			paramMap.put("pw_se_group", pw_se_group);
			paramMap.put("pw_se_group_temp", pw_se_group_temp);
			resultCnt = WorkDao.WorkInsert(paramMap);
			//0 이면 실패
			resultMap.put("resultCnt", resultCnt);
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
	
	
	@RequestMapping(value = "/WorkUpdateProc.joil" , method = RequestMethod.POST)
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
			resultCheck = WorkDao.WorkUpdate(paramMap);
			
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
	
	@RequestMapping(value = "/WorkDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView WorkDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "2"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = WorkDao.WorkDelete(Integer.parseInt(seq));
			
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
	
	 
	
	
	@RequestMapping(value = "/getItemOne.joil" , method = RequestMethod.POST)
	public ModelAndView getEnterpriseInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		
		Map resultMap = new HashMap();
		ItemVo ItemVo = new ItemVo();
		String seq  = request.getParameter("seq");
		try {
			
			ItemVo = ItemDao.getItem(Integer.parseInt(seq));
			resultMap.put("ItemVo", ItemVo);
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
