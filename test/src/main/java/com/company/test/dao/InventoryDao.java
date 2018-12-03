package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.InventoryVo;

public interface InventoryDao {
	
    public List<InventoryVo> InventoryList(Map<String,String> paramMap) throws SQLException; //목록    
    public int InventoryInsertProc(Map<String,String> paramMap) throws SQLException; //등록    
    public int InventoryUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int InventoryDelete(int ab_seq) throws SQLException; //삭제
    public int InventoryDetailDelete(int ab_seq) throws SQLException; //삭제
    public int getInventoryCount(Map<String,String> paramMap) throws SQLException; //카운트 가져오기
    
    public int InventoryDetailInsertProc(Map<String,String> paramMap) throws SQLException; //등록
    
    public List<InventoryVo> InventoryDetailList(Map<String,String> paramMap) throws SQLException; //세부목록    
    
    
}

