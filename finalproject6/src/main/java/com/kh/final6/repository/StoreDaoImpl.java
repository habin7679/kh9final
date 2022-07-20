package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.OffDayDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.vo.BarRoomVO;
import com.kh.final6.vo.StoreComplexSearchVO;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
		public StoreDto one(int storeNo) {
			return sqlSession.selectOne("store.one", storeNo);
	}

	@Override
		public List<StoreDto> list() {
			return sqlSession.selectList("store.list");
	}

	@Override
	public int insert(StoreDto storeDto) {
		int storeNo = sqlSession.selectOne("store.sequence");
		storeDto.setStoreNo(storeNo);
		return sqlSession.insert("store.insert", storeDto);
		
	}

	@Override
	public void delete(int storeNo) {
		int count = sqlSession.delete("store.delete",storeNo);
		if(count == 0) {
			throw new CannotFindException();
	}	
	
}

   
   @Override
	public BarRoomVO barRoom(int storeNo) {
		return sqlSession.selectOne("store.barRoom", storeNo);
	}
   
   @Override
	public OffDayDto offDayOne(int storeNo) {
		return sqlSession.selectOne("store.offDayOne",storeNo);
	}
   
   @Override
	public BarRoomVO cntBarRoom(String reservationDate, int storeNo) {
	   
	   Integer bar = sqlSession.selectOne("store.barCnt", reservationDate);
	   if(bar == null) {
		   bar = 0;
	   }
	   int roomFour = sqlSession.selectOne("store.roomFourCnt", reservationDate);
	   int roomSix = sqlSession.selectOne("store.roomSixCnt", reservationDate);
	   int roomEight = sqlSession.selectOne("store.roomEightCnt", reservationDate);
	   log.debug("@@@@ bar = {}", bar);
	   log.debug("@@@@ roomFour = {}", roomFour);
	   log.debug("@@@@ roomSix = {}", roomSix);
	   log.debug("@@@@ roomEight = {}", roomEight);
	   
	   BarRoomVO barRoomVO = barRoom(storeNo);
	   barRoomVO.setBarCount(bar);
	   barRoomVO.setRoomFour(roomFour);
	   barRoomVO.setRoomSix(roomSix);
	   barRoomVO.setRoomEight(roomEight);
	   
	   log.debug("@@@@@@@@@@@@@@@@@@@@@ barRoomVO = {}", barRoomVO);
	   
		return barRoomVO;
	}
   
   
	@Override
	public StoreDto update(StoreDto storeDto) {
		int count = sqlSession.update("store.update", storeDto);
		if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("store.one", storeDto.getStoreNo());
		}

	@Override
	public int selectReservationPrice(int storeNo) {
		return sqlSession.selectOne("store.price", storeNo);
		}
	
	@Override
	public List<StoreDto> complexSearch(String keyword) {
		List<StoreDto> list = sqlSession.selectList("store.complexSearch", keyword);
		return list;
	}
	
	//메인페이지 카테고리별 인기순 조회(스시)
	@Override
	public List<StoreDto> sList(int p, int s) {
		Map<String,Object> param = new HashMap<>();
		
		int end = p * s;
		int begin = end - (s-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("store.sList",param);
	}
	//메인페이지 카테고리별 인기순 조회(한우)
	@Override
	public List<StoreDto> cList(int p, int s) {
		Map<String,Object> param = new HashMap<>();
		
		int end = p * s;
		int begin = end - (s-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("store.cList",param);
	}
	//메인페이지 카테고리별 인기순 조회(디저트)
	@Override
	public List<StoreDto> dList(int p, int s) {
		Map<String,Object> param = new HashMap<>();
		
		int end = p * s;
		int begin = end - (s-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("store.dList",param);
	}
	//메인페이지 카테고리별 인기순 조회(꼬치)
	@Override
	public List<StoreDto> kList(int p, int s) {
		Map<String,Object> param = new HashMap<>();
		
		int end = p * s;
		int begin = end - (s-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("store.kList",param);
	}

	@Override
	public String name(int storeNo) {
		return sqlSession.selectOne("review.name",storeNo);
	}
}

