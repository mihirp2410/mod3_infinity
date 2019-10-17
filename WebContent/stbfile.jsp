<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>second page</title>
</head>
<body>
	<form name="frm1" action="MainServlet" method="get">
		<h1>Select your STB</h1>
		<%HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");

		ResultSet rs = (ResultSet) newsess.getAttribute("rs");
		String username=(String) newsess.getAttribute("uname");
		%>
		<label>Customer name:<%=username %></label><br>
		<br>
		<table>
			<caption>SET TOP BOX TYPES</caption>
			<tr id="heading">
				<th>STB Type</th>
				<th>Dimensions</th>
				<th>STB price</th>
				<th>Installation Charge</th>
				<th>Deposit</th>
				<th>Discount</th>
				<th>Tax</th>
				<th>Amount Payable</th>
				
			</tr>
			<%
				
				while (rs.next()) {

					double total_amount = (rs.getInt("STB_PRICE") + rs.getInt("STB_INSTALLATION_CHARGE")
							+ rs.getInt("STB_REFUNDABLE_DEPOSIT") - rs.getInt("STB_DISCOUNT"));
					double tax = 0.12 * total_amount;
					double amount_payable = tax + total_amount;
			%>
			<tr>
				<td><input type=radio name="stb"
					value=<%= rs.getString("STB_ID") %>><%= rs.getString("STB_TYPE") %></td>
				<td><%= rs.getString("STB_DIMENSIONS")%></td>
				<td><%= rs.getInt("STB_PRICE") %></td>
				<td><%= rs.getInt("STB_INSTALLATION_CHARGE") %></td>
				<td><%= rs.getInt("STB_REFUNDABLE_DEPOSIT") %></td>
				<td><%= rs.getInt("STB_DISCOUNT") %></td>
				<td><%= tax %></td>
				<td><%= amount_payable %></td>
				
			</tr>
			<%
      }
      
  %>

		</table>
		<br>
		<br>

       <input type="hidden" name="operation" value="package">
		<button type="submit"  >submit</button>
	</form>
</body>
</html>