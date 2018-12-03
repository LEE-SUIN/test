package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.BuyManageDao;
import com.company.test.vo.BuyManageVo;

@Repository
public class BuyManageDaoImpl implements BuyManageDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<BuyManageVo> BuyEnterPriseList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("ab.BuyManageList",paramMap);
    }
        
    public int BuyManageInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("ab.BuyManageInsert",paramMap);
    }
    
    public int BuyManageUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("ab.BuyManageUpdate",paramMap);
     }
    
    public int BuyManageDelete(int ab_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("ab.BuyManageDelete",ab_seq);
     }
    
    public BuyManageVo getBuyManage(int ab_seq) throws SQLException {
        
		return query.selectOne("ab.BuyManageOne",ab_seq);
    }
    
    public int getBuyManageCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("ab.getBuyManageCount",paramMap);
     }
    
    
}