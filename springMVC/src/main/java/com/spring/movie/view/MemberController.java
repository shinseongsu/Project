package com.spring.movie.view;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.movie.member.MemberService;
import com.spring.movie.member.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/signup.do")
	public String signupForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("회원가입 폼으로 이동합니다.");
		return "signup.jsp";
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("로그인 폼으로 이동합니다.");
		return "login.jsp";
	}
	
	@RequestMapping(value="/login.do")
	public String login(MemberVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("주소받아들임");
		System.out.println("service에서 vo member에 들어가기 전에 값"+vo.getId());
		MemberVO member = memberService.getMember(vo);
		System.out.println("service에서 vo member에 들어가기 후에 값"+vo.getId());
		PrintWriter out = response.getWriter();
		
		if(member != null) {
			session.setAttribute("member", member.getId());
			request.setAttribute("id", member.getId());
			return "Main.jsp";
		}else {
			out.print("<script>");
			out.print("alert('아이디나 비밀번호를 다시 확인해주세요.');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return null;
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "Main.jsp";
	}
	
	@RequestMapping("/insertMember.do")
	public void join(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zip = request.getParameter("member_zip");
		String address = request.getParameter("member_addr1");
		String address1 = request.getParameter("member_addr2"); 
		
		vo.setTel(tel1+"-"+tel2+"-"+tel3);
		vo.setAddress("("+zip+")"+address+"-"+address1);
		
		memberService.insertMember(vo);
		out.print("<script>");
		out.print("alert('회원가입을 축하합니다.');");
		out.print("location.href='login.jsp';");
		out.print("</script>");
	}
	
	@RequestMapping("/idFind.do")
	public String idFind(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String setfrom = "tlstjdtn321@gamil.com";
		String tomail = request.getParameter("email");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
	
		String id = memberService.idFind(vo);
		String title = "[무비맥스]아이디 알려드립니다.";
		String content = "안녕하십니까? 무비 맥스입니다. 귀하의 아이디는"+id+"입니다.";
		
		  try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");

		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		out.println("<script>");
		out.println("alert('이메일 주소로 아이디를 보냈습니다.');");
		out.println("</script>");
		  
		return "redirect:/Main.jsp";
	}
	
	@RequestMapping("/passwordFind.do")
	public String passwordFind(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String setfrom = "tlstjdtn321@gamil.com";
		String tomail = request.getParameter("email");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		String password = memberService.passwordFind(vo);
		
		String title = "[무비맥스]비밀번호 알려드립니다.";
		String content = "안녕하십니까? 무비 맥스입니다. 귀하의 비밀번호는"+password+"입니다.";
		
		  try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");

		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		  
		out.println("<script>");
		out.println("alert('이메일 주소로 비밀번호를 보냈습니다.');");
		out.println("</script>");
		  
		return "Main.jsp";
		
	}
	@RequestMapping("/Find.do")
	public String Find(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		return "Find.jsp";
	}
	
	@RequestMapping("/test.do")
	public String test(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		return "";
	}
}
