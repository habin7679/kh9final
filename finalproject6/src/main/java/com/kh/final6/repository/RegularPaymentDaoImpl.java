package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.RegularPaymentDto;
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
																													.build();
		
		sqlSession.insert("regularPayment.insert", regularPaymentDto);
	}
}
