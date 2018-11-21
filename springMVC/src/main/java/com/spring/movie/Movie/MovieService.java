package com.spring.movie.Movie;

import java.util.List;

public interface MovieService {

	public List<MovieVO> ListMovie();
	
	public MovieVO getMovie(String title);
}
