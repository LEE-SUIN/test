package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.EmailSendVo;

public interface EmailSendDao {
	
    public List<EmailSendVo> EmailSendList(Map<String,String> paramMap) throws SQLException; //목록    
    public int EmailSendInsert(Map<String,String> paramMap) throws SQLException; //등록
    public EmailSendVo getEmailSend(int bl_seq) throws SQLException;// 하나 가져오기
    public int EmailSendUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int EmailSendDelete(int bl_seq) throws SQLException; //삭제    
    public int getEmailSendCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    public List<EmailSendVo> EmailSendCodeList(Map<String,String> paramMap) throws SQLException; //목록
    public int EmailSendCodeInsert(Map<String,String> paramMap) throws SQLException; //등록
    public int EmailSendCodeUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int EmailSendCodeUseUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int EmailSendCodeDelete(int bl_seq) throws SQLException; //삭제
    
    
    public List<EmailSendVo> EmailSendBonusList(Map<String,String> paramMap) throws SQLException; //목록
    public int EmailSendBonusUpdate(Map<String,String> paramMap) throws SQLException; //수정
    
    
    
}

