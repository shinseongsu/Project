package com.spring.movie.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("reservationService")
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDao reservationDao;
	
	@Override
	public void getReservation(ReservationVO vo) {
		reservationDao.getReservation(vo);
		
	}

}
