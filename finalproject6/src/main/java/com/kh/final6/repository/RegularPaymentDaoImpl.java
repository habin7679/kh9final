package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;
import com.kh.final6.vo.StoreNameMemberNameVO;

@Repository
public class RegularPaymentDaoImpl implements RegularPaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StoreNameMemberNameVO> storeNameMemberName(int memberNo) {
		return sqlSession.selectList("regularPayment.storeNameMemberName", memberNo);
	}
	@Override
	public int sequence() {
		return sqlSession.selectOne("regularPayment.sequence");
	}
	
	@Override
	public void insert(int regularpaymentNo, KakaoPayRegularApproveResponseVO responseVO, int sellerNo, int storeNo) {

		int regularPaymentSeq = sequence();
	
		RegularPaymentDto regularPaymentDto = RegularPaymentDto.builder()
																														.sellerNo(sellerNo)
																														.storeNo(storeNo)
																														.regularPaymentNo(regularPaymentSeq)
																														.regularPaymentPrice(responseVO.getAmount().getTotal())
																														.regularPaymentName(responseVO.getItem_name())
																														.regularPaymentTid(responseVO.getTid())
																														.regularPaymentSid(responseVO.getSid())
																														.regularPaymentUserId(responseVO.getPartner_user_id())
																													.build();
		
		sqlSession.insert("regularPayment.insert", regularPaymentDto);
	}
	
	public List<RegularPaymentDto> list(String beforeHoliday, String today) {
		Map<String, Object> param = new HashMap<>();
		param.put("beforeHoliday", beforeHoliday);
		param.put("today", today);
		return sqlSession.selectList("regularPayment.list", param);
	}
	
	@Override
	public void insertStorage(RegularPaymentDto regularPaymentDto) {
		sqlSession.insert("regularPayment.insertStorage", regularPaymentDto);
	}

	
	@Override
	public List<RegularPaymentDto> listSellerNo(int sellerNo) {
		return sqlSession.selectList("regularPayment.listSellerNo", sellerNo);
	}
	
	@Override
	public void delete(int regularPaymentNo) {
		int count = sqlSession.delete("regularPayment.delete", regularPaymentNo);
		
		if(count <= 0) {
			throw new CannotFindException();
		}
	}
	
	@Override
	public RegularPaymentDto listAll(int regularPaymentNo) {
		return sqlSession.selectOne("regularPayment.listAll", regularPaymentNo);
	}
	
	@Override
	public void update(KakaoPayRegularApproveResponseVO responseVO, int regularPaymentNo) {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("regularPaymentTid", responseVO.getTid());
		param.put("regularPaymentSid", responseVO.getSid());
		param.put("regularPaymentNo", regularPaymentNo);

		int count = sqlSession.update("regularPayment.change", param);
		
		if( count <= 0) {
			throw new CannotFindException();
		}
		
	}
}
