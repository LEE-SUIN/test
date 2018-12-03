package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.InventoryDao;
import com.company.test.vo.InventoryVo;

@Repository
public class InventoryDaoImpl implements InventoryDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<InventoryVo> InventoryList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("il.InventoryList",paramMap);
    }
        
    public int InventoryInsertProc(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("il.InventoryInsert",paramMap);
    }
    
    public int InventoryDetailInsertProc(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
 		return query.insert("il.InventoryDetailInsert",paramMap);
     }
    
    
    public List<InventoryVo> InventoryDetailList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("il.InventoryDetailList",paramMap);
    }

    public int InventoryUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("il.InventoryUpdate",paramMap);
     }
    
    public int InventoryDelete(int il_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("il.InventoryDelete",il_seq);
     }   
    public int InventoryDetailDelete(int il_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("il.InventoryDetailDelete",il_seq);
     }   
    
    public int getInventoryCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("il.getInventoryCount",paramMap);
     }
    
    
    
}