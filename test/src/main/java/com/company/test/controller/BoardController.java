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

import com.company.test.vo.BoardVo;
import com.company.test.vo.UtilVo;
import com.company.test.dao.BoardDao;
import com.company.test.dao.UtilDao;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@Autowired
	private BoardDao BoardDao;
	
	@Autowired
	private UtilDao UtilDao;

	
	@RequestMapping(value = "/Board.joil")
	public ModelAndView WorkList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    BoardVo BoardVo = new BoardVo();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
		try {	
			if(viewName.equals("BoardList"))
			{
				List<BoardVo> List = BoardDao.BoardList(paramMap);
				
				 for(int i=0;i<List.size();i++)
				    {
				    	paramMap.put("f_data_seq",List.get(i).getBl_seq()+"");
						paramMap.put("f_menu_name","BoardFile" );
						List<UtilVo> fileList = UtilDao.FileList(paramMap);
				    	List.get(i).setFilelist(fileList);
				    	//System.out.println(" "+i+" =  "+List.get(i).getFilelist());
				    }
				
				
				model.put("List", List);
				model.put("menutitle", "자료실 목록" );
			}else if(viewName.equals("BoardInsert"))
			{
				model.put("BoardVo", BoardVo);
				model.put("menutitle", "자료 등록" );
			}else if(viewName.equals("BoardUpdate"))
			{
				viewName = "BoardInsert";
				BoardVo = BoardDao.getBoard(Integer.parseInt(seq));
				
			 	paramMap.put("f_data_seq",seq+"");
				paramMap.put("f_menu_name","BoardFile" );
				List<UtilVo> fileList = UtilDao.FileList(paramMap);
				BoardVo.setFilelist(fileList);
				model.put("BoardVo", BoardVo);
				model.put("menutitle", "자료 수정" );
			}
				
		    } catch (Exception e) { 
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		model.put("menu_name", "BoardFile");
		model.put("menu_auth", "10"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/BoardInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView BoardInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    Map insertMap = new HashMap();
	    insertMap = paramMap;
	    model.put("menu_auth", "10"); //메뉴 권한 확인을 위해 값 입력
	    Map FileMap = new HashMap();
	    int resultCheck=0;
	
		try {
			
			BoardDao.BoardInsert(insertMap);
			resultCheck = Integer.parseInt(insertMap.get("bl_seq").toString());
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardInsert");
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "BoardFile");
				FileMap.put("f_data_seq", resultCheck+"");
				FileMap.put("check", "1");
				
				UtilDao.FileUpdate(FileMap);
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardList");
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
	
	
	@RequestMapping(value = "/BoardUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView BoardUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "10"); //메뉴 권한 확인을 위해 값 입력
	    Map FileMap = new HashMap();
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("bl_seq", seq);
			
			resultCheck = BoardDao.BoardUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "BoardFile");
				FileMap.put("f_data_seq", seq+"");
				UtilDao.FileUpdate(FileMap);
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardList");
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
	
	@RequestMapping(value = "/BoardDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView BoardDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "10"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = BoardDao.BoardDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/Board.joil?menuname=BoardList");
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
