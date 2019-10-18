<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form name="postbill" action="MainServlet" method="get">
		<h1>PostPaid Customer Bills</h1>
		<label>Generated Bills</label><br>
		<br>
		<%
			ResultSet rs = null;
		%>
		<table>
			<caption>Customer name:</caption>
			<tr id="heading">
				<th>STB Type<%=rs.getInt("STB_TYPE")%></th>
				<th>Package name<%=rs.getInt("PKG_NAME")%></th>
				<th>Package Cost<%=rs.getInt("PKG_COST")%></th>
				<th>Other Charges<%=rs.getInt("OTHER_CHARGE")%></th>
				<th>Tax <%=rs.getInt("TAX")%></th>
				<th>Total Amount<%=rs.getInt("TOTAL_AMOUNT")%></th>
				<th>Bill Generation Date<%=rs.getInt("BILL_DATE")%></th>
				<th>Bill Payment Date<%=rs.getInt("PAY_DATE")%></th>
			</tr>
			<%
				HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");
				rs = (ResultSet) newsess.getAttribute("rs");
				while (rs.next()) {
					double total_amount = (rs.getInt("STB_PRICE") + rs.getInt("STB_INSTALLATION_CHARGE")
							+ rs.getInt("STB_REFUNDABLE_DEPOSIT") - rs.getInt("STB_DISCOUNT"));
					double tax = 0.12 * total_amount;
					double amount_payable = tax + total_amount;
			%>
			<tr>
				<td><input type=radio name="stb"
					value=<%=rs.getString("STB_TYPE")%>><%=rs.getString("STB_TYPE")%></td>
				<td><%=00%></td>
				<td><%=00%></td>
				<td><%=rs.getInt("STB_PRICE")%></td>
				<td><%=rs.getInt("STB_INSTALLATION_CHARGE")%></td>
				<td><%=rs.getInt("STB_REFUNDABLE_DEPOSIT")%></td>
				<td><%=rs.getInt("STB_DISCOUNT")%></td>
				<td><%=tax%></td>
				<td><%=amount_payable%></td>
				<td><%=00%></td>
			</tr>
			<%
				}
			%>

		</table>
		<br>
		<br>
       <input type="hidden" name="operation" value="Discrepancy">
		<button type="submit">Generate New(Discrepancy)</button>
	</form>
</body>
</html>