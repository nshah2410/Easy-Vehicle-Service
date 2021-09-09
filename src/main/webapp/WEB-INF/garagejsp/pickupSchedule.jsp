<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
Date dNow = new Date( );
SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
Date time = new Date( );
SimpleDateFormat ftt = new SimpleDateFormat ("HH:mm");
%>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Schedule Pickup
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Schedule Pickup
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                
            
            <div class="row">
            
            	<div class="col-md-12">
                 	<div class="panel panel-default">
                        <div class="panel-heading">Schedule Information</div>
                        <div class="panel-body">
                        	
                            <form class="form-horizontal" id="form">
                                 
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Mechanic:</label>
                                    <div class="col-sm-7">
                                      <select class="form-control" name="mechanic_id" required>
		                                    <option value = "">Select Mechanic</option>
		                                    <c:forEach items="${elist }" var="e">
		                                    	<option value = "${e.emp_id }">${e.emp_name }</option>
		                                    </c:forEach>   	
		                              </select>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    	<label class="col-sm-3 control-label">Date</label>
	                                    <div class="col-sm-7">
    	                                	<input type="date" " class="form-control" id="mydate" name="mydate" min="<%=ft.format(dNow) %>" required="required">
    	                                	<span id="mydate_error" style="display:none;"></span>
        	                            </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    	<label class="col-sm-3 control-label">Time</label>
	                                    <div class="col-sm-7">
	                                    	<input type="time" class="form-control" step="1800" name="mytime" id="mytime" min="10:00" max="18:00" required="required">
        	                            </div>
                                  </div>
                                  
                              	  <div class="form-group">
                                	<div class="col-sm-offset-3 col-sm-9">
                                  		<button type="button" onclick="insert()" id="submitbtn" class="btn btn-success">Submit</button>
                                	</div>
                              	  </div>
                              	  <input type="hidden" name="request_id" value="${param.r_id }">
                              	 
                        	</form>
                        </div>
                    </div>
                 </div>
            </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<script>
    var mydate = document.getElementById('mydate'),
        mydateError = document.getElementById('mydate_error');

    mydate.addEventListener('input', function() {
        if (!mydate.value.match(/\d{4}-\d{1,2}-\d{1,2}/)) {
            mydateError.innerHTML = 'Please specify a valid date in the form 1990-02-22';
            mydateError.style.display = 'inherit';
        } else {
            var value = new Date(mydate.value),
                min = new Date(mydate.min),
                max = new Date(mydate.max);
            if (value < min || value > max) {
                mydateError.innerHTML = 'Date has to be greater ' + min.toDateString() ;
                mydateError.style.display = 'inherit';
                document.getElementById("submitbtn").disabled = true;
                
            } else {
                mydateError.style.display = 'none';
                document.getElementById("submitbtn").disabled = false;
            }
        }
    });
</script>
<script>
function insert() {
	$.ajax({
		url: 'book_appointment.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Appointment Booked Successfully");
			window.location.href="acceptedrequest.evs";
		},
		error: function() {
			alert("Can't Add Data");
		}
	});	
	}
</script>