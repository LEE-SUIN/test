package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.EnterpriseVo;

public interface EnterpriseDao {
	
    public List<EnterpriseVo> EnterpriseList(Map<String,String> paramMap) throws SQLException; //목록    
    public int EnterpriseInsert(Map<String,String> paramMap) throws SQLException; //등록
    public EnterpriseVo getEnterprise(int se_seq) throws SQLException;// 하나 가져오기
    public int EnterpriseUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int EnterpriseDelete(int se_seq) throws SQLException; //삭제
    
    
}

