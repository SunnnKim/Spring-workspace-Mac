package mpicker.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mpicker.com.a.dao.ReservationDao;
import mpicker.com.a.model.MyReservationDto;
import mpicker.com.a.model.ReserveDto;
import mpicker.com.a.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationDao reservationDao;

	@Override
	public boolean insertReservation(ReserveDto dto) {
		return reservationDao.insertReservation(dto);
	}

	@Override
	public List<ReserveDto> getAllReservation(MyReservationDto dto) {
		return reservationDao.getAllReservation(dto);
	}

	@Override
	public int getAllContents() {
		return reservationDao.getAllContents();
	}

	@Override
	public ReserveDto getReserveDetail(int seq) {
		return reservationDao.getReserveDetail(seq);
	}

	@Override
	public boolean deleteReservation(int seq) {
		return reservationDao.deleteReservation(seq);
	}
	
}
