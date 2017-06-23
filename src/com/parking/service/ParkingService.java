package com.parking.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.dao.AdminDAOMySQL;
import com.parking.dao.ParkingDAOMySQL;
import com.parking.vo.Parking;

@Service
public class ParkingService {
	
	// --건들지 마시오--
	@Autowired
	ParkingDAOMySQL pDao;

	/**
	 * @author yeahni
	 * @comment 전체 주차장 정보 반환
	 * @return Collection<Parking> 주차장 리스트
	 */
	public Collection<Parking> readParkingList(){
		return pDao.selectAll();
	}
	
	/**
	 * @author yeahni
	 * @comment 전체 주차장 정보 반환
	 * @return Collection<Parking> 해당 주차장 정보
	 */
	public Parking readParkingDetail(int parking_code){
		return pDao.selectByCode(parking_code);
	}
	
}