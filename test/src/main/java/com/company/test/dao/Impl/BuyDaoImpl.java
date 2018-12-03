package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.BuyDao;
import com.company.test.vo.BuyVo;

@Repository
public class BuyDaoImpl implements BuyDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<BuyVo> BuyList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("ab.BuyList",paramMap);
    }
        
    public int BuyInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("ab.BuyInsert",paramMap);
    }
    
    public int BuyUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("ab.BuyUpdate",paramMap);
     }
    
    public int BuyDelete(int ab_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("ab.BuyDelete",ab_seq);
     }
    
    public BuyVo getBuy(int ab_seq) throws SQLException {
        
		return query.selectOne("ab.BuyOne",ab_seq);
    }
    
    public int getBuyCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("ab.getBuyCount",paramMap);
     }
    
    
    @Override
    public List<BuyVo> BuyBook(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("ab.BuyBook",paramMap);
    }
    
    public int getBuyRows(Map paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("ab.getBuyRows",paramMap);
     }
    
}