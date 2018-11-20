<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>Insert title here</title>
<style type="text/css">
#status {
	border: 2px solid black;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

<script type="text/javascript">
$(document).ready(function() {
	$('#timeStamp').datetimepicker({
		 defaultDate: moment(),
        sideBySide: true, 
        format: 'DD/MM/YYYY HH:mm '
	});
	 $('#status1').submit(function(e) {
		    var currentWeekStatus=$("#currentWeekStatus").val();
		alert(currentWeekStatus);
		    var nextWeekStatus=$("#nextWeekStatus").val();
		    var issueNote=$("#issueNote").val();
		    if ((currentWeekStatus.length<1)||(nextWeekStatus.length<1)||(issueNote.length<1)){
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
<form id="status1" class="form-signin"  action="add" method="post">
	<h1 align="center">Weekly Report</h1>
		<table id="statusTable" >
				<tr><td>User Name</td>
				<td><input type="text" name="userName" class="form-group" id="userName" value="${userName}" readonly/></td></tr>
				<tr><td>Status Report</td>
				<td><input type="date" name="statusReport" class="form-group" id="statusReport" value="${statusReport}" readonly/></td></tr>
				<!-- <tr><td>Week Ending date</td>
				<td><input type="date" name="weekEndingDate" class="input date-picker" id="weekEndingDate"/></td></tr> -->
				<tr><td>Current Week Status</td> 
				<td><textarea name="currentWeekStatus" class="form-group" id="currentWeekStatus" rows="5" cols="60"></textarea></td></tr>
				<tr><td>Next Week Status</td>
				<td><textarea name="nextWeekStatus" class="form-group" id="nextWeekStatus" rows="5" cols="60"></textarea></td></tr>
                <tr><td>Issue Note</td>
				<td><textarea name="issueNote" class="form-group" id="issueNote" rows="5" cols="60"/></textarea></td></tr>
		         <tr><td>Updated TimeStamp</td>
				<td><input type="datetime" name="timeStamp" class="form_datetime" id="timeStamp" readonly/></td></tr>
		       
		        <tr><td></td><td><input type="submit" id="statusBtn" class="btn btn-success" value="submit"></td></tr>
</table>
			</form>
			
			
</body>
</html>