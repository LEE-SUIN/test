package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.company.test.vo.UtilVo;

public interface UtilDao {
	
    public List<UtilVo> FileList(Map<String,String> paramMap) throws SQLException; 
    public int FileInsert(Map<String,String> paramMap) throws SQLException; 
    public int FileUpdate(Map<String,String> paramMap) throws SQLException;
    public int FileDelete(Map<String,String> paramMap) throws SQLException; //삭제
    
    
}

