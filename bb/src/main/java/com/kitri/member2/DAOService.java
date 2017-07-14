package com.kitri.member2;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memService")
public class DAOService implements Dao{
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private MemberMapper memberMapper;	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insert(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insertMember(m);
		
	}

	@Override
	public Member select(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member m = memberMapper.getMember(id);
		return m;
	}

	@Override
	public void update(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(m);
		
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.deleteMember(id);
		
	}

}
