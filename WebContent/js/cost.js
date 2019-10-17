function doalert(checkedelem,i){
	
	//document.body.innerHTML = document.body.innerHTML + "bla bla";
	//var x = document.getElementById("channel");
	//x.style.color = "red";
	
	var x = checkedelem.value;
	//alert(i);
	document.getElementById(i).innerHTML+= x + "+";
}