package com.company.test.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.test.controller.SystemController;
import com.company.test.vo.CodeVo;
import com.company.test.vo.UtilVo;
import com.company.test.dao.UtilDao;
@Controller
public class util {
	
	@Autowired
	private UtilDao UtilDao;
	
	private static FileOutputStream fos;
	private static final Logger logger = LoggerFactory.getLogger(util.class);
	public static void resultToMassage(String msg, HttpServletResponse res) throws Exception {
		res.setContentType("text/html;charset=UTF-8");
		res.getWriter().write("<script language='JavaScript'>");
		if(!msg.equals("")){
		res.getWriter().write("alert('"+msg+"');");
		}
		res.getWriter().write("</script>");
		} 
	
	

	public static String getUUID(){
		String uuid="";
        try{         
        	uuid = UUID.randomUUID().toString();       
        }catch(Exception e){             
            
        }
        return uuid;
    }
	
	public static String getToday(){
		String str="";
        try{         
        	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        	Date date = new Date(); 
        	str = sdf.format(date);
        }catch(Exception e){             
            
        }
        return str;
    }
	
	
	@RequestMapping(value = "/filedownload.joil" )
	 public void filedownload(HttpServletRequest request, HttpServletResponse response)  throws Exception
     {
		System.out.println(" filedownload ");
	    response.setContentType("application/x-download;");
	    
	    //String filepath ="C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\test";
	    String filepath ="C:\\_workplace_sts\\test\\src\\main\\webapp";
	    filepath = filepath + request.getParameter("filepath");
	    String filename = request.getParameter("filename");
	    String filesavename = request.getParameter("filesavename");
	    String fileext = request.getParameter("fileext");
	    if (filesavename.equals("")) {
	    	filesavename = filename;
	    }
	    filesavename = URLEncoder.encode(filesavename, "UTF-8");

	    response.setHeader("Content-Disposition", "attachment; filename=\"" + filesavename + "\";");
	    
	    
	    OutputStream os = response.getOutputStream();
	    FileInputStream fis = new FileInputStream(filepath + File.separator + filename );

	    int n = 0;
	    byte[] b = new byte[512];

	    while ((n = fis.read(b)) != -1) {
	      os.write(b, 0, n);
	    }

	    fis.close();
	    os.close();
	  }


	@RequestMapping(value = "/FileUpload.joil" , method = RequestMethod.POST)
	public ModelAndView writeFile(HttpServletRequest request,MultipartHttpServletRequest multipartRequest){
		ModelAndView mnv = new ModelAndView();	
		Map model = new HashMap();
		Map fileMap = new HashMap();
		boolean check = false;
		int resultCheck=0;
		 
		String menu_name = request.getParameter("menu_name");
		String root = "C:\\_workplace_sts\\test\\src\\main\\webapp\\resources\\uploadFile\\"+menu_name+"\\";
		
		//String root = "C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\test\\resources\\uploadFile\\"+menu_name+"\\";
		
		File dir = new File(root);
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		try{
			
			List<MultipartFile> mf = multipartRequest.getFiles("Filedata");
			if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
	        
			} else {
	            for (int i = 0; i < mf.size(); i++) {
	            	//파일 중복명 처리
	                String genId = UUID.randomUUID().toString(); 
	                genId = genId.replace("-", "");
	                // 본래 파일명
	                String originalfileName = mf.get(i).getOriginalFilename(); 
	                String saveFileName = genId+"." + getExtension(originalfileName);; 
	                //"." + getExtension(originalfileName);
	                
	                // 저장되는 파일 이름
	                String savePath = root + saveFileName; // 저장 될 파일 경로	 
	                long fileSize = mf.get(i).getSize(); // 파일 사이즈	 
	                int Idx = originalfileName.lastIndexOf(".");
	                String _fileName = originalfileName.substring(0, Idx );
	                
	                fileMap.put("f_menu_name",menu_name );
	                fileMap.put("f_data_seq", "0");
	                fileMap.put("f_ori_name",originalfileName );
	                fileMap.put("f_save_name",saveFileName );
	                fileMap.put("f_save_path",savePath );
	                fileMap.put("f_file_ext",getExtension(originalfileName) );
	                fileMap.put("f_file_size",fileSize+"");
	                
	                
	                resultCheck = UtilDao.FileInsert(fileMap);
	                if(resultCheck != 0 && resultCheck >0) // 성공시
	                {
	                	mf.get(i).transferTo(new File(savePath)); // 파일 저장
	                }
	                
	            }
	        }
		    
			
			
			model.put("result", "noaction");
			mnv.setViewName("action");
			mnv.addAllObjects(model);
			return mnv;
			
        	
        }catch(Exception e){             
        	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
            
        }finally{             
            
        }// try end;
		return null;
        
    }// wirteFile() end;
	
	
	
	
	
	//가공 분류 선택시 그룹 존재하는지 체크.있으면 list 반환
		@RequestMapping(value = "/FileDelete.joil" , method = RequestMethod.POST)
		public ModelAndView FileDelete(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,String> paramMap) {
			ModelAndView mnv = new ModelAndView();
			Map FileMap = new HashMap();
			String seq = request.getParameter("f_seq");
			
			Map<String,String> codeMap = new HashMap();
			try {
				FileMap.put("f_seq",seq );
				UtilDao.FileDelete(FileMap);
				
				mnv.addAllObjects(FileMap);
				
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
	
	
	
	public boolean writeFile(){
		boolean check = false;
		try{
        	
        }catch(Exception e){             
        	StackTraceElement[] elog = e.getStackTrace();
			for(int i=0;i<elog.length;i++)
			{
				System.out.println(elog[i]);
			}
            check = false;
        }finally{             
            
        }// try end;
		return check;
        
    }// wirteFile() end;
	
	
	
	
	
	
	
	
	
	
	
	
	
	//파일 확장자
	public String getExtension(String filename)
	{
		String tmp="";
		int index = filename.lastIndexOf(".");
		    if (index != -1) {
		        tmp  = filename.substring(index + 1);
		    }
		return tmp;
	}
	
	
	
	
	
	
	
	
	
	
	
}
