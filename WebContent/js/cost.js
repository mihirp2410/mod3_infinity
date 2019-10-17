function doalert(checkedelem){
	
	//document.body.innerHTML = document.body.innerHTML + "bla bla";
	//var x = document.getElementById("channel");
	//x.style.color = "red";
	
	var x = checkedelem.value;
	//alert(x);
	document.getElementById("total_package_cost").innerHTML+= x + "+";
}