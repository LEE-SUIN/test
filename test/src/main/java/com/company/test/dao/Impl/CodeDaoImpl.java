package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.CodeDao;
import com.company.test.vo.CodeVo;

@Repository
public class CodeDaoImpl implements CodeDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<CodeVo> CodeList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("sc.codeList",paramMap);
    }
        
    public int codeInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("sc.codeInsert",paramMap);
    }
    
    public int codeUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("sc.codeUpdate",paramMap);
     }
    
    public int codeDelete(int sc_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("sc.codeDelete",sc_seq);
     }
    
    public CodeVo getCode(int sc_seq) throws SQLException {
        
		return query.selectOne("sc.codeOne",sc_seq);
    }
    
    public int getTotalCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("sc.getTotalCount",paramMap);
     }
    
    
}