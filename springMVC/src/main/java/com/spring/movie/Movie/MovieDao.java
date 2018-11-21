package com.spring.movie.Movie;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("movieDao")
public class MovieDao extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactorty(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<MovieVO> ListMovie(){
		System.out.println("==> mybatis로  ListMovie() 기능 처리");
		List<MovieVO> list = new ArrayList();
			try {
				list = getSqlSession().selectList("Movie.ListMovie");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
	}
	
	public MovieVO getMovie(String title) {
		System.out.println("==>Mybatis로 getMovie() 기능 처리");
		MovieVO vo = new MovieVO();
		try {
			vo = getSqlSession().selectOne("Movie.getMovie",title);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	
}
