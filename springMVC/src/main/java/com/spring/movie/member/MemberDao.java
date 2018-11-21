package com.spring.movie.member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		 super.setSqlSessionFactory(sqlSessionFactory);
	 }
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("==>Mybatis로 getMember() 기능 처리"); 
		
		try {
			vo = getSqlSession().selectOne("Member.getMember",vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public void insertMember(MemberVO vo) {
		
		System.out.println("==>Mybatis로 insertMember() 기능 처리");
		getSqlSession().insert("Member.insertMember",vo);
	}
	
	public String idFind(MemberVO vo) {
		System.out.println("아이디 찾기를 시작합니다.");
		String id="";
		try {
			id = getSqlSession().selectOne("Member.idFind",vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public String passwordFind(MemberVO vo) {
		System.out.println("비밀번호 찾기를 시작합니다.");
		String password = "";
		try {
			password = getSqlSession().selectOne("Member.passwordFind", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return password;
	}
	
	public List<MemberVO> MemberList(){
		List<MemberVO> list = new ArrayList<>();
		try {
			list = getSqlSession().selectList("Member.MemberList");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
