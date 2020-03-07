package mpicker.com.a.service;

import java.util.List;

import mpicker.com.a.model.MemberDto;


public interface MemberService {
	
	public List<MemberDto> allMember();
	// join
	public boolean insertMember(MemberDto dto);
	// idCheck
	public boolean emailCheck(String email);
	// login
	public MemberDto loginCheck(MemberDto dto);

}
