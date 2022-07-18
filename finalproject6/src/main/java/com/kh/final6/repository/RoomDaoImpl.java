package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.RoomDto;
import com.kh.final6.error.CannotFindException;


@Repository
public class RoomDaoImpl implements RoomDao{

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<RoomDto> list() {
		return sqlSession.selectList("room.list");
		
	}
	@Override
	public void delete(int storeNo) {
		sqlSession.delete("room.delete", storeNo);
	}
	@Override
	public RoomDto insert(RoomDto roomDto) {
		int storeNo = sqlSession.selectOne("room.sequence");
		roomDto.setStoreNo(storeNo);
		
		sqlSession.insert("room.write",roomDto);
		return roomDto;
	
	}
	@Override
	public RoomDto update(RoomDto roomDto) {
		int count = sqlSession.update("room.update", roomDto);
		if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("room.one", roomDto.getStoreNo());
	}
	
	
}
