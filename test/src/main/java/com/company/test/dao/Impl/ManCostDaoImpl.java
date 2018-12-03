package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.ManCostDao;
import com.company.test.vo.ManCostVo;

@Repository
public class ManCostDaoImpl implements ManCostDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
        
    public int ManCostUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("mc.ManCostUpdate",paramMap);
     }
        
    public ManCostVo getManCost() throws SQLException {
        
		return query.selectOne("mc.ManCostOne");
    }
        
    
}