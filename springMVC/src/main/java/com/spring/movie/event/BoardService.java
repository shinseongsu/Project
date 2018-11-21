package com.spring.movie.event;

import java.util.List;

public interface BoardService {

	public List<BoardBean> BoardList(PagingVO vo);
	
	public int ListCount(PagingVO vo);
}
