
package com.kh.final6.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.BarDto;
import com.kh.final6.entity.RoomDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.RoomDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.repository.StoreLikeDao;
import com.kh.final6.service.StoreLikeservice;

import lombok.RequiredArgsConstructor;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/rest/store")
@RequiredArgsConstructor
public class StroeRestContoller {

	@Autowired
	private StoreDao storeDao;
	private StoreDto storeDto;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private StoreLikeDao storeLikeDao;

	// 의존성 주입의 최고 방법 (Autowired 는 단점이 많음)
	private final StoreLikeservice storeLikeservice;

	@GetMapping("/")
	public List<StoreDto> list() {
		return storeDao.list();
	}

	@GetMapping("/{storeNo}")
	public StoreDto one(@PathVariable int storeNo) {
		System.out.println("스토어 넘버" + storeNo);
		return storeDao.one(storeNo);
	}
	// @PostMapping("/")
//	public StoreDto insert(@RequestBody StoreDto storeDto) {
//		return storeDao.insert(storeDto);
//	}

	@PutMapping("/")
	public StoreDto update(@RequestBody StoreDto storeDto) {
		return storeDao.update(storeDto);
	}

	@DeleteMapping("/{storeNo}")
	public void deletie(@PathVariable int storeNo) {
		storeDao.delete(storeNo);
	}

	@GetMapping("/room")
	public List<RoomDto> roomlist() {
		return roomDao.list();
	}

	@DeleteMapping("/room/{storeNo}")
	public void roomdelete(@PathVariable int storeNo) {
		roomDao.delete(storeNo);
	}

	@PostMapping("/room")
	public RoomDto insert(@RequestBody RoomDto roomDto) {
		roomDto.setStoreNo(storeDto.getStoreNo());
		return roomDao.insert(roomDto);
	}

	@PutMapping("/room")
	public RoomDto update(@RequestBody RoomDto roomDto) {
		return roomDao.update(roomDto);
	}

	@GetMapping("/like")
	public int likeStore(int store_no, int member_no) {

//		try {
			storeLikeservice.save2(store_no, member_no);
			return 1;
//		} catch (Exception e) {
//			System.out.println("에러 발생" + e.getMessage());
//			return 0;
//		}
	}

//	
//	@GetMapping("/bar")
//	public List<BarDto> barlist(){
//		return barDao.list();
//	}
//	@DeleteMapping("/bar/{storeNo}")
//	public void bardelete(@PathVariable int storeNo) {
//		barDao.delete(storeNo);
//	}
//	@PostMapping("/bar")
//	public barDto insert(@RequestBody BarDto barDto) {
//		barDto.setStoreNo(storeDto.getStoreNo());
//		return barDao.insert(barDto);
//	}S
//	
//	@PutMapping("/bar")
//	public barDto update(@RequestBody BarDto barDto)bar {
//		return barDao.update(barDto);
//	}
//	

//	@GetMapping("/bar")
//	public List<BarDto> barlist(){
//		return barDao.list();
//	}
//	
//	@GetMapping("/store/{storeNO}")
//	public List<StoreDto> selectone(@PathVariable int storeNo){
//		return storeDao.one(storeNo);
//	}

}
