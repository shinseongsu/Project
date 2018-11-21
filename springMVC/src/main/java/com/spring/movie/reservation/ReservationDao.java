package com.spring.movie.reservation;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reservationDao")
public class ReservationDao extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		 super.setSqlSessionFactory(sqlSessionFactory);
	 }
	
	public void getReservation(ReservationVO vo) {
		System.out.println("==>mybatis로 예약하기");
		
		try {
			getSqlSession().insert("Reservation.getReservation",vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
