<html>
<head>
<meta charset="ISO-8859-1">
<title>first page</title>
</head>
<body>
<div class="container">
 	<form action = "MainServlet" method="get">
     <h1>Chose payment type to view the options</h1><br><br>
      <input type="hidden" name="operation" value="bill">
     <input type="submit" name = "billing" value = "postpaid">
     <br><br>
     <input type="submit" name = "billing" value = "prepaid">
     </form>  
    </div>
 
</body>
</html>