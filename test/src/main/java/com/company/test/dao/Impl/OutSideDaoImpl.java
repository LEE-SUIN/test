package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.OutSideDao;
import com.company.test.vo.OutSideVo;
import com.company.test.vo.OutSideWorkVo;

@Repository
public class OutSideDaoImpl implements OutSideDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<OutSideVo> OutSideList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("oe.OutSideList",paramMap);
    }
        
    public int OutSideInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("oe.OutSideInsert",paramMap);
    }
    
    public int OutSideUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("oe.OutSideUpdate",paramMap);
     }
    
    public int OutSideDelete(int pi_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("oe.OutSideDelete",pi_seq);
     }
    
    public OutSideVo getOutSide(int pi_seq) throws SQLException {
        
		return query.selectOne("oe.OutSideOne",pi_seq);
    }
    
    public int getOutSideCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("oe.OutSideCount",paramMap);
     }
    
    
    public List<OutSideVo> OutSideEnterPrise(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("oe.OutSideEnterPrise",paramMap);
    }
    
    
    //외주 가공 품번 관리
    @Override
    public List<OutSideWorkVo> OutSideWorkList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("ow.OutSideWorkList",paramMap);
    }
        
    public int OutSideWorkInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("ow.OutSideWorkInsert",paramMap);
    }
    
    public int OutSideWorkUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("ow.OutSideWorkUpdate",paramMap);
     }
    
    public int OutSideWorkDelete(int pi_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("ow.OutSideWorkDelete",pi_seq);
     }
    
    public OutSideWorkVo getOutSideWork(int pi_seq) throws SQLException {
        
		return query.selectOne("ow.OutSideWorkOne",pi_seq);
    }
    
    public int getOutSideWorkCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("ow.OutSideWorkCount",paramMap);
     }
    
    
    //외주 업체 통계
    public List<OutSideVo> OutSideStats(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("oe.OutSideStats",paramMap);
    }
}