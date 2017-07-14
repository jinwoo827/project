package com.kitri.aa;

import java.util.ArrayList;

public interface MemberDao {
	ArrayList<Member> getMembers();
	Member getMember(String name);
	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String name);

}
