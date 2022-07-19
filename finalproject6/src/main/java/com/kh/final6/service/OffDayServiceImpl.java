package com.kh.final6.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class OffDayServiceImpl implements OffDayService {

@Override
public String[] getDiffDaysFormat(String from, String to, String fmt) {
	SimpleDateFormat sdf  = new SimpleDateFormat( fmt );  
    ArrayList list = new ArrayList();  
    Calendar cal = Calendar.getInstance();  
    Date fmdate  = null; 
    Date todate  = null; 

    try {  
        fmdate = sdf.parse(from); 
        todate = sdf.parse(to); 
        cal.setTime(fmdate);  
    }  
    catch( Exception e )  
    { 
        e.printStackTrace(); 
        return null; 
    } 

    while( fmdate.compareTo(todate) <= 0 )  
    { 
        list.add(sdf.format(fmdate));  
        cal.add(Calendar.DATE, 1);  
        fmdate = cal.getTime();                 
    } 

    String[] result = new String[list.size()]; 
    list.toArray(result); 
    return result; 
} 


	@Override
	public String[] getDiffDays(String from, String to) {

		return getDiffDaysFormat( from, to, "yyyyMMdd" ); 
}
}
