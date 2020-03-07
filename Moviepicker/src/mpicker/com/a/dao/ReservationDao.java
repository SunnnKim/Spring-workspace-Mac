package mpicker.com.a.dao;

import java.util.List;

import mpicker.com.a.model.ReserveDto;

public interface ReservationDao {

	// insert reservation
	public boolean insertReservation(ReserveDto dto); 
	// get all list
	public List<ReserveDto> getAllReservation(int page);
	// get all contents number
	public int getAllContents();
	
}
