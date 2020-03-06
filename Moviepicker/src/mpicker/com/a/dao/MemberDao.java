package mpicker.com.a.dao;

import java.util.List;

import mpicker.com.a.model.MemberDto;

public interface MemberDao {
	// Dao가 상속받는 interface
	
	// 사용할 함수를 선언해둔다
	public List<MemberDto> allMember();
	
	// idCheck
	public boolean idCheck(String id);
	// join
	public boolean insertMember(MemberDto dto);
	// login check
	public MemberDto loginCheck(MemberDto dto);
	
}
