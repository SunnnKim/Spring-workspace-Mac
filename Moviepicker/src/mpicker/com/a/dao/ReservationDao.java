package mpicker.com.a.dao;

import java.util.List;

import mpicker.com.a.model.MyReservationDto;
import mpicker.com.a.model.ReserveDto;

public interface ReservationDao {

	// insert reservation
	public boolean insertReservation(ReserveDto dto); 
	
	// get all list
	public List<ReserveDto> getAllReservation(MyReservationDto dto);
	
	// get all contents number
	public int getAllContents();
	
	// get reservation detail
	public ReserveDto getReserveDetail(int seq);
	
	// delete reservation
	public boolean deleteReservation(int seq);
	

	
}
