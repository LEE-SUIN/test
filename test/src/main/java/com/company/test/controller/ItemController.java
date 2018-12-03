package com.company.test.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.company.test.vo.ItemVo;
import com.company.test.vo.Paging;
import com.company.test.vo.UserVo;
import com.company.test.vo.WorkVo;
import com.company.test.dao.ItemDao;
import com.company.test.vo.CodeVo;
import com.company.test.vo.EnterpriseVo;
import com.company.test.dao.CodeDao;
import com.company.test.dao.EnterpriseDao;
import com.company.test.vo.UserVo;
import com.company.test.dao.UserDao;
import com.company.test.vo.UtilVo;
import com.company.test.dao.UtilDao;

@Controller
public class ItemController {

	@Autowired
	private ItemDao ItemDao;
	@Autowired
	private EnterpriseDao EnterpriseDao;
	@Autowired
	private CodeDao CodeDao;
	@Autowired
	private UserDao UserDao;
	@Autowired
	private UtilDao UtilDao;
	
	
	@RequestMapping(value = "/Item.joil")
	public ModelAndView ItemList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    model.put("menu_name", "ItemFile");
		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
		String seq = request.getParameter("seq");
		ItemVo ItemVo = new ItemVo();
		Date today = new Date();
		String path = request.getRequestURI().substring(request.getContextPath().length());
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		Date to = null;
		paramMap.put("pageNo", "0");
		paramMap.put("pageSize", "99999");
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		
		String search_word = request.getParameter("search_word");
		
		try {	
				if(viewName.equals("ItemList"))
				{
					paramMap.put("search_word", search_word);	
					int totalCount = ItemDao.getItemCount(paramMap);
					Paging paging = new Paging();
			        
			        paging.setPageNo(pageNo);
			        paging.setPageSize(pageSize);
			        paging.setTotalCount(totalCount);
			        
			    	pageNo = (pageNo-1)*pageSize;
			    	
			    	paramMap.put("pageNo",pageNo+"" );
				    paramMap.put("pageSize",pageSize+"" );
				    
				    paramMap.put("totalCount", totalCount+"");
				    paramMap.put("paging", paging+"");
				  
				    List<ItemVo> List = ItemDao.ItemList(paramMap);
				    for(int i=0;i<List.size();i++)
				    {
				    	paramMap.put("f_data_seq",List.get(i).getPi_seq()+"");
						paramMap.put("f_menu_name","ItemFile" );
						List<UtilVo> fileList = UtilDao.FileList(paramMap);
				    	List.get(i).setFilelist(fileList);
				    	//System.out.println(" "+i+" =  "+List.get(i).getFilelist());
				    }
				    
				    model.put("List", List);
				    model.put("totalCount", totalCount);
					model.put("paging", paging);
					model.put("search_word", search_word);
				    model.put("menutitle", "품목 목록" );
				}
				else if(viewName.equals("ItemInsert"))
				{	
					
					ItemVo.setPi_order_date(today);
					
					paramMap.put("sc_group_seq", "4");
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					
					paramMap.put("sc_group_seq", "5");
					List<CodeVo> mList = CodeDao.CodeList(paramMap);
					model.put("mList", mList);
										
					paramMap.put("use_yn", "Y");
					List<UserVo> uList = UserDao.UserList(paramMap);	
					model.put("uList", uList);
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
					model.put("EList", EList);
					model.put("ItemVo", ItemVo);
					model.put("menutitle", "품목 등록" );
				}			
				else if(viewName.equals("ItemUpdate"))
				{
					
					paramMap.put("sc_group_seq", "4");
					List<CodeVo> pList = CodeDao.CodeList(paramMap);
					model.put("pList", pList);
					
					paramMap.put("sc_group_seq", "5");
					List<CodeVo> mList = CodeDao.CodeList(paramMap);
					model.put("mList", mList);					
					
					paramMap.put("use_yn", "Y");
					List<UserVo> uList = UserDao.UserList(paramMap);	
					model.put("uList", uList);
					
					List<EnterpriseVo> EList = EnterpriseDao.EnterpriseList(paramMap);
					model.put("EList", EList);
					viewName = "ItemInsert";
					ItemVo = ItemDao.getItem(Integer.parseInt(seq));
					
				 	paramMap.put("f_data_seq",seq+"");
					paramMap.put("f_menu_name","ItemFile" );
					List<UtilVo> fileList = UtilDao.FileList(paramMap);
					ItemVo.setFilelist(fileList);
					
					model.put("ItemVo", ItemVo);
					
					model.put("menutitle", "품목 수정" );
				}else if(viewName.equals("ItemStats"))
				{
				
					List<EnterpriseVo> List = EnterpriseDao.EnterpriseList(paramMap); 
					model.put("List", List);
					
					
					model.put("menutitle", "품목 통계" );
				}
				
		    } catch (Exception e) {
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }

		
		model.put("menu_auth", "1"); //메뉴 권한 확인을 위해 값 입력
		model.put("path", path );
		
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/ItemInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView ItemInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    Map<String,String> Map = new HashMap(); 
	    Map insertMap = new HashMap();
	    insertMap = paramMap;
	    model.put("menu_name", "ItemFile");
	    Map FileMap = new HashMap();
	    model.put("menu_auth", "1"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	 
	    SimpleDateFormat sdf = new SimpleDateFormat("YY");
		Date date = new Date(); 
		
	    
	    String atoz[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	    
	    String tmp_pi_joil_number = request.getParameter("pi_joil_number");	    
	    String tmp_pi_group = request.getParameter("pi_group");
	    String tmp_pi_group_temp = request.getParameter("pi_group_temp");
	    String tmp_pi_e_seq = request.getParameter("pi_e_seq");
	    String tmp_pi_order_date =  request.getParameter("pi_order_date");
	    	    
	    String tmp_e_code = "";
	    int tmp_pi_process = Integer.parseInt( request.getParameter("pi_process"));
	    if(tmp_pi_process == 0)
	    {
	    	tmp_pi_process = 1;
	    }
	    int tmp_order_price = Integer.parseInt( request.getParameter("pi_order_price"));
	    if(tmp_order_price==0)
	    {
	    	tmp_order_price = 100;
	    }
	    
	    insertMap.put("pi_process", tmp_pi_process+"");
	    int e_count=0;
	    int e_all_count=0;
	   
	    String tmp_alpa="";
	    tmp_alpa = atoz[tmp_pi_process-1];
	    
	   
	    if(request.getParameterValues("pi_man") != null)
	    {
		    String[] tmp_pi_man = request.getParameterValues("pi_man");
		    String pi_man="";
	        for(int i=0;i<tmp_pi_man.length;i++)
	        {
	        	pi_man = pi_man+tmp_pi_man[i]+"|";
	        }
	        insertMap.put("pi_man", pi_man);
	    }
	    
		try {
			Date year = sdf.parse(tmp_pi_order_date);
			String number= sdf.format(year)+"JI";
			Map.put("pi_order_date",sdf.format(year)+"");
			 e_all_count = ItemDao.getItemCount(Map); // 전체
			//업체 코드 가져오기
			 insertMap.put("se_seq", tmp_pi_e_seq);
			List<EnterpriseVo> List = EnterpriseDao.EnterpriseList(insertMap);
			if(List.size()==1)
			{
				tmp_e_code = List.get(0).getSe_code();
			}
			insertMap.put("pi_e_code", tmp_e_code);
			//조일 제번이 없으면 제번을 따서 입력한다.
		    if(tmp_pi_joil_number.equals(null) || tmp_pi_joil_number.equals("") )
		    {
		    	if(tmp_pi_group.equals("C"))  //자동차 일때
		    	{
		    		
		    		insertMap.put("pi_e_seq",tmp_pi_e_seq);
		    		e_count = ItemDao.getItemCount(insertMap); //해당 업체 카운트 가져오기
		    		number = number + tmp_e_code  + String.format("%02d", e_count+1) + tmp_alpa ;
		    		insertMap.remove("pi_e_seq");
		    		
		    		insertMap.put("pi_whole_number", String.format("%03d", e_all_count+1)); //전체 count
		    		number = number  + "-" + String.format("%03d", e_all_count+1);
		    		insertMap.put("pi_joil_number", number); //조일 제번
		    		insertMap.put("pi_group_temp","");
		    		insertMap.put("pi_e_seq",tmp_pi_e_seq);
		    	}
		    	else if(tmp_pi_group.equals("E")) //전자 일때는 업체가 아니라 group_temp 상세 분류에서 시방,조리기구,에어컨,냉장고에서 카운트한다.
		    	{
		    		insertMap.put("pi_group_temp",tmp_pi_group_temp); // 전자 상세 분류
		    		e_count = ItemDao.getItemCount(insertMap); //해당 업체 카운트 가져오기
		    		number = number + tmp_pi_group_temp + String.format("%02d", e_count+1) + tmp_alpa ;
		    		insertMap.remove("pi_group_temp");
		    		insertMap.remove("pi_e_seq");
		    		e_all_count = ItemDao.getItemCount(insertMap); // 전체
		    		insertMap.put("pi_whole_number", String.format("%03d", e_all_count+1)); //전체 count
		    		number = number  + "-" + String.format("%03d", e_all_count+1);
		    		insertMap.put("pi_joil_number", number); //조일 제번
		    		insertMap.put("pi_group_temp",tmp_pi_group_temp); // 전자 상세 분류
		    		insertMap.put("pi_e_seq",tmp_pi_e_seq);
		    	}
		    }
			
		    insertMap.put("pi_order_price", tmp_order_price+"");
			
			ItemDao.ItemInsert(insertMap);
									
			resultCheck = Integer.parseInt(insertMap.get("pi_seq").toString());
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemInsert");
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "ItemFile");
				FileMap.put("f_data_seq", resultCheck+"");
				FileMap.put("check", "1");
				
				UtilDao.FileUpdate(FileMap);
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemList");
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
	
	
	@RequestMapping(value = "/ItemUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView ItemUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    model.put("menu_name", "ItemFile");
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "1"); //메뉴 권한 확인을 위해 값 입력
	    Map FileMap = new HashMap();
	    
	    String tmp_pi_e_seq = request.getParameter("pi_e_seq");
	    String tmp_e_code = "";
	    if(request.getParameterValues("pi_man") != null)
	    {
		    	
		    String[] tmp_pi_man =  request.getParameterValues("pi_man");
		    String pi_man="";
		    for(int i=0;i<tmp_pi_man.length;i++)
		    {
		    	pi_man = pi_man+tmp_pi_man[i]+"|";
		    }
		    paramMap.put("pi_man", pi_man);
	    }
	    
	    int resultCheck=0;
	 
		try {
			//업체 코드 가져오기
			paramMap.put("se_seq", tmp_pi_e_seq);
			List<EnterpriseVo> List = EnterpriseDao.EnterpriseList(paramMap);
			if(List.size()==1)
			{
				tmp_e_code = List.get(0).getSe_code();
			}
			paramMap.put("pi_e_code", tmp_e_code);
			paramMap.put("pi_seq", seq);
			resultCheck = ItemDao.ItemUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "ItemFile");
				FileMap.put("f_data_seq", seq+"");
				UtilDao.FileUpdate(FileMap);
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemList");
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
	
	@RequestMapping(value = "/ItemDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView ItemDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "1"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = ItemDao.ItemDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Item.joil?menuname=ItemList");
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
	
	
	
	
	@RequestMapping(value = "/getItemList.joil" , method = RequestMethod.POST)
	public ModelAndView getEnterpriseInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
		ModelAndView mnv = new ModelAndView();
		
		Map resultMap = new HashMap();
		String pi_e_seq = request.getParameter("pi_e_seq");
		String pi_group = request.getParameter("pi_group");
		String pi_group_temp = request.getParameter("pi_group_temp");
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		int pageSize = 10;
		try {
			paramMap.put("use_yn", "Y");
			paramMap.put("pi_e_seq", pi_e_seq);
			paramMap.put("pi_group", pi_group);
			paramMap.put("pi_group_temp", pi_group_temp);
						
			paramMap.put("pageNo", "0");
			paramMap.put("pageSize", "99999");	
			List<ItemVo> iList = ItemDao.ItemList(paramMap);
			resultMap.put("ilist", iList);
		
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
