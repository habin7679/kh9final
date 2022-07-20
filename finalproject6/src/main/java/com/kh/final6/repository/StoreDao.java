package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.OffDayDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.vo.BarRoomVO;
import com.kh.final6.vo.StoreComplexSearchVO;

public interface StoreDao {

	List<StoreDto> list();

	StoreDto one(int storeNo);

	void delete(int storeNo);

	int insert(StoreDto storeDto);

	StoreDto update(StoreDto storeDto);

	int selectReservationPrice(int storeNo);

	BarRoomVO barRoom(int storeNo);

	OffDayDto offDayOne(int storeNo);


	BarRoomVO cntBarRoom(String reservationDate, int storeNo);
	
	//가게 통합검색
	List<StoreDto> complexSearch(String keyword);

	// 메인페이지 인기순(6개) 가게 조회(스시)
	List<StoreDto> sList(int p, int s);
	// 메인페이지 인기순(6개) 가게 조회(한우)
	List<StoreDto> cList(int p, int s);
	// 메인페이지 인기순(6개) 가게 조회(디저트)
	List<StoreDto> dList(int p, int s);
	// 메인페이지 인기순(6개) 가게 조회(꼬치)
	List<StoreDto> kList(int p, int s);
	
	//메인페이지 리뷰 가게이름 조회
	String name(int storeNo);



	List<StoreDto> categorySearch(String category);
	
	int likePlus(int storeNo);

	int likeMinus(int storeNo);


}
