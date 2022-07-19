package com.kh.final6.service;

public interface OffDayService {
	
	String[] getDiffDaysFormat( String from, String to, String fmt );
	
	String[] getDiffDays( String from, String to );

}
