package com.spring.movie.member;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;

	@Override 
	public MemberVO getMember(MemberVO vo) {
		return memberDao.getMember(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);

	}

	@Override
	public String idFind(MemberVO vo) {
		return memberDao.idFind(vo);
	}

	@Override
	public String passwordFind(MemberVO vo) {
		return memberDao.passwordFind(vo);
	}

	@Override
	public void MemberList() {
		memberDao.MemberList();
	}
	
}
