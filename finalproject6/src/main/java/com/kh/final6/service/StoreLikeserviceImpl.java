package com.kh.final6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final6.entity.StoreLikeDto;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.repository.StoreLikeDao;

@Service
public class StoreLikeserviceImpl implements StoreLikeservice {

	@Autowired
	private StoreLikeDao storelikeDao;
	@Autowired
	private StoreDao storeDao;

	@Override
	public int save(StoreLikeDto storelikeDto) {
		int likeNo = storelikeDao.insert(storelikeDto);
		return 0;
	}

	@Override
	public int save2(int store_no, int member_no) {

		int maxLike = storelikeDao.likemax();
		StoreLikeDto storeLikeDto = new StoreLikeDto();
		storeLikeDto.setLikeNo(maxLike+1);
		storeLikeDto.setMemberNo(member_no);
		storeLikeDto.setStoreNo(store_no);
		storeLikeDto.setLikeCheck(1);
		
		
		Integer storeCount = storelikeDao.findLike(storeLikeDto);
		if (storeCount > 0) {
			storeDao.likeMinus(store_no);
			storelikeDao.delete(storeLikeDto);
		} else {
			storeDao.likePlus(store_no);
			storelikeDao.insert(storeLikeDto);
		}
		// TODO Auto-generated method stub
		return 1;
	}

}
