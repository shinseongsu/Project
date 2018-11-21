package com.spring.movie.Movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("movieService")
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao movieDao;
	
	@Override
	public List<MovieVO> ListMovie() {
		return movieDao.ListMovie();
	}

	@Override
	public MovieVO getMovie(String title) {
		return movieDao.getMovie(title);
	}
	
}
