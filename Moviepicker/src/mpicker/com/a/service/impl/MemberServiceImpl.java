package mpicker.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mpicker.com.a.dao.MemberDao;
import mpicker.com.a.model.MemberDto;
import mpicker.com.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	// Dao에 있는 데이터를 편집하여 controller에 던져준다
	
	// Dao객체를 선언하지 않고 autowired annotation을 해줌
	@Autowired		// 자동적으로 Dao를 넣어줌 (의존성)
	MemberDao memberDao;
	
	@Override
	public List<MemberDto> allMember() {
		return memberDao.allMember();
	}

	@Override
	public boolean emailCheck(String email) {
		return memberDao.emailCheck(email);
	}

	@Override
	public boolean insertMember(MemberDto dto) {
		return memberDao.insertMember(dto);
	}

	@Override
	public MemberDto loginCheck(MemberDto dto) {
		return memberDao.loginCheck(dto);
	}
	
	
}
