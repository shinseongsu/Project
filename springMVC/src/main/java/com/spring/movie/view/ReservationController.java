package com.spring.movie.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.Movie.MovieService;
import com.spring.movie.Movie.MovieVO;
import com.spring.movie.reservation.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/Reservation.do")
	public ModelAndView getReservation(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		List<MovieVO> list = movieService.ListMovie();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/reservation.jsp");
		mv.addObject("list", list);
		
		
		return mv;
	}
}
