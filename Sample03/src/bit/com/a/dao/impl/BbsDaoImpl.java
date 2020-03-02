package bit.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsDto;
import bit.com.a.model.SearchDto;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace ="Bbs.";
	
	// all list
	@Override
	public List<BbsDto> getBbsList() {
		List<BbsDto> list = sqlSession.selectList(namespace+"bbslist");
		return list;
	
	}
	
	// paging list
	@Override
	public List<BbsDto> getBbsListPage(int page) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// insert Bbs
	@Override
	public boolean insertBbs(BbsDto dto) {
		int count = sqlSession.insert(namespace+"bbsinsert", dto);
		return count>0? true:false;
	}

	// get Bbs detail
	@Override
	public BbsDto bbsDetail(int seq) {
		BbsDto dto = sqlSession.selectOne(namespace+"bbsdetail", seq);
		return dto;
	}
	
	// readcount up
	@Override
	public void readcount(int seq) {
		sqlSession.update(namespace+"readcount",seq);
	}
	
	// delete Bbs
	@Override
	public boolean deleteBbs(int seq) {
		int count = sqlSession.update(namespace+"bbsdelete",seq);
		return count>0?true:false;
	}

	@Override
	public boolean updateBbs(BbsDto dto) {
		int count = sqlSession.update(namespace+"bbsupdate",dto);
		return count>0?true:false;
	}

	@Override
	public boolean replyInsert(BbsDto dto) {
		// change step number
		sqlSession.update(namespace + "changestep", dto.getSeq());
		// insert reply
		int count = sqlSession.update(namespace + "replyinsert", dto);
		return count>0?true:false;
	}
	// 검색하기
	@Override
	public List<BbsDto> searchBbs(SearchDto dto) {
		List<BbsDto> list = null;
		if(dto.getChoice().equals("id")) {
			list = sqlSession.selectList("searchid",dto.getSearchword());
		}else if(dto.getChoice().equals("title")) {
			list = sqlSession.selectList("searchtitle",dto.getSearchword());
		}else if(dto.getChoice().equals("content")) {
			list = sqlSession.selectList("searchcontent",dto.getSearchword());
		}
		return list;
	}
	


}
