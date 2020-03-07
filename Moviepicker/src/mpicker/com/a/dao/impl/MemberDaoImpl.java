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
	
	// 마이페이지 : 내 정보 불러오기 (auth != 0)
	
	// 마이 페이지 : 회원정보 수정
	
	// 마이페이지 : 회원탈퇴하기 (auth = 0)
	
	
	
}
