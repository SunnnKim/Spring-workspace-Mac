package mpicker.com.a.service;

import java.util.List;

import mpicker.com.a.model.ReserveDto;

public interface ReservationService {

	
	// insert reservation
	public boolean insertReservation(ReserveDto dto);
	
	// get all reservation list
	public List<ReserveDto> getAllReservation(int page);
	
	// get all contents
	public int getAllContents();
}
