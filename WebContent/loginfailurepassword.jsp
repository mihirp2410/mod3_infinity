<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title> LOGIN Page </title>
<div>



<div class = "header">
<h1>Infinity DTH Services </h1>
</div>
</head>

<marquee>
<font color ="white"><h4>***PROMOTION: First Month FREE FREE FREE*** </h4>
</font></marquee>

<br><br>

<form style="color: #FFFFFF ;" name="myform" action="MainServlet" method="post">
<label>Username:</label>
<input type ="text" name ="uname" placeholder="Enter Username" required><br><br>
<label>Password:</label>
<input type ="password" name="pwd" placeholder="Enter Password" required><br><br>
Incorrect Password!<br>

<input type = "hidden" name="operation" value="login">
<button input type="submit"> LOGIN</button>

<input type="reset" value="Reset"><br><br>

</form>
</div>
</center>

</body>

<footer style="color:#FFFFFF;padding:40px;">
  <p>Copyright by Infinity DTH Services</p>
  <p>Contact information: <a href="mailto:someone@example.com">customercare@infinitydth.com</a>.</p>
</footer>



</html>