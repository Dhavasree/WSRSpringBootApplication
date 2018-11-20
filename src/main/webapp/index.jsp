<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#status {
	border: 2px solid black;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#statusReport').datepicker({
		minDate: 0,
		dateFormat: 'dd/mm/yy',
		beforeShowDay: function(date)
		{
			if(date.getDay()==5)
				{
				return[true];
				
				}
			return [false];
		}
	});
	  $('#status').submit(function(e) {
		    var userName=$("#userName").val();
		    var statusReport=$("#statusReport").val();
		    if ((userName.length < 1)||(statusReport.length<1)){
		    	alert("Don't make text box is empty");
		    	return false;
		    	}
		    else{
		    	return true;
		    	}
	  });
});
</script>
</head>
<body>
<form id="status" action="value" method="post">
	<h1 align="center">Weekly Report</h1>
		<table id="statusTable" >
				<tr><td>User Name</td>
				<td><input type="text" name="userName" class="form-group" id="userName"/></td></tr>
				<tr><td>Status Report</td>
				<td><input type="date" name="statusReport" class="form-group" id="statusReport"/></td></tr>
		   
		        <tr><td></td><td><input type="submit" id="statusBtn" class="btn btn-success" value="submit"></td></tr>
</table>
			</form>
			
			
</body>
</html>