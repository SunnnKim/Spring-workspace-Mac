package sample.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sample.com.a.dao.MemberDao;
import sample.com.a.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";

	@Override
	public MemberDto test() {
		return sqlSession.selectOne(namespace + "test");
	}
	
	
	
}
