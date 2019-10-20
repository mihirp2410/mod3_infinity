<html>
<head>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import ="utility.*" %>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>Summary of postpaid Bill</title>
</head>
<body>
<%
String query = "select * from BILL_DETAILS";
DBConnection db = new DBConnection();
PreparedStatement pst = db.Connection(query);
ResultSet rs = pst.executeQuery();
%>
<h1>PostPaid Customer bills</h1>
<%
while(rs.next()){
%>
<form action = "MainServlet" method="post"> 
<table>

<tr id="heading">
<th>Customer name</th>
<th>Amount</th>
<th>Due Date</th>
</tr>
    <tr>
        <td><input type="radio" name="cname" class="ss" 
            value=<%=rs.getString("CNAME")%>> <%=rs.getString("CNAME")%>
        </td>
        <td><%=rs.getString("TOTAL_AMOUNT")%></td>
        <td><%=rs.getString("BILL_PAYMENT_DATE")%></td>

    </tr>
</table>
<%
}
%>
<input type="hidden" name="operation" value="billdetails">
<button type="submit"  >Bill Details</button>
</form>
</body>
</html>