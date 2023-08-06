package com.occu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.occu.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	// checkId
	public UserVo selectOne(String id) {
		System.out.println("UserDao checkId: " + id);
		
		UserVo userVo = sqlSession.selectOne("user.selectById", id);
		System.out.println("userVo idcheck: " + userVo);
		
		return userVo;
	}

	
}
