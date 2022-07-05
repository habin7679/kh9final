package com.kh.final6.error;

public class CannotFindException extends RuntimeException{
	
	private static final long serialVersionUID = 1L;
	
	public CannotFindException() {
		super("존재하지 않는 대상입니다");
	}
	public CannotFindException(String text) {
		super(text);
	}
	

}
