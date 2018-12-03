package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.UtilDao;
import com.company.test.vo.UtilVo;


@Repository
public class UtilDaoImpl implements UtilDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<UtilVo> FileList(Map<String,String> paramMap) throws SQLException {        
		return query.selectList("util.FileList",paramMap);
    }
    
    public int FileInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);    	
		return query.insert("util.FileInsert",paramMap);		
    }    
    
    public int FileUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);    	
 		return query.update("util.FileUpdate",paramMap);
     }
    
    public int FileDelete(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);    	
 		return query.delete("util.FileDelete",paramMap);
     }
    
	
    
}