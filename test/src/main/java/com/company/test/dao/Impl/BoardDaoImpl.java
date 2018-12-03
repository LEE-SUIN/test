package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.BoardDao;
import com.company.test.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<BoardVo> BoardList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("bl.BoardList",paramMap);
    }
        
    public int BoardInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
    	int seq = query.insert("bl.BoardInsert",paramMap);
    	return seq;
    }
    
    public int BoardUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("bl.BoardUpdate",paramMap);
     }
    
    public int BoardDelete(int bl_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("bl.BoardDelete",bl_seq);
     }
    
    public BoardVo getBoard(int bl_seq) throws SQLException {
        
		return query.selectOne("bl.BoardOne",bl_seq);
    }
    
    public int getBoardCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("bl.getBoardCount",paramMap);
     }
    
    
   
    
}