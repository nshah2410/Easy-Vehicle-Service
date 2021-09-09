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
                                		<td>${a.em.emp_name }</td>
                                		<td>
                                			<button type="button" onclick="recieved(${a.rm.request_id})" class="btn btn-success">
                                  				<span class="glyphicon glyphicon-ok"></span>
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
function recieved(id){
	if(confirm("Are You Sure selected vehicle is recieved??")){
		$.ajax({
			url: 'scheduled_appointment.evs',
			type: 'POST',
			data: {action : 'vehicle_recieved', request_id : id},
			success: function() {
				alert("Vehicle Marked as Recieved");
				location.reload();
			}
		});
	}
}
</script>