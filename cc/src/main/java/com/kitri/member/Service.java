package com.kitri.member;

public interface Service {
	void join(Member m);
	Member getMember(String id);
	void editInfo(Member m);
	void delMember(String id);

}
