<!DOCTYPE html>
<html>

<%@ page import="java.sql.*"%>
<%@ page import="utility.*" %>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>Insert title here</title>
</head>
<body>
<form name="postbill" >
<h1>PostPaid Customer Bill Details</h1>
<label>Generated Bills</label><br>
<br>
<%
HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");
String cname=(String) newsess.getAttribute("uname");
String query = "select * from BILL_DETAILS where CNAME=?";
DBConnection db = new DBConnection();
PreparedStatement pst = db.Connection(query);
pst.setString(1,cname);
ResultSet rs = pst.executeQuery();
    %>
<%
while(rs.next()){
%>
   
        <caption>Customer name:<%=rs.getString("CNAME")%></caption> <br>
        <ul>
        <li>STB Type : <%=rs.getString("STB_TYPE")%></li>
        <li>Tax : $<%=rs.getString("TAX")%></li>
        <li>Total Amount : $<%=rs.getInt("TOTAL_AMOUNT")%></li>
        <li>Bill Generation Date :<%=rs.getString("BILL_GENERATION_DATE")%></li>
        <li>Bill Payment Date :<%=rs.getString("BILL_PAYMENT_DATE")%></li>
        </ul>
        
    <%
}
    %>
    <br>
    <br>
  <!--  <input type="hidden" name="operation" value="Discrepancy"> -->
    <button type="submit" formaction=Login.html>Submit</button>
</form>
</body>
</html>