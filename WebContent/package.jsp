<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import="logic.*" %>
<%@ page import="servlets.*" %>
<%@ page import="utility.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>Insert title here</title>
</head>
<form action = "MainServlet" method="get">
<body>
 <script src="js/cost.js"></script>

	
	<%
		HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");
        
		ResultSet rs = (ResultSet) newsess.getAttribute("package_resultset");
		String username=(String) newsess.getAttribute("uname");
		ArrayList<Channel> alc = (ArrayList<Channel>) newsess.getAttribute("channel_list");
	%>
	<label>Customer name:<%=username %></label>
		<% int i = 0;%>
	
       <%
       while (rs.next()){
    	  
       %>
       		<%i++; %>
       <table>
		<caption>Package details</caption>
		<tr id="heading">
			<th>Package name</th>
			<th>Package Category</th>
			<th>Transmission Type</th>
			<th> Package Cost</th>
			<th>Available From</th>
			<th>Available To</th>
		</tr>

		<tr>
			<td><input type="checkbox" name="select" class="ss"  id=<%=rs.getInt("PKG_COST")%>
				value=<%=rs.getInt("PKG_ID")%> onclick="totaltt()"/> <%=rs.getString("PKG_NAME")%>
			</td>
			<td><%=rs.getString("PKG_CATEGORY")%></td>
			<td><%=rs.getString("PKG_TRANSMISSION_TYPE")%></td>
			<td><%=rs.getInt("PKG_COST")%></td>
			<td><%=rs.getDate("PKG_AVAILABLE_FROM")%></td>
			<td><%=rs.getDate("PKG_AVAILABLE_TO")%></td>
		</tr>
	
   
   </table>
   
   <table>
			<caption>Channels</caption>
			<tr id="heading">
				<th>Channel Name</th>
				<th>Channel Charge</th>
				<th>Package Name</th>
			</tr>
			<% for(Channel c : alc){
			   	if(c.getPackage_id()==rs.getInt("PKG_ID")){
					
			%>
			
			
			<tr>
				
				<td><input type="checkbox" name="select1" class="ss" value="<%=c.getChannel_name()%>"
					 id="<%=c.getChannel_charge()%>" onclick="totalIt()"/><%=c.getChannel_name()%></td>
		
				<td><%=c.getChannel_charge()%></td>
				<td><%=c.getPackage_id() %></td>
				
			</tr>
			
			
				<%
			   		}
				%>
				
		
			 
          <%			
			}
          %>
          </table>
        
          
          
       <%
       }
       Date dNow = new Date();
       SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
     
       %>
		
	</table>
  
    <label> Total channel Cost = </label>
          <input  value="$0.00" readonly="readonly" type="text" id="total"/><br><br>
     <label>Total package Cost =</label>   
           <input value="$0.00" readonly="readonly" type="text" id="totalp"/> <br><br> 
      <label>Total amount =</label>
           <input value="$0.00" readonly="readonly" type="text" id="totalamt"/>
       Purchased date: <input name="purchasedate"  value="<%=ft.format(dNow)%>"  /> 
      <input type="hidden" name="operation" value="packageselection">
		<button type="submit"  >submit</button>
     
    </form> 
</body>
</html>