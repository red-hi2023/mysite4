package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	//리스트(검색X,페이징 X)
	public List<BoardVo> boardSelectList() {
		System.out.println("BoardDao.boardSelectList()");
		
		List<BoardVo> boardList = sqlSession.selectList("board.selectList");
		
		return boardList;
		
	}
	
	
	public List<BoardVo> selectList() {
		System.out.println("BoardDao>selectList()");

		List<BoardVo> boardList = sqlSession.selectList("board.selectList");

		return boardList;
	}
	
	
	
	
	
	//조회수 증가
	public int updateHit(int no) {
		System.out.println("BoardDao.updateHit()");
		
		int count = sqlSession.update("board.updateHit", no);
	
		return count;
	}
	
	
	//글1개 가져오기
	public BoardVo boardSelectOne(int no) {
		System.out.println("BoardDao.boardSelectOne()");
		
		BoardVo boardVo = sqlSession.selectOne("board.selectOne", no);
		
		return boardVo;
	}
	
	
}
