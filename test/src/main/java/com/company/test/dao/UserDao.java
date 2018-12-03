package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.CodeVo;
import com.company.test.vo.UserVo;

public interface UserDao {
	
    public List<UserVo> UserList(Map<String,String> paramMap) throws SQLException; //사용자 목록
    public UserVo LoginCheck(HashMap<String, Object> map) throws SQLException; // 로그인 체크
    public int userInsert(Map<String,String> paramMap) throws SQLException; //사용자 등록
    public UserVo getUser(int sc_seq) throws SQLException;// 하나 가져오기
    public int userUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int userPasswordUpdate(Map<String,String> paramMap) throws SQLException; //비밀번호수정
    public int userDelete(int su_seq) throws SQLException; //삭제
    
    public List<UserVo> UserStats(Map<String,String> paramMap) throws SQLException; //사용자 목록
    
}

