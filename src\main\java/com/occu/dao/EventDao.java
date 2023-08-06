package com.occu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.occu.vo.EventVo;

@Repository
public class EventDao {

	@Autowired
	private SqlSession sqlSession;
	
	
//	public String insertForm(String data) {
//		
//		sqlSession.insert("eventSeller.insertForm", data);
//		
////		if() {
////			sqlSession.selectOne(statement, parameter)
////		}
//		return "";
//	}
	
	
	public int insertFormData(EventVo eventVo) {
		System.out.println("EventDao1: " + eventVo);

		int result = sqlSession.insert("eventSeller.insertForm", eventVo);
		
		System.out.println("EventDao2: " + eventVo);
		
		return result;
		
	}
	
	
	public EventVo selectFormNo(EventVo eventVo) {
		
		System.out.println("EventDao selectFormNo: " + eventVo);
		
		EventVo vo = sqlSession.selectOne("eventSeller.selectForm", eventVo);
		System.out.println("EventDao formNo check: " + vo.toString());
		
		return vo;
	}
	
	public EventVo selectFormData(int formNo) {
		System.out.println("EventDao selectFormData: " + formNo);
		
		EventVo vo = sqlSession.selectOne("eventSeller.selectFormInfo", formNo);
		System.out.println("at EventDao... all of em: " + vo.toString());
		
		return vo;
	}
	
}
