package com.spring.movie.member;

public interface MemberService {
	
	public MemberVO getMember(MemberVO vo);
	
	public void insertMember(MemberVO vo);
	
	public String idFind(MemberVO vo);
	
	public String passwordFind(MemberVO vo);
	
	public void MemberList();
}
