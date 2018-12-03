package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.WorkVo;

public interface WorkDao {
	
    public List<WorkVo> WorkList(Map<String,String> paramMap) throws SQLException; //목록    
    public int WorkInsert(Map<String,String> paramMap) throws SQLException; //등록
    public WorkVo getWork(int se_seq) throws SQLException;// 하나 가져오기
    public int WorkUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int WorkDelete(int se_seq) throws SQLException; //삭제
    public int getWorkCount(Map<String,String> paramMap) throws SQLException; //카운트 가져오기
    
    
    public List<WorkVo> WorkState(Map<String,String> paramMap) throws SQLException; // 통계목록
    public List<WorkVo> WorkStats(Map<String,String> paramMap) throws SQLException; // 통계목록
}

