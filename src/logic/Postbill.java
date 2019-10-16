package logic;

import java.util.*;

public class Postbill {
	private String c_name;
	private String stb_type;
	private String package_name;
	private double package_cost;
	private double other_charge;
	private final double tax = 0.12;
	private double total;
	private Date billDate;
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
	
	
	public double bill_amount(double stb_cost) 
	{
		double amount = stb_cost+tax();
		return amount;
	}
	
	public double tax() 
	{
		double total = package_cost * tax;
		return total;
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
	public Date getBillDate() {
		return billDate;
	}
	public void setBillDate(Date billDate) {
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
	
	

}
