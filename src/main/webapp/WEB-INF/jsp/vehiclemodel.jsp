<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${cm.company_name }'s Vehicles
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li>
                                <i class="fa fa-home"></i>  <a href="vehiclecompany.evs" style="text-decoration: none;">Companies</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Vehicle List
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                       	
                       	
                       	<div style="text-align: justify-right; vertical-align: middle;">
                   			 <div align="right" style="">
                        		<button type="button" class="btn pull-right btn btn-success" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="fa fa-plus"></i> Add</button></br>
	                    </div>

 	                   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" form-responsive>
    	                    <div class="modal-dialog" role="document">
        	                    <div class="modal-content">
            	                    <div class="modal-header">
                	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	                <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">Add New Model</h4>
                        	        </div>
                                	<div class="modal-body">
                                    	<form id="form">
                                        	<div class="form-group">
                                            	<label for="recipient-name" class="control-label">Model Name:</label>
                                            	<input type="text" class="form-control" name="model_name" id="recipient-name" placeholder="${cm.company_name }'s Model Name" required>
                                        	</div>                                        
                                        	
	                                        <div class="form-group">
		                                    	<label>Year:</label>
		                                        <select class="form-control" name="year" required>
		                                    		<option value = "">Select year</option>
		                                       		<option value = "2019">2019</option>
		                                       		<option value = "2018">2018</option>
		                               		 	</select>
		                                    </div>
		                                    <input type="hidden" name="company_id" value="${cm.company_id }">
											<input type="hidden" name="action" value="addvehiclemodel">
            	                            <button type="button" class="btn pull-left" onclick="insert()">Submit</button>
            	                            
                	                    </form>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </br>
                       	
                       	
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Model Name</th>
                                  		<th>Year</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${cm.vm}" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${c.model_name}</td>
                                  		<td>${c.year}</td>
                                  		<td>
                                  			<a href="vehiclemodel.evs?id=${c.vmodel_id}" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="remove(${c.vmodel_id})" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-trash"></span>
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
	
function insert() {
	$.ajax({
		url: 'manipulate_vehicle_model.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Vehicle Model Added Successfully");
			location.reload();
		},
		error: function(link) {
			alert("Can't Add Vehicle Model");
			location.reload();
		}
	});	
	}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_vehicle_model.evs',
			type: 'POST',
			data: {action : 'deletevehiclemodel', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
</script>