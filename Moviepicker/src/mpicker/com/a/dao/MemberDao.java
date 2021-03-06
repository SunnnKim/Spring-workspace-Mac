package mpicker.com.a.dao;

import java.util.List;

import mpicker.com.a.model.MemberDto;

public interface MemberDao {
	// Dao가 상속받는 interface
	
	// 사용할 함수를 선언해둔다
	public List<MemberDto> allMember();
	
	// join
	public boolean insertMember(MemberDto dto);
	// emailCheck
	public boolean emailCheck(String email);
	// login check
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
