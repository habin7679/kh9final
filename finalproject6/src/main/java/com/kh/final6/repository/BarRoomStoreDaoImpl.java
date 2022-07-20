package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.BarRoomStoreDto;
import com.kh.final6.entity.NoticeDto;
import com.kh.final6.entity.StoreDto;

@Repository
public class BarRoomStoreDaoImpl implements BarRoomStoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
		public int save(BarRoomStoreDto barRoomStoreDto) {
		
			int storeNo = sqlSession.selectOne("store.sequence");
			barRoomStoreDto.setStoreNo(storeNo);
			sqlSession.insert("store.insert",barRoomStoreDto);
			
			return storeNo;
					
		}

	@Override
	public int saveBar(BarRoomStoreDto barRoomStoreDto) {
		return sqlSession.insert("bar.insert",barRoomStoreDto);
		
	}
	
	@Override
	public int saveRoom(BarRoomStoreDto barRoomStoreDto) {
		
		return sqlSession.insert("room.insert",barRoomStoreDto);
		
	}

	@Override
	public int saveOff(BarRoomStoreDto barRoomStoreDto) {
		return sqlSession.insert("off.insert",barRoomStoreDto);
	}

	@Override
	public int edit(BarRoomStoreDto barRoomStoreDto) {
			return sqlSession.update("store.edit",barRoomStoreDto);
			
		
	}

	@Override
	public int editBar(BarRoomStoreDto barRoomStoreDto) {
		return sqlSession.update("bar.edit",barRoomStoreDto);
	}

	@Override
	public int editRoom(BarRoomStoreDto barRoomStoreDto) {
		return sqlSession.update("room.edit",barRoomStoreDto);
	}

	@Override
	public int editOff(BarRoomStoreDto barRoomStoreDto) {
		return sqlSession.update("off.edit",barRoomStoreDto);
	}

}
