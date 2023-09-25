package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	//로그인
	public UserVo userSelectOne(UserVo userVo) {
		System.out.println("UserDao.UserDao()");
		
		UserVo authUser = sqlSession.selectOne("user.selectAuthUser", userVo);
		
		return authUser;
	}
	
	
	
	//회원정보 저장(회원가입)
	public int userInsert(UserVo userVo) {
		System.out.println("UserDao.userInsert()");
		
		int count = sqlSession.insert("user.insert", userVo);
		
		return count;
	}
	

	//id체크
	public UserVo selectUserOneById(String id) {
		System.out.println("UserDao.selectUserOneById()");
		
		UserVo userVo = sqlSession.selectOne("user.selectUserOneById", id);
		
		return userVo;
	}
	
}







