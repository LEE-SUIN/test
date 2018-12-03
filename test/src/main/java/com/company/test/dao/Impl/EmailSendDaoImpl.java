package com.company.test.dao.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.test.dao.EmailSendDao;
import com.company.test.vo.EmailSendVo;

@Repository
public class EmailSendDaoImpl implements EmailSendDao {
         
    @Autowired
    private SqlSession query;
    		
    @Override
    public List<EmailSendVo> EmailSendList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("el.EmailSendList",paramMap);
    }
        
    public int EmailSendInsert(Map<String,String> paramMap) throws SQLException {
       // query.selectOne("su.loginCheck", UserVo);
    	int seq = query.insert("el.EmailSendInsert",paramMap);
    	return seq;
    }
    
    public int EmailSendUpdate(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.update("el.EmailSendUpdate",paramMap);
     }
    
    public int EmailSendDelete(int bl_seq) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.delete("el.EmailSendDelete",bl_seq);
     }
    
    public EmailSendVo getEmailSend(int bl_seq) throws SQLException {
        
		return query.selectOne("el.EmailSendOne",bl_seq);
    }
    
    public int getEmailSendCount(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
    	
 		return query.selectOne("el.getEmailSendCount",paramMap);
     }
    
    
    
    @Override
    public List<EmailSendVo> EmailSendCodeList(Map<String,String> paramMap) throws SQLException {
        
		return query.selectList("el.EmailSendCodeList",paramMap);
    }
    
    public int EmailSendCodeInsert(Map<String,String> paramMap) throws SQLException {
        // query.selectOne("su.loginCheck", UserVo);
     	int seq = query.insert("el.EmailSendCodeInsert",paramMap);
     	return seq;
     }
     
     public int EmailSendCodeUpdate(Map<String,String> paramMap) throws SQLException {
         // query.selectOne("su.loginCheck", UserVo);
     	
  		return query.update("el.EmailSendCodeUpdate",paramMap);
      }
     
     public int EmailSendCodeDelete(int bl_seq) throws SQLException {
         // query.selectOne("su.loginCheck", UserVo);
     	
  		return query.delete("el.EmailSendCodeDelete",bl_seq);
      }
    
     
     public int EmailSendCodeUseUpdate(Map<String,String> paramMap) throws SQLException {
         // query.selectOne("su.loginCheck", UserVo);
     	
  		return query.update("el.EmailSendCodeUseUpdate",paramMap);
      }
     
     
     
     @Override
     public List<EmailSendVo> EmailSendBonusList(Map<String,String> paramMap) throws SQLException {
         
 		return query.selectList("el.EmailSendBonusList",paramMap);
     }
     
     public int EmailSendBonusUpdate(Map<String,String> paramMap) throws SQLException {
         // query.selectOne("su.loginCheck", UserVo);
     	
  		return query.update("el.EmailSendBonusUpdate",paramMap);
      }
}