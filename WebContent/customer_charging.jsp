<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>Bill Generation</title>
</head>
<body>

<div class="container">
<form action = "MainServlet" method="post">
<h2>Choose payment type to view the options</h2><br><br>
<input type="hidden" name="operation" value="adminoption">
<label>If you want to purchase for your customer write customer name here:</label>
<input name="cust" type="text" id="cu"/><br>
<input type="submit" name = "option" value = "BuySTBforCustomer">
<br><br>
<input type="submit" name = "option" value = "GenerateBill"><br><br>
<input type="submit" name = "option" value = "DeductBalance">
</form>
<footer style="color #FFFFFF ;padding:40px;">
<p>Copyright by Infinity DTH Services</p>
<p>Contact information: <a href="mailto:someone@example.com">customercare@infinitydth.com</a>.</p>
</footer>
</div>
</body>
</html>