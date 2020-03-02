package bit.com.a.service;

import java.util.List;

import bit.com.a.model.BbsDto;
import bit.com.a.model.SearchDto;

public interface BbsService {
	public List<BbsDto> getBbsList();
	public List<BbsDto> getBbsListPage(int page);
	public boolean insertBbs(BbsDto dto);
	public BbsDto bbsDetail(int seq);
	public void readcount(int seq);
	public boolean deleteBbs(int seq);
	public boolean updateBbs(BbsDto dto);
	public boolean replyInsert(BbsDto dto);
	public List<BbsDto> searchBbs(SearchDto dto);

}
