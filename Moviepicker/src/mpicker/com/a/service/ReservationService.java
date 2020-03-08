package mpicker.com.a.service;

import java.util.List;

import mpicker.com.a.model.MyReservationDto;
import mpicker.com.a.model.ReserveDto;

public interface ReservationService {

	
	// insert reservation
	public boolean insertReservation(ReserveDto dto);
	
	// get all reservation list
	public List<ReserveDto> getAllReservation(MyReservationDto dto);
	
	// get all contents
	public int getAllContents();
	
	// get reservation detail
	public ReserveDto getReserveDetail(int seq);
	
	// delete reservation 
	public boolean deleteReservation(int seq);
}
