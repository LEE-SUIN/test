package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.ItemVo;

public interface ItemDao {
	
    public List<ItemVo> ItemList(Map<String,String> paramMap) throws SQLException; //목록    
    public int ItemInsert(Map<String,String> paramMap) throws SQLException; //등록
    public ItemVo getItem(int se_seq) throws SQLException;// 하나 가져오기
    public int ItemUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int ItemDelete(int se_seq) throws SQLException; //삭제
    
    public int getItemCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    
}

