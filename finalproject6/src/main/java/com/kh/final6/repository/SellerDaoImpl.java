package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.SellerDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.vo.SellerInfoVO;
import com.kh.final6.vo.SellerMemberVO;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addPoint(int price, int sellerNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("price", price);
		param.put("sellerNo", sellerNo);
		int count = sqlSession.update("seller.addPoint", param);
		if(count < 0) {
			throw new CannotFindException();
		}
	}
	
	@Override
	public SellerDto one(int sellerNo) {
		return sqlSession.selectOne("seller.one", sellerNo);
	}
	
@Override
	public int getSellerNo(int memberNo) {
		return sqlSession.selectOne("seller.sellerNo", memberNo);
	}

@Override
public void join(SellerDto sellerDto) {
	
	       //시퀀스 생성 
			int sellerNo = sqlSession.selectOne("seller.sequence");
	        sellerDto.setSellerNo(sellerNo);
			
			sqlSession.insert("seller.join", sellerDto);
			
}

@Override
public List<SellerDto> list(int sellerNo) {
	return sqlSession.selectList("seller.list", sellerNo);
}

@Override
public SellerInfoVO sellerMemberInfoVO(int sellerNo) {
	return sqlSession.selectOne("seller.sellerInfoVO", sellerNo);
}
@Override
public List<SellerMemberVO> adminlist(String type, String keyword, int p, int s) {
	Map<String,Object> param = new HashMap<>();
	param.put("type", type);
	param.put("keyword", keyword);

	int end = p *s;
	int begin = end - (s-1);

	param.put("begin", begin);
	param.put("end", end);
	return sqlSession.selectList("seller.adminlist",param);
	
}
//게시글 수 조회
	@Override
	public int count(String type, String keyword) {
 		Map<String,Object> param = new HashMap<>();
 		param.put("type", type);
 		param.put("keyword", keyword);
 		
 		return sqlSession.selectOne("seller.count",param);
	}
	
	@Override
	public void gradeEdit(int sellerNo) {
		int count=sqlSession.update("seller.edit",sellerNo);
		if(count <= 0) throw new CannotFindException();
	}
	
	@Override
	public void gradeMemberEdit(int memberNo) {
		int count=sqlSession.update("seller.memberEdit",memberNo);
		if(count <= 0) throw new CannotFindException();
	}
	@Override
	public int sellerMemberNo(int sellerNo) {
		return sqlSession.selectOne("seller.memberNo", sellerNo);
	}
	@Override
	public void gradeCancel(int sellerNo) {
		int count=sqlSession.update("seller.cancel",sellerNo);
		if(count <= 0) throw new CannotFindException();
	}
	
}
