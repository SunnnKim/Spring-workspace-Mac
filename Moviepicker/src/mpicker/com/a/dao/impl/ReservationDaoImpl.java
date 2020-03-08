package mpicker.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mpicker.com.a.dao.ReservationDao;
import mpicker.com.a.model.MyReservationDto;
import mpicker.com.a.model.ReserveDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Reservation.";
	
	@Override
	public boolean insertReservation(ReserveDto dto) {
		
		int count = sqlSession.insert(namespace + "insertReservation",dto);
		
		return count>0?true:false;
	}

	@Override
	public List<ReserveDto> getAllReservation(MyReservationDto dto) {
		List<ReserveDto> list = sqlSession.selectList(namespace + "reservationlist", dto);
		return list;
	}

	@Override
	public int getAllContents() {
		int number = sqlSession.selectOne(namespace+"numberofcontents");
		return number;
	}

	@Override
	public ReserveDto getReserveDetail(int seq) {
		ReserveDto dto = sqlSession.selectOne(namespace+"reservationdetail", seq);
		return dto;
	}

	@Override
	public boolean deleteReservation(int seq) {
		int count = sqlSession.update("deletereservation",seq);
		return count >0 ? true:false ;
	}

	
	
}
