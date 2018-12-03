package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.ProductCostDao;
import com.company.test.vo.ProductCostVo;


@Repository
public class ProductCostDaoImpl implements ProductCostDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<ProductCostVo> ProductCostList(Map<String,String> paramMap) throws SQLException {
		return query.selectList("pl.ProductCostList",paramMap);
    }
        
    public int ProductCostInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
		return query.insert("pl.ProductCostInsert",paramMap);
    }
    
    public int ProductCostUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("pl.ProductCostUpdate",paramMap);
     }
    
    public int ProductCostDelete(int pi_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("pl.ProductCostDelete",pi_seq);
     }
    
    public ProductCostVo getProductCost(int pi_seq) throws SQLException {
        
		return query.selectOne("pl.ProductCostOne",pi_seq);
    }
    
    public int getProductCostCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("pl.ProductCostCount",paramMap);
     }
    
    
    @Override
    public List<ProductCostVo> ProductCostBook(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pl.ProductCostBook",paramMap);
    }
    
    @Override
    public List<ProductCostVo> forSalesDetailPopup(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("pl.forSalesDetailPopup",paramMap);
    }
    
    @Override
    public List<ProductCostVo> ProductBuyBook(Map paramMap) throws SQLException {
        
		return query.selectList("pl.ProductBuyBook",paramMap);
    }
    
    public int getProductRows(Map paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("pl.getProductRows",paramMap);
     }
    
    
    public int ForSalesUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("pl.ForSalesUpdate",paramMap);
     }
    
       
}