package logic;
import servlets.*;
import utility.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoadData {
	
	public static void billing_type(String choose) {
		String billing_type=choose;
		//InsertInDatabase.setBillingType();
	}
	public static void loaduname(String uname) {
		String username=uname;
	}
	public static void loadstb(String stb) {
		// TODO Auto-generated method stub
		int stb_id=Integer.parseInt(stb);
	}
	
	public static void loadpackage(String[] ar) {
		String[] package_ids=ar;
	}
	public static void loadchannel(String[] arr) {
		String[] channels_name=arr;
	}
	public static void loaddate(String d) throws ParseException {
		// TODO Auto-generated method stub
		
		//Date date1=(Date) new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz").parse(d);
		//SimpleDateFormat properDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		//System.out.println(properDateFormat.format(date1));
		System.out.println(d);
	}
	
}