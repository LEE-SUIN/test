package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.WorkDao;
import com.company.test.vo.WorkVo;

@Repository
public class WorkDaoImpl implements WorkDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<WorkVo> WorkList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pw.WorkList",paramMap);
    }
        
    public int WorkInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("pw.WorkInsert",paramMap);
    }
    
    public int WorkUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("pw.WorkUpdate",paramMap);
     }
    
    public int WorkDelete(int pi_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("pw.WorkDelete",pi_seq);
     }
    
    public WorkVo getWork(int pi_seq) throws SQLException {
        
		return query.selectOne("pw.WorkOne",pi_seq);
    }
    
    public int getWorkCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("pw.getWorkCount",paramMap);
     }
    
    public List<WorkVo> WorkState(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pw.WorkState",paramMap);
    }
    
    public List<WorkVo> WorkStats(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pw.WorkStats",paramMap);
    }
}