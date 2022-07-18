package com.kh.final6.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.Scanner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.final6.entity.CertDto;
import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.CertDao;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.vo.MyReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmailServiceUsingGmail implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private CertDao certDao;
	@Autowired
	private ReservationDao reservationDao;
	
	//tip : 등록된 properties에서 값을 불러오는 설정
	//@Value("${project.port}")
	//private int port;
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");
	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public void sendCertification(String email) {
		//인증번호 전송 시스템
		//1. 랜덤으로 6자리의 정수를 생성한다
		//2. 특정 이메일로 인증번호를 발송한다
		//2-1. 이메일과 인증번호, 전송시각을 DB에 저장한다
		//3. 사용자가 이메일을 확인해서 인증번호를 입력한다
		int certNumber = r.nextInt(1000000);
		String certString = f.format(certNumber);
		log.debug("이메일 = {}", email);
		log.debug("인증번호 = {}", certString);
		
		String title = "[예야쿠] 인증번호를 보내드립니다";
		String content = "인증번호 : "+certString;
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject(title);
		message.setText(content);
		
		mailSender.send(message);
		
		//DB에 인증정보를 저장하는 코드
		//- 1개의 이메일에는 1개의 인증번호만 가능하므로 검사하여 수정 혹은 추가를 해야 한다
		
		certDao.insert(CertDto.builder()
												.certTarget(email)
												.certNumber(certString)
												.build());
	}
	
	@Override
	public void sendPasswordResetMail(MemberDto findDto) throws MessagingException {
		//findDto에 있는 E-mail에 비밀번호 재설정 메일을 보내야 한다.
		//이메일에서 재설정은 불가능하기 때문에 우리 홈페이지의 특정 페이지 링크를 보내야 한다
		//재설정은 아무나 하는게 아니고 허락된 사람만 가능해야 한다
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		helper.setTo(findDto.getMemberId());
		helper.setSubject("[예야쿠] 비밀번호 재설정 메일입니다");
		
		int certNumber = r.nextInt(1000000);
		String certString = f.format(certNumber);
		
		String returnUri = ServletUriComponentsBuilder
												.fromCurrentContextPath()//protocol + host
												.path("/member/reset")
												.queryParam("memberId", findDto.getMemberId())
												.queryParam("cert", certString)
												.toUriString();
		String content = 
				"<a href='"+returnUri+"'>"
					+ "비밀번호를 재설정하시려면 여기를 누르세요"
			+ "</a>";
		helper.setText(content, true);
		
		mailSender.send(message);
		
		certDao.insert(CertDto.builder()
									.certTarget(findDto.getMemberId())
									.certNumber(certString)
									.build());
	}
	
	
	@Override
	public void sendReservationInfo(int paymentNo) throws MessagingException, IOException {
		
		MyReservationVO myReservationVO = reservationDao.myReservationInfo(paymentNo);
		
		
		ClassPathResource template = new ClassPathResource("email/reservation-template.html");
		
		StringBuffer buffer = new StringBuffer();
		try (Scanner sc = new Scanner(template.getFile());){ //예외전가가 있어서 catch 안써도 됨
			while(sc.hasNextLine()) {
				buffer.append(sc.nextLine());
			}
		}
		String html = buffer.toString(); 
		
		//만약 HTML에 바꿔야 할 내용(ex : 아이디)이 존재한다면 사용할 수 있는 방법은 2가지 정도
		// 1. String의 replace() 사용
		// 2. Jsoup과 같은 외부 라이브러리 사용 (자바에서 html을 읽을 수 있게 도와주는 도구)
		Document doc = Jsoup.parse(html);	
		Elements elements = doc.getElementsByClass("memberNick");
		for(Element element : elements) {
			element.text(myReservationVO.getMemberNick());
		}
		Elements elements1 = doc.getElementsByClass("memberName");
		for(Element element : elements1) {
			element.text(myReservationVO.getMemberName());
		}
		Elements elements2 = doc.getElementsByClass("reservationPrice");
		for(Element element : elements2) {
			element.text(String.valueOf(myReservationVO.getReservationPrice()));
		}
		Elements elements3 = doc.getElementsByClass("reservationPeople");
		for(Element element : elements3) {
			element.text(String.valueOf(myReservationVO.getReservationPeople()));
		}
		Elements elements4 = doc.getElementsByClass("reservationTime");
		for(Element element : elements4) {
			element.text(myReservationVO.getReservationTime());
		}
		Elements elements5 = doc.getElementsByClass("storeName");
		for(Element element : elements5) {
			element.text(myReservationVO.getStoreName());
		}
		
		String reservationDate = simpleDateFormat.format(myReservationVO.getReservationDate());
		Elements elements6 = doc.getElementsByClass("reservationDate");
		for(Element element : elements6) {
			element.text(reservationDate);
		}
		
		//마임 메세지
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		helper.setTo("zdx456@naver.com");
		helper.setSubject("[예야쿠] 예약 정보확인 입니다.");
		helper.setText(doc.toString(), true);
		
		mailSender.send(message);
	}
}

