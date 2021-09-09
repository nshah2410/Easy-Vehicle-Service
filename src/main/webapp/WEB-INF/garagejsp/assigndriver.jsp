<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           Scheduled Pickup
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            
                            <li class="active">
                                <i class="glyphicon glyphicon-tasks"></i> Service Request
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                     <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Customer Name</th>
                                  		<th>Contact Details</th>
                                  		<th>Vehicle</th>
                                  		<th>Vehicle No.</th>
                                  		<th>Scheduled Date/Time</th>
                                  		<th>To Be Pickup By</th>
                                  		<th>Vehicle Recieved</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                	<c:forEach items="${alist }" var="a" varStatus="count">
                                	<tr>
                                		<td>${count.count }</td>
                                		<td>${a.rm.sm.cm.name }</td>
                                		<td>${a.rm.sm.cm.mobile_no }</td>
                                		<td>${a.rm.sm.uvm.vm.model_name }</td>
                                		<td>${a.rm.sm.uvm.vehicle_no }</td>
                                		<td><fmt:formatDate value="${a.date}" type="date"/> / <fmt:formatDate value="${a.time_slot}" type="time"/></td>
                                		<td>
                                			<select class="form-control" name="mechanic_id" id="mechanic_id${count.count }" required>
		                                    	<option value = "">Select Mechanic</option>
		                                    		<c:forEach items="${elist }" var="e">
		                                    			<option value = "${e.emp_id }">${e.emp_name }</option>
		                                    		</c:forEach>   	
		                              		</select>
                                		</td>
                                		<td>
                                			<button type="button" onclick="assign(${a.appointment_id},${count.count })" class="btn btn-success">
                                  				<span>Assign</span>
                                			</button>
                                		</td>
                                	</tr>
                                	</c:forEach>
                                </tbody>
                                
                            </table>
                        </div>
                    </div>
               	</div>
                <!-- /.row -->
               </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
<script>
function assign(appointment_id, count){
	var mech_id = document.getElementById("mechanic_id"+count).value;
	$.ajax({
			url: 'scheduled_appointment.evs',
			type: 'POST',
			data: {action : 'assign_driver', appointment_id : appointment_id, emp_id : mech_id},
			success: function() {
				alert("Pickup Scheduled");
				location.reload();
			}
		});
}
</script>