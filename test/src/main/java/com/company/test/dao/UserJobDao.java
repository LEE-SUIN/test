package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.UserJobVo;

public interface UserJobDao {
	
    public List<UserJobVo> UserJobList(Map<String, String> map) throws SQLException; //사용자 목록
    public int userJobInsert(Map<String,String> paramMap) throws SQLException; //사용자 등록
}

