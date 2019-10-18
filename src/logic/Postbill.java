package logic;

import java.util.*;

import utility.DBConnection;

import java.sql.*;
import java.sql.Date;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class Postbill {
	
	public static ResultSet printPostpaidBill(String uname,String stb) throws SQLException {
		String query="select * from PURCHASE_PACKAGE where CNAME=?"; 
  	  	PreparedStatement pst=DBConnection.Connection(query);
  	  	pst.setString(1,uname);
  	  	ResultSet purchase_package_rs = pst.executeQuery();
  	  	String query1="select * from PURCHASE_CHANNEL where CNAME=?"; 
	  	pst=DBConnection.Connection(query1);
	  	pst.setString(1,uname);
	  	ResultSet purchase_channel_rs = pst.executeQuery();
	  	
	  	double total_package_cost = 0.0;
	  	while(purchase_package_rs.next()) {
	  		String start = purchase_package_rs.getString("PKG_PURCHASE_DATE");
	  		int start_day = Integer.parseInt(start.substring(3,5));
	  		int total_days = 30-start_day;
	  		
	  		total_package_cost = total_package_cost + (total_days * purchase_package_rs.getInt("PKG_COST")/30);
	  	}
	  	while(purchase_channel_rs.next()) {
	  		String start = purchase_channel_rs.getString("CH_PURCHASE_DATE");
	  		int start_day = Integer.parseInt(start.substring(3,5));
	  		int total_days = 30-start_day;
	  		total_package_cost = total_package_cost + (total_days * Double.parseDouble(purchase_channel_rs.getString("CH_CHARGE"))/30);
	  	}
	  	String query2 = "select STB_TYPE from STB_Package where STB_ID=?";
	  	pst=DBConnection.Connection(query2);
	  	System.out.println(stb);
	  	pst.setInt(1,Integer.parseInt(stb));
	  	ResultSet stb_type_rs = pst.executeQuery();
	  	stb_type_rs.next();
	  	String stb_type = stb_type_rs.getString("STB_TYPE");
	  	String query3 = "insert into BILL_DETAILS values(?,?,?,?,'10/30/2019','11/14/2019')";
	  	pst=DBConnection.Connection(query3);
  	  	pst.setString(1,uname);
  	  	pst.setString(2,stb_type);
  	  	double tax = (12.5/100) * total_package_cost;
  	  	pst.setDouble(3,tax);
  	  	double total_amount = tax + total_package_cost;
  	  	pst.setDouble(4,total_amount);
  	  	pst.executeQuery();
  	  	String query4 = "select * from BILL_DETAILS where CNAME=?";
  	  	pst = DBConnection.Connection(query4);
  	  	pst.setString(1,uname);
  	  	ResultSet bill_details_rs = pst.executeQuery();
  	  	return bill_details_rs;
  	  	
	}
	
	public static void generatePostpaidBill() {
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*private String c_name;
	private String stb_type;
	private String package_name;
	private double package_cost;
	private double other_charge;
	private final double tax = 0.12;
	private double total;
	
	long millis=System.currentTimeMillis(); 
	private Date billDate;//= millis; ;
	private Date paydate;

	
	
	public Postbill() 
	{
		//empty construction 
	}
	
	public Postbill(String c_name, String stb_type, String package_name, double package_cost, double other_charge,
			double total, Date billDate, Date paydate) {
		super();
		this.c_name = c_name;
		this.stb_type = stb_type;
		this.package_name = package_name;
		this.package_cost = package_cost;
		this.other_charge = other_charge;
		this.total = total;
		this.billDate = billDate;
		this.paydate = paydate;
	}
	
	
	public double bill_amount(double stb_cost, Date p_date) 
	{
		double amount = stb_cost+pkg_tax();
		double prorated  = (daysBetween(billDate, p_date))*amount/30;	
		return prorated;
		
	}
	
	public double pkg_tax() 
	{
		double total = package_cost * tax;
		return total;
	}
	
	public Date pay_date() 
	{
		paydate = new Date (millis);
		Calendar c = Calendar.getInstance(); 
		c.setTime(paydate); 
		c.add(Calendar.DATE, 15);
		paydate =  (Date) c.getTime();
		System.out.println(paydate);
		return paydate;
	}
	
	 private static long daysBetween(Date one, Date two) {
	        long difference =  (one.getTime()-two.getTime())/86400000;
	        return Math.abs(difference);
	    }
	
	
	
	
	
	
	
	
	
	
	
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getStb_type() {
		return stb_type;
	}
	public void setStb_type(String stb_type) {
		this.stb_type = stb_type;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public double getPackage_cost() {
		return package_cost;
	}
	public void setPackage_cost(double package_cost) {
		this.package_cost = package_cost;
	}
	public double getOther_charge() {
		return other_charge;
	}
	public void setOther_charge(double other_charge) {
		this.other_charge = other_charge;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public long getBillDate() {
		return billDate;
	}
	public void setBillDate(long billDate) {
		this.billDate = billDate;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public double getTax() {
		return tax;
	}
	
	*/

}
