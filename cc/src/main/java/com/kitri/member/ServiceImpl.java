package com.kitri.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component("memService")
public class ServiceImpl implements Service{
	@Resource(name="memDao")
	private Dao dao;
	
	public void setDao(Dao dao) {
		this.dao = dao;
	}

	@Override
	public void join(Member m) {
		// TODO Auto-generated method stub
		dao.insert(m);
		
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		return dao.select(id);
	}

	@Override
	public void editInfo(Member m) {
		// TODO Auto-generated method stub
		dao.update(m);
	}

	@Override
	public void delMember(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

}
