package com.spring.movie.event;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<BoardBean> BoardList(PagingVO vo){
		System.out.println("==>Mybatis로 BoardList()기능처리");
		List<BoardBean> list = new ArrayList<>();
		try {
			list = getSqlSession().selectList("Board.BoardList", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int ListCount(PagingVO vo) {
		System.out.println("==>Mybatis로 ListCount 기능처리");
		int count = 0;
		try {
			count = getSqlSession().selectOne("Board.ListCount", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
