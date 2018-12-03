package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.NoticeBoardDao;
import com.company.test.vo.NoticeBoardVo;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<NoticeBoardVo> NoticeBoardList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("nl.NoticeBoardList",paramMap);
    }
        
    public int NoticeBoardInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
    	int seq = query.insert("nl.NoticeBoardInsert",paramMap);
    	return seq;
    }
    
    public int NoticeBoardUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("nl.NoticeBoardUpdate",paramMap);
     }
    
    public int NoticeBoardDelete(int bl_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("nl.NoticeBoardDelete",bl_seq);
     }
    
    public NoticeBoardVo getNoticeBoard(int bl_seq) throws SQLException {
        
		return query.selectOne("nl.NoticeBoardOne",bl_seq);
    }
    
    public int getNoticeBoardCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("nl.getNoticeBoardCount",paramMap);
     }
    
    
   
    
}