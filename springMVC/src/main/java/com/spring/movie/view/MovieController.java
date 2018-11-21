package com.spring.movie.view;

import java.io.BufferedInputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.movie.Movie.MovieCd;
import com.spring.movie.Movie.MovieService;
import com.spring.movie.Movie.MovieVO;
import com.spring.movie.Movie.OpenApi;
import com.sun.javafx.scene.paint.GradientUtils.Parser;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/Moviechart.do")
	public String Moviechart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		List<MovieVO> list = movieService.ListMovie();
		request.setAttribute("list", list);
		
		return "Moviechart.jsp";
	}
	
	@RequestMapping("/movie.do")
	public String Movie(MovieVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String title = request.getParameter("title");
		vo = movieService.getMovie(title);
		
		request.setAttribute("movie", vo);
		
		return "MovieExplain.jsp";
	}
	

	@RequestMapping("/introduce.do")
	public String introduce(OpenApi api,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String urlAdd = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=596ca9819c94f2153eeb10d3576ebf03&targetDt=";
		String date = request.getParameter("date");
		if(date == null) {
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -1);
			String year = Integer.toString(cal.get(Calendar.YEAR));
			String month = String.valueOf(cal.get(Calendar.MONTH) +1);
			String DAY_OF_MONTH = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
			date = year + month + DAY_OF_MONTH;
		}
		urlAdd += date;
		System.out.println(date);
		URL url =  new URL(urlAdd);
		BufferedInputStream reader = null;
		reader = new BufferedInputStream(url.openStream()); // 경로 가공

        StringBuffer buffer = new StringBuffer();			
        int i;
        byte[] b = new byte[4096];
        while( (i = reader.read(b)) != -1){
          buffer.append(new String(b, 0, i));				// 원하는 값
        }
        
        
        String test = buffer.toString();
        System.out.println("test="+test);
        JSONParser jsonParse = new JSONParser();
        
        JSONObject jsonObj = (JSONObject) jsonParse.parse(test);
        System.out.println("jsonObj=" + jsonObj);
        JSONObject dailyBoxOfficeList1 = (JSONObject)jsonObj.get("boxOfficeResult");
        System.out.println("dailyBoxOfficeList1 =" + dailyBoxOfficeList1);
        JSONArray dailyBoxOfficeList = (JSONArray)dailyBoxOfficeList1.get("dailyBoxOfficeList");
        System.out.println("dailyBoxOfficeList=" + dailyBoxOfficeList);
        
        
        
        List<OpenApi> list = new ArrayList();
        
        for(int j =0 ; j < dailyBoxOfficeList.size() ; j++) {
        	OpenApi vo = new OpenApi();
	        JSONObject dailyObject = (JSONObject) dailyBoxOfficeList.get(j);
	        vo.setMovieNm(dailyObject.get("movieNm").toString());
	        vo.setRank(dailyObject.get("rank").toString());
	        vo.setMovieCd(dailyObject.get("movieCd").toString());
	        vo.setOpenDt(dailyObject.get("openDt").toString());
	        vo.setAudiCnt(dailyObject.get("audiCnt").toString());
	        vo.setAudiAcc(dailyObject.get("audiAcc").toString());
	        vo.setSalesAmt(dailyObject.get("salesAmt").toString());
	        list.add(vo);
        }
        
        request.setAttribute("openapi", list);
        
        return "introduce.jsp";
	}
	
	@RequestMapping("/movieExplain.do")
	public String movieCd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String urladd = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=596ca9819c94f2153eeb10d3576ebf03&movieCd=";
		String movieCd = request.getParameter("movie");
		urladd += movieCd;
		
		URL url =  new URL(urladd);
		BufferedInputStream reader = null;
		reader = new BufferedInputStream(url.openStream());
		
		StringBuffer buffer = new StringBuffer();			
	    int i;
	    byte[] b = new byte[4096];
	    while( (i = reader.read(b)) != -1){
	    	buffer.append(new String(b, 0, i));				// 원하는 값
	    }
	    
	    String test = buffer.toString();
        System.out.println("test="+test);
        JSONParser jsonParse = new JSONParser();
        
        JSONObject jsonObj = (JSONObject) jsonParse.parse(test);
        JSONObject movieInfo = (JSONObject)jsonObj.get("movieInfoResult");
        System.out.println("movieInfo="+movieInfo);
        JSONObject movieResult = (JSONObject)movieInfo.get("movieInfo");
        System.out.println("movieResult====="+movieResult);
        
        MovieCd vo = new MovieCd();
        
        
        JSONArray nation = (JSONArray)movieResult.get("nations");
        for(int j =0 ; j< nation.size(); j++) {
        	JSONObject returnnation = (JSONObject)nation.get(j);
        	vo.setNationNm(returnnation.get("nationNm").toString());
        	System.out.println("nation:" + returnnation.get("nationNm"));
        }
        
        JSONArray genres = (JSONArray)movieResult.get("genres");
        for(int j= 0; j< genres.size(); j++) {
        	JSONObject returngenreNm = (JSONObject)genres.get(j);
        	System.out.println("genre:" + returngenreNm.get("genreNm"));
        	vo.setGenreNm(returngenreNm.get("genreNm").toString());
        }
        
        JSONArray directors = (JSONArray)movieResult.get("directors");
        for(int j = 0 ; j < directors.size(); j++) {
        	JSONObject returndirectors = (JSONObject)directors.get(j);
        	System.out.println("directors:" + returndirectors.get("peopleNm"));
        	vo.setDirectors(returndirectors.get("peopleNm").toString());
        }
        
        JSONArray actors = (JSONArray)movieResult.get("actors");
        String array = "";
        for(int j = 0 ; j<actors.size() ; j++) {
        	JSONObject returnactors = (JSONObject)actors.get(j);
        	System.out.println("actors:"+returnactors.get("peopleNm"));
        	if(returnactors.get("peopleNm") != null) {
        		array += returnactors.get("peopleNm")+",";
        	}
        }
        vo.setActors(array);
        
        JSONArray showTypes = (JSONArray)movieResult.get("showTypes");

        for(int j = 0 ; j<showTypes.size(); j++) {
        	JSONObject returnshowTypes = (JSONObject)showTypes.get(j);
        	System.out.println(returnshowTypes.get("showTypeGroupNm")+":"+returnshowTypes.get("showTypeNm"));
        	vo.setShowTypeGroupNm(vo.getShowTypeGroupNm()+","+returnshowTypes.get("showTypeGroupNm").toString()+":"+returnshowTypes.get("showTypeNm"));
        	/*vo.setShowTypes(vo.getShowTypes()+","+returnshowTypes.get("showTypeNm").toString());*/
        }
        
        JSONArray companys = (JSONArray)movieResult.get("companys");
        for(int j = 0 ; j<companys.size(); j++) {
        	JSONObject returnaudits = (JSONObject)companys.get(j);
        	System.out.println(returnaudits.get("companyPartNm")+":"+returnaudits.get("companyNm")+"("+returnaudits.get("companyNmEn")+")");
        	vo.setCompanyPartNm(vo.getCompanyPartNm()+","+returnaudits.get("companyPartNm"));
        	vo.setCompanyNm(vo.getCompanyNm()+","+returnaudits.get("companyNm")+"("+returnaudits.get("companyNmEn")+")");
        }
        
        JSONArray audits = (JSONArray)movieResult.get("audits");
        for(int j = 0 ; j < audits.size(); j++) {
        	JSONObject returncompanys = (JSONObject)audits.get(j);
        	System.out.println(returncompanys.get("auditNo") + "," + returncompanys.get("watchGradeNm"));
        	vo.setAuditNo(returncompanys.get("auditNo").toString());
        	vo.setWatchGradeNm(returncompanys.get("watchGradeNm").toString());
        }
        
        
        System.out.println("입력할꺼:"+movieResult.get("movieNm").toString());
        vo.setMovieNm(movieResult.get("movieNm").toString()); 
        System.out.println(movieResult.get("movieNm"));
        vo.setMovieNmEn(movieResult.get("movieNmEn").toString());
        System.out.println(movieResult.get("movieNmEn"));
        vo.setShowTm(movieResult.get("showTm").toString());
        System.out.println(movieResult.get("showTm"));
        vo.setPrdtYear(movieResult.get("openDt").toString());
        System.out.println(movieResult.get("openDt"));
        vo.setPrdtStatNm(movieResult.get("prdtStatNm").toString());
        System.out.println(movieResult.get("prdtStatNm"));
        vo.setTypeNm(movieResult.get("typeNm").toString());
        System.out.println(movieResult.get("typeNm"));
        vo.setMovieCd(movieResult.get("movieCd").toString());
        System.out.println(movieResult.get("movieCd"));
        
        request.setAttribute("vo", vo);
        
		
        
		return "movieCd.jsp";
	}
}
