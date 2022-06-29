package com.kh.final6.error;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice(annotations = Controller.class)
public class ExceptionController {

	//CannotFindException이 발생하면 사용자에게 404번 메세지를 전송
	
//	[1] Legacy 방식
//	@ExceptionHandler(CannotFindException.class)
//	public void handler(HttpServletResponse response) throws IOException {
//		response.sendError(404);
//	}
	
////	[2] Spring 방식
//	@ExceptionHandler(CannotFindException.class)
//	public ResponseEntity<String> handler(CannotFindException ex){
//		return ResponseEntity.notFound().build(); // response.sendError(404)
////		return ResponseEntity.internalServerError().build(); // 500
//		
//	}
	
	@ExceptionHandler(CannotFindException.class)
	public String handler() {
		return "error/404";
		
}	
	
	@ExceptionHandler(UnauthorizeException.class)
	public void error401(HttpServletResponse response) throws IOException {
		response.sendError(401);
	}
	
	@ExceptionHandler(Exception.class)
		public String handler(Exception ex) {
			log.error("예외발생", ex);
			return "error/500";
			
	}	
}
