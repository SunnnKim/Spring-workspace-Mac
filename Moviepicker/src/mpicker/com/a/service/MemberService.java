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
	// pwd check
	public boolean pwdCheck(MemberDto dto);
	// update all
	public boolean updateAll(MemberDto dto);
	// update name
	public boolean updateName(MemberDto dto);
	// delete account
	public boolean deleteAccount(String email);
}
