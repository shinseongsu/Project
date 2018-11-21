package com.spring.movie.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("BoardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardBean> BoardList(PagingVO vo) {
		return boardDao.BoardList(vo);
	}

	@Override
	public int ListCount(PagingVO vo) {
		return boardDao.ListCount(vo);
	}
	
	
}
