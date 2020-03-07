package mpicker.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mpicker.com.a.dao.ReservationDao;
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
	public List<ReserveDto> getAllReservation(int page) {
		List<ReserveDto> list = sqlSession.selectList(namespace + "reservationlist", page);
		return list;
	}

	@Override
	public int getAllContents() {
		int number = sqlSession.selectOne(namespace+"numberofcontents");
		return number;
	}

	
	
}
