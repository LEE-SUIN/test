package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.OutSideVo;
import com.company.test.vo.OutSideWorkVo;

public interface OutSideDao {
	
    public List<OutSideVo> OutSideList(Map<String,String> paramMap) throws SQLException; //목록    
    public int OutSideInsert(Map<String,String> paramMap) throws SQLException; //등록
    public OutSideVo getOutSide(int se_seq) throws SQLException;// 하나 가져오기
    public int OutSideUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int OutSideDelete(int se_seq) throws SQLException; //삭제
    public int getOutSideCount(Map<String,String> paramMap) throws SQLException; //카운트 가져오기
    
    public List<OutSideVo> OutSideEnterPrise(Map<String,String> paramMap) throws SQLException; //목록    
    
    //외주 가공 품번 관리
    public List<OutSideWorkVo> OutSideWorkList(Map<String,String> paramMap) throws SQLException; //목록    
    public int OutSideWorkInsert(Map<String,String> paramMap) throws SQLException; //등록
    public OutSideWorkVo getOutSideWork(int se_seq) throws SQLException;// 하나 가져오기
    public int OutSideWorkUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int OutSideWorkDelete(int se_seq) throws SQLException; //삭제
    public int getOutSideWorkCount(Map<String,String> paramMap) throws SQLException; //카운트 가져오기
    
    //외주 업체 통계
    public List<OutSideVo> OutSideStats(Map<String,String> paramMap) throws SQLException; //목록    
}

