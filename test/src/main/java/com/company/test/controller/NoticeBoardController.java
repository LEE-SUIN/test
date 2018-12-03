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

import com.company.test.vo.NoticeBoardVo;
import com.company.test.vo.UtilVo;
import com.company.test.dao.NoticeBoardDao;
import com.company.test.dao.UtilDao;

@Controller
public class NoticeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@Autowired
	private NoticeBoardDao NoticeBoardDao;
	
	@Autowired
	private UtilDao UtilDao;

	
	@RequestMapping(value = "/NoticeBoard.joil")
	public ModelAndView WorkList(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    NoticeBoardVo NoticeBoardVo = new NoticeBoardVo();
  		String viewName=request.getParameter("menuname"); //menuname 를 받아서 뷰네임으로 바로 설정
  		String seq = request.getParameter("seq");
  		String search_word = request.getParameter("search_word");
		try {	
			if(viewName.equals("NoticeBoardList"))
			{
				paramMap.put("search_word", search_word);
				List<NoticeBoardVo> List = NoticeBoardDao.NoticeBoardList(paramMap);
				
				 for(int i=0;i<List.size();i++)
				    {
				    	paramMap.put("f_data_seq",List.get(i).getNl_seq()+"");
						paramMap.put("f_menu_name","NoticeBoardFile" );
						List<UtilVo> fileList = UtilDao.FileList(paramMap);
				    	List.get(i).setFilelist(fileList);
				    	//System.out.println(" "+i+" =  "+List.get(i).getFilelist());
				    }
				
				model.put("search_word", search_word);
				model.put("List", List);
				model.put("menutitle", "게시판 목록" );
			}else if(viewName.equals("NoticeBoardInsert"))
			{
				model.put("NoticeBoardVo", NoticeBoardVo);
				model.put("menutitle", "게시글 등록" );
			}else if(viewName.equals("NoticeBoardUpdate"))
			{
				viewName = "NoticeBoardInsert";
				NoticeBoardVo = NoticeBoardDao.getNoticeBoard(Integer.parseInt(seq));
				
			 	paramMap.put("f_data_seq",seq+"");
				paramMap.put("f_menu_name","NoticeBoardFile" );
				List<UtilVo> fileList = UtilDao.FileList(paramMap);
				NoticeBoardVo.setFilelist(fileList);
				model.put("NoticeBoardVo", NoticeBoardVo);
				model.put("menutitle", "게시글 수정" );
			}
				
		    } catch (Exception e) { 
		    	
		    	StackTraceElement[] elog = e.getStackTrace();
				for(int i=0;i<elog.length;i++)
				{
					System.out.println(elog[i]);
				}
		    }
		model.put("menu_name", "NoticeBoardFile");
		model.put("menu_auth", "20"); //메뉴 권한 확인을 위해 값 입력
				
		mnv.setViewName(viewName);
		mnv.addAllObjects(model);
		return mnv;
	}
	
	
	@RequestMapping(value = "/NoticeBoardInsertProc.joil" , method = RequestMethod.POST)
	public ModelAndView NoticeBoardInsertProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    Map insertMap = new HashMap();
	    insertMap = paramMap;
	    model.put("menu_auth", "20"); //메뉴 권한 확인을 위해 값 입력
	    Map FileMap = new HashMap();
	    int resultCheck=0;
	
		try {
			
			NoticeBoardDao.NoticeBoardInsert(insertMap);
			resultCheck = Integer.parseInt(insertMap.get("nl_seq").toString());
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "등록에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardInsert");
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "NoticeBoardFile");
				FileMap.put("f_data_seq", resultCheck+"");
				FileMap.put("check", "1");
				
				UtilDao.FileUpdate(FileMap);
				model.put("message", "등록 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardList");
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
	
	
	@RequestMapping(value = "/NoticeBoardUpdateProc.joil" , method = RequestMethod.POST)
	public ModelAndView NoticeBoardUpdateProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "20"); //메뉴 권한 확인을 위해 값 입력
	    Map FileMap = new HashMap();
	    
	    int resultCheck=0;
	  
		try {
			paramMap.put("Nl_seq", seq);
			
			resultCheck = NoticeBoardDao.NoticeBoardUpdate(paramMap);
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "수정에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				FileMap.put("f_menu_name", "NoticeBoardFile");
				FileMap.put("f_data_seq", seq+"");
				UtilDao.FileUpdate(FileMap);
				model.put("message", "수정 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardList");
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
	
	@RequestMapping(value = "/NoticeBoardDeleteProc.joil" , method = RequestMethod.POST)
	public ModelAndView NoticeBoardDeleteProc(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {		
	    ModelAndView mnv = new ModelAndView();	
	    Map model = new HashMap();
	    String root = request.getSession().getServletContext().getRealPath("/uploadFile");
	    String seq = request.getParameter("seq");
	    model.put("menu_auth", "20"); //메뉴 권한 확인을 위해 값 입력
	    
	    int resultCheck=0;
	    
		try {
			
			resultCheck = NoticeBoardDao.NoticeBoardDelete(Integer.parseInt(seq));
			
			if(resultCheck==0 || resultCheck <0) //실패시
			{
				model.put("message", "삭제에 실패하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardUpdate&seq="+paramMap.get("seq"));
				
			}
			else //성공시
			{
				model.put("message", "삭제 하였습니다.");
				model.put("result", "alertgo");
				model.put("href", "/NoticeBoard.joil?menuname=NoticeBoardList");
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
