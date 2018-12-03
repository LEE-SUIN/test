package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.UserDao;
import com.company.test.vo.CodeVo;
import com.company.test.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<UserVo> UserList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("su.userList",paramMap);
    }
    
    @Override
    public UserVo LoginCheck(HashMap<String, Object> map) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
    	
		return query.selectOne("su.loginCheck",map);
		
    }
    
    
    public int userInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
    	int seq = query.insert("su.userInsert",paramMap);
    	
		return seq;
		
    }
    
    public int userUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("su.userUpdate",paramMap);
     }
    
    public int userPasswordUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("su.userPasswordUpdate",paramMap);
     }
    
    public int userDelete(int su_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("su.userDelete",su_seq);
     }
    
	 public UserVo getUser(int sc_seq) throws SQLException {
	        
			return query.selectOne("su.userOne",sc_seq);
	    }
	 
	 
	 
	 @Override
	    public List<UserVo> UserStats(Map<String,String> paramMap) throws SQLException {
	        
			return query.selectList("su.userStats",paramMap);
	    }
    
}