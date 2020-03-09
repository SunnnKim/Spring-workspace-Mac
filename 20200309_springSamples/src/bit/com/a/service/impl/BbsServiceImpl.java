package bit.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsDto;
import bit.com.a.model.SearchDto;
import bit.com.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {
	
	
	@Autowired
	BbsDao bbsDao;
	
	@Override
	public List<BbsDto> getBbsList() {
		return bbsDao.getBbsList();
	}
//
//	@Override
//	public List<BbsDto> getBbsListPage(int page) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public boolean insertBbs(BbsDto dto) {
//		return bbsDao.insertBbs(dto);
//	}
//
//	@Override
//	public BbsDto bbsDetail(int seq) {
//		return bbsDao.bbsDetail(seq);
//	}
//
//	@Override
//	public void readcount(int seq) {
//		bbsDao.readcount(seq);
//	}
//
//	@Override
//	public boolean deleteBbs(int seq) {
//		return bbsDao.deleteBbs(seq);
//	}
//
//	@Override
//	public boolean updateBbs(BbsDto dto) {
//		return bbsDao.updateBbs(dto);
//	}
//
//	@Override
//	public boolean replyInsert(BbsDto dto) {
//		return bbsDao.replyInsert(dto);
//	}
//
//	@Override
//	public List<BbsDto> searchBbs(SearchDto dto) {
//		return bbsDao.searchBbs(dto);
//	}

}
