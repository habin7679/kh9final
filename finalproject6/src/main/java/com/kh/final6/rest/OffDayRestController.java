package com.kh.final6.rest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.OffDayDto;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.OffDayService;
import com.kh.final6.vo.OffDaysVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/rest/offDay")
@Slf4j
public class OffDayRestController {

	@Autowired 
	private OffDayService offDayService;
	@Autowired
	private StoreDao storeDao;
	
	private SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
//	private SimpleDateFormat simple2 = new SimpleDateFormat("yyyyMMdd");
	@GetMapping("/{storeNo}")
	public String[] days(
			@PathVariable(name = "storeNo") int storeNo
			) {
	
		OffDayDto offDayDto = storeDao.offDayOne(storeNo);
		String start = simple.format(offDayDto.getOffStart());
		String end = simple.format(offDayDto.getOffEnd());
		
//		String start2 = simple2.format(offDayDto.getOffStart());
//		String end2 = simple2.format(offDayDto.getOffEnd());
		
		 String[] days = null; 
	      

	      days = offDayService.getDiffDaysFormat( start, end, "yyyy-MM-dd" ); 
	      for( int i = 0; i < days.length; i++ ) {  
	          System.out.println( days[i] );  
	      }  
	      return days;
	}
	

      
//		String start = simple.format(offDayDto.getOffStart());
//		String end = simple.format(offDayDto.getOffEnd());
//		
//		List<OffDaysVO> days = storeDao.offDays(start, end);
//		for(OffDaysVO day : days) {
//			simple.format(day.getDays());
//			log.debug("@@@@@@@@@@@@@day = {}", simple.format(day.getDays()));
//		}
//		return days;
}
