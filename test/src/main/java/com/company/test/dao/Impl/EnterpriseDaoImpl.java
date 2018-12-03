package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.EnterpriseDao;
import com.company.test.vo.EnterpriseVo;

@Repository
public class EnterpriseDaoImpl implements EnterpriseDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<EnterpriseVo> EnterpriseList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("se.EnterpriseList",paramMap);
    }
        
    public int EnterpriseInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("se.EnterpriseInsert",paramMap);
    }
    
    public int EnterpriseUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("se.EnterpriseUpdate",paramMap);
     }
    
    public int EnterpriseDelete(int se_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("se.EnterpriseDelete",se_seq);
     }
    
    public EnterpriseVo getEnterprise(int se_seq) throws SQLException {
        
		return query.selectOne("se.EnterpriseOne",se_seq);
    }
    
}