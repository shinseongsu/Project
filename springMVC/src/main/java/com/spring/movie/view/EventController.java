package com.spring.movie.view;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.event.BoardBean;
import com.spring.movie.event.BoardService;
import com.spring.movie.event.PagingVO;

@Controller
public class EventController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/Event.do")
	public ModelAndView event(HttpSession session, HttpServletRequest request,HttpServletResponse response, PagingVO vo) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ModelAndView mv = new ModelAndView();
		
		int page = 1;
		int limit = 5;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String find_name= "";
		if(request.getParameter("find_name")!=null) {
			find_name=request.getParameter("find_name");
		}
		
		String find_field= "";
		if(request.getParameter("find_field")!=null) {
			find_field=request.getParameter("find_field");
		}
		
		vo.setFind_name(find_name);
		vo.setFind_field(find_field);
		vo.setPage(page*limit);
		vo.setLimit(((page-1)*limit)+1);
		
		System.out.println(vo.getFind_name());
		int listcount = boardService.ListCount(vo);
		System.out.println("listcount="+listcount);
		
		
		System.out.println(vo.getPage());
		List<BoardBean> BoardList = boardService.BoardList(vo);
		
		int maxpage = 0;
		if(listcount%limit==0) {
			maxpage=listcount/limit;
		}else {
			maxpage=listcount/limit+1;
		}
		
		int startpage = (((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage = maxpage;
		
		if(endpage>startpage+limit-1) endpage = startpage+limit-1;
		
		mv.setViewName("/event.jsp");
		mv.addObject("listCount",listcount);
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("BoardList",BoardList);
		mv.addObject("find_name",find_name);
		mv.addObject("find_field",find_field);
		
		return mv;
	}
	
	
}
