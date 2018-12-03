package com.company.test.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.test.vo.NoticeBoardVo;

public interface NoticeBoardDao {
	
    public List<NoticeBoardVo> NoticeBoardList(Map<String,String> paramMap) throws SQLException; //목록    
    public int NoticeBoardInsert(Map<String,String> paramMap) throws SQLException; //등록
    public NoticeBoardVo getNoticeBoard(int bl_seq) throws SQLException;// 하나 가져오기
    public int NoticeBoardUpdate(Map<String,String> paramMap) throws SQLException; //수정
    public int NoticeBoardDelete(int bl_seq) throws SQLException; //삭제    
    public int getNoticeBoardCount(Map<String,String> paramMap) throws SQLException; //카우트 가져오기
    
    
}

