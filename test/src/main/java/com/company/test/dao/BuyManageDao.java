package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.BuyManageVo;

public interface BuyManageDao {
	
    public List<BuyManageVo> BuyEnterPriseList(Map<String,String> paramMap) throws SQLException; //목록    
    public int BuyManageInsert(Map<String,String> paramMap) throws SQLException; //등록
    public BuyManageVo getBuyManage(int ab_seq) throws SQLException;// 하나 가져오기
    public int BuyManageUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int BuyManageDelete(int ab_seq) throws SQLException; //삭제
    
    public int getBuyManageCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    
}

