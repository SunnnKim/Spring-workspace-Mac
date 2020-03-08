package mpicker.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mpicker.com.a.dao.MemberDao;
import mpicker.com.a.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	// DB와 통신을 하는 부분
	
	@Autowired 		// <- 객체 생성 (의존성 : Spring에 의존함,Spring에 설정에서 이미 선언되있고 매핑하여 가져옴)
	SqlSession sqlSession; 
	String namespace = "Member.";
	
	// 상속한 함수를 오버라이딩 한다.
	@Override
	public List<MemberDto> allMember() {	
		// 테이블의 모든 데이터를 가져온다 
		List<MemberDto> list = sqlSession.selectList(namespace+"allMember");
		return list;
	}

	// 회원가입 : 이메일 중복체크 
	@Override
	public boolean emailCheck(String email) {
		int idExist = sqlSession.selectOne(namespace+"emailcheck",email);
		if(idExist>0) {
			return true;
		}
		return false;
	}
	
	// 회원가입 : insert member
	@Override
	public boolean insertMember(MemberDto dto) {
		int success = sqlSession.insert(namespace+"insertmember",dto);
		if(success>0) { return true; }
		else return false;
	}
	
	// 로그인 : login check
	@Override
	public MemberDto loginCheck(MemberDto dto) {
		MemberDto loginuser = sqlSession.selectOne(namespace+"logincheck",dto);
		return loginuser;
	}

	@Override
	public boolean pwdCheck(MemberDto dto) {
		int count = sqlSession.selectOne(namespace+"pwdcheck",dto);
		return count>0?true:false;
	}

	// 마이 페이지 : 회원정보 모두 수정
	@Override
	public boolean updateAll(MemberDto dto) {
		int count = sqlSession.update(namespace+"updateall",dto);
		return count>0?true:false;
	}

	// 마이 페이지 : 회원정보 이름만 수정
	@Override
	public boolean updateName(MemberDto dto) {
		int count = sqlSession.update(namespace+"updatename",dto);
		System.out.println("update name");
		return count>0?true:false;
	}

	// 마이페이지 : 회원 탈퇴하기 
	@Override
	public boolean deleteAccount(String email) {
		int count = sqlSession.update("deletemember", email);
		return count>0?true:false;
	}
	
	
	
	
}
