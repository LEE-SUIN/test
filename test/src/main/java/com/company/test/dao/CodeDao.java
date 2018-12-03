package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.CodeVo;

public interface CodeDao {
	
    public List<CodeVo> CodeList(Map<String,String> paramMap) throws SQLException; //목록    
    public int codeInsert(Map<String,String> paramMap) throws SQLException; //등록
    public CodeVo getCode(int sc_seq) throws SQLException;// 하나 가져오기
    public int codeUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int codeDelete(int sc_seq) throws SQLException; //삭제
    
    public int getTotalCount(Map<String,String> paramMap) throws SQLException; //총 게시물 수
    
    
}

