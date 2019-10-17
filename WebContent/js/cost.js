function totalIt() {
  var input = document.getElementsByName("select1");
  var total = 0;
  for (var i = 0; i < input.length; i++) {
    if (input[i].checked) {
      total += parseFloat(input[i].value);
    }
  }
  document.getElementById("total").value = "$" + total.toFixed(2);
  totalamt();
}

function totaltt() {
	  var input = document.getElementsByName("select");
	  var total = 0;
	  for (var i = 0; i < input.length; i++) {
	    if (input[i].checked) {
	      total += parseFloat(input[i].value);
	    }
	  }
	  document.getElementById("totalp").value = "$" + total.toFixed(2);
	 totalamt();
	}

function totalamt(){
	  var input = document.getElementsByClassName("ss");
	  var total = 0;
	  for (var i = 0; i < input.length; i++) {
	    if (input[i].checked) {
	      total += parseFloat(input[i].value);
	    }
	  }
	  document.getElementById("totalamt").value = "$" + total.toFixed(2);
	  
}