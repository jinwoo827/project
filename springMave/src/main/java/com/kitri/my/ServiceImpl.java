package com.kitri.my;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memService")
public class ServiceImpl implements Service{
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private MemberMapper memberMapper;

	@Override
	public void join(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insertMember(m);
		
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getMember(id);
	}

	@Override
	public void editInfo(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(m);
	}

	@Override
	public void delMember(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.deleteMember(id);
	}

}
