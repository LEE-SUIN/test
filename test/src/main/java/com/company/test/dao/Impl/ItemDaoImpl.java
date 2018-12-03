package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.ItemDao;
import com.company.test.vo.ItemVo;

@Repository
public class ItemDaoImpl implements ItemDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<ItemVo> ItemList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pi.ItemList",paramMap);
    }
        
    public int ItemInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		int seq = query.insert("pi.ItemInsert",paramMap);
    	return seq;
    }
    
    public int ItemUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("pi.ItemUpdate",paramMap);
     }
    
    public int ItemDelete(int pi_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("pi.ItemDelete",pi_seq);
     }
    
    public ItemVo getItem(int pi_seq) throws SQLException {
        
		return query.selectOne("pi.ItemOne",pi_seq);
    }
    
    public int getItemCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("pi.getItemCount",paramMap);
     }
    
    
}