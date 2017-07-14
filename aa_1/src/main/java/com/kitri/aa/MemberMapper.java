package com.kitri.aa;

import java.util.ArrayList;

public interface MemberMapper {
	ArrayList<Member> getMembers();
	Member getMember(String id);
	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String id);

}
