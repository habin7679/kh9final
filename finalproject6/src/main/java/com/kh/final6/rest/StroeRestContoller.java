
package com.kh.final6.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

@RestController
@RequestMapping("/rest/store")

public class StroeRestContoller {
   @Autowired
   private StoreDao storeDao;
   
   @Autowired
   private RoomDao roomDao;
   
   @GetMapping("/")
   public List<StoreDto> list(){
      return storeDao.list();
   }
   
   @GetMapping("/{storeNo}")
   public StoreDto one(@PathVariable int storeNo){
      System.out.println("스토어 넘버"+storeNo);
      return storeDao.one(storeNo);
   }
   //@PostMapping("/")
//   public StoreDto insert(@RequestBody StoreDto storeDto) {
//      return storeDao.insert(storeDto);
//   }
   
   @PutMapping("/")
   public StoreDto update(@RequestBody StoreDto storeDto) {
      return storeDao.update(storeDto);
   }
   
   @DeleteMapping("/{storeNo}")
   public void deletie(@PathVariable int storeNo) {
      storeDao.delete(storeNo);
   }
   
   
 
   
   
//   @GetMapping("/bar")
//   public List<BarDto> barlist(){
//      return barDao.list();
//   }
//   
//   @GetMapping("/store/{storeNO}")
//   public List<StoreDto> selectone(@PathVariable int storeNo){
//      return storeDao.one(storeNo);
//   }

   
}