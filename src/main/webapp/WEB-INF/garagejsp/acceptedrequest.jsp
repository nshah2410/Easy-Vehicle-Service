<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           Accepted Requests
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
                                  		<th>Parts</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                	<c:forEach items="${request}" var="v" varStatus="count">
                                		<tr>
                                			<td>${count.count }</td>
                                			<td>${v.rm.sm.cm.name }</td>
                                			<td>${v.rm.sm.cm.mobile_no } - (${v.rm.sm.cm.email_id }) </td>
                                			<td>${v.rm.sm.uvm.vm.model_name } - ${v.rm.sm.uvm.vm.year }</td>
                                			<td>${v.rm.sm.uvm.vehicle_no }</td>
                                			<td>
                                				<c:forEach items="${v.parts }" var="p">
                                					${p }
                                					<br>
                                				</c:forEach>
                                			</td>
                                			<td>
                                				<button type="button" onclick="view(${v.rm.request_id})" class="btn btn-success">
                                  					<span class="glyphicon glyphicon-eye-open"></span>
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
function view(id){
	window.location.href="schedulepickup.evs?r_id="+id;	
}
</script>
