package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.BoardVo;

public interface BoardDao {
	
    public List<BoardVo> BoardList(Map<String,String> paramMap) throws SQLException; //목록    
    public int BoardInsert(Map<String,String> paramMap) throws SQLException; //등록
    public BoardVo getBoard(int bl_seq) throws SQLException;// 하나 가져오기
    public int BoardUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int BoardDelete(int bl_seq) throws SQLException; //삭제    
    public int getBoardCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    
}

