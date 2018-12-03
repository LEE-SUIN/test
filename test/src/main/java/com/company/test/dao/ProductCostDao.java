package com.company.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.ProductCostVo;


public interface ProductCostDao {
	
    public List<ProductCostVo> ProductCostList(Map<String,String> paramMap) throws SQLException; //목록    
    public int ProductCostInsert(Map<String,String> paramMap) throws SQLException; //등록
    public ProductCostVo getProductCost(int se_seq) throws SQLException;// 하나 가져오기
    public int ProductCostUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int ProductCostDelete(int se_seq) throws SQLException; //삭제
    public int getProductCostCount(Map<String,String> paramMap) throws SQLException; //카운트 가져오기
    
    
    public List<ProductCostVo> ProductCostBook(Map<String,String> paramMap) throws SQLException; //대장
    
    public List<ProductCostVo> ProductBuyBook(Map paramMap) throws SQLException; //대장
    
    public List<ProductCostVo> forSalesDetailPopup(Map<String,String> paramMap) throws SQLException; //대장
    
    public int getProductRows(Map paramMap) throws SQLException; //카운트 가져오기
    
    public int ForSalesUpdate(Map<String,String> paramMap) throws SQLException; //구매 수정
}

