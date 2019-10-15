<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Logic.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>second page</title>
</head>
<body>
	<%
		DBConnection db = new DBConnection();
		String query = "select * from STB_Package";
		 PreparedStatement st = db.connect(query);
		ResultSet rs = null;
		//ResultSet rs1 = null;

		//Class.forName(driverinfo);
		//System.out.println("Driver info registered successsfully");

		//con = DriverManager.getConnection(url, uname, pass);
		//System.out.println("established connection successfully");

		//st = con.createStatement();
		//System.out.println("connection created");

		rs = st.executeQuery();
		System.out.println("query successfully executed");
	%>
	<form name="frm1" action="sess" method="get">
<h1> Select your STB</h1>
<label>Customer name:</label><br><br>
<table>
<caption>SET TOP BOX TYPES</caption>
                <tr id="heading">
                    <th>STB Type</th>
                    <th>STB MAC ID </th>
                    <th>STB Serial number</th>
                    <th>STB price</th>
                    <th>Installation Charge</th>
                    <th>Deposit</th>
                    <th>Discount</th>
                    <th>Tax</th>
                    <th>Amount Payable </th>
                    <th>status</th>
                </tr>
               <%
      while (rs.next()) {
        
        double total_amount=(rs.getInt("STB_PRICE")+rs.getInt("STB_INSTALLATION_CHARGE")+rs.getInt("STB_REFUNDABLE_DEPOSIT")-rs.getInt("STB_DISCOUNT"));
        double tax= 0.12*total_amount;
        double amount_payable=tax+total_amount;
  %>
          <tr>
            <td><%= rs.getString("STB_TYPE") %></td>
            <td><%= 00 %></td>
            <td><%= 00 %></td>
            <td><%= rs.getInt("STB_PRICE") %></td>
            <td><%= rs.getInt("STB_INSTALLATION_CHARGE") %></td>
            <td><%= rs.getInt("STB_REFUNDABLE_DEPOSIT") %></td>
            <td><%= rs.getInt("STB_DISCOUNT") %></td>
            <td><%= tax %></td>
            <td><%= amount_payable %></td> 
            <td><%= 00 %></td>
          </tr>
  <%
      }
  %>
            
            </table><br><br>
            
            
           <button  type="submit" class="" formaction="package.jsp">submit</button>
</form>
</body>
</html>