package mpicker.com.a.service;

import java.util.List;

import mpicker.com.a.model.MemberDto;


public interface MemberService {
	
	public List<MemberDto> allMember();
	// idCheck
	public boolean idCheck(String id);
	// join
	public boolean insertMember(MemberDto dto);
	// login
	public MemberDto login(MemberDto dto);

}
