package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.BuyVo;

public interface BuyDao {
	
    public List<BuyVo> BuyList(Map<String,String> paramMap) throws SQLException; //목록    
    public int BuyInsert(Map<String,String> paramMap) throws SQLException; //등록
    public BuyVo getBuy(int ab_seq) throws SQLException;// 하나 가져오기
    public int BuyUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int BuyDelete(int ab_seq) throws SQLException; //삭제
    
    public int getBuyCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    public List<BuyVo> BuyBook(Map<String,String> paramMap) throws SQLException; //목록    
    
    public int getBuyRows(Map paramMap) throws SQLException; //카우트 가져오기
    
    
}

