package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.UserJobDao;
import com.company.test.vo.UserJobVo;

@Repository
public class UserJobDaoImpl implements UserJobDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<UserJobVo> UserJobList(Map<String, String> map) throws SQLException {
        
		return query.selectList("sc.userJobList",map);
    }
    
    public int userJobInsert(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
 		return query.insert("sc.userJobInsert",paramMap);
     }
    
}