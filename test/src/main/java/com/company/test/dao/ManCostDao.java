package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.ManCostVo;

public interface ManCostDao {
	
    public ManCostVo getManCost() throws SQLException;// 하나 가져오기
    public int ManCostUpdate(Map<String,String> paramMap) throws SQLException; //수정
    
}

