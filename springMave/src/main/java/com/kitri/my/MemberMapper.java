package com.kitri.my;

public interface MemberMapper {
	void insertMember(Member m);
	Member getMember(String id);
	void updateMember(Member m);
	void deleteMember(String id);

}
