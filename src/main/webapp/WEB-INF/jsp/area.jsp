<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${cm.city_name }'s Area
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li>
                                <i class="fa fa-building"></i>  <a href="city.evs" style="text-decoration: none;">City</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Areas
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
                    	                <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">Add Area</h4>
                        	        </div>
                                	<div class="modal-body">
                                    	<form id="form">
                                        	<div class="form-group">
                                            	<label for="recipient-name" class="control-label">Area Name:</label>
                                            	<input type="text" class="form-control" name="area_name" placeholder="Area Name" required>
                                        	</div>
                                        	
                                        	<div class="form-group">
                                            	<label for="recipient-name" class="control-label">Pincode:</label>
                                            	<input type="number" class="form-control" name="pincode" onblur="validate(this.value)" placeholder="Pincode" required>
                                        	</div>                                        
                               
		                                    <input type="hidden" name="city_id" value="${cm.city_id }">
											<input type="hidden" name="action" value="addarea">
            	                            <button type="button" class="btn pull-left" id="submit-btn" onclick="insert()">Submit</button>
            	                            
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
                                  		<th>Area</th>
                                  		<th>Pincode</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${cm.am}" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${c.area_name}</td>
                                  		<td>${c.pincode}</td>
                                  		<td>
                                  			<a href="vehiclemodel.evs?id=" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-pencil"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="remove(${c.area_id})" class="btn btn-danger">
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
		url: 'manipulate_city.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Area Added Successfully");
			location.reload();
		},
		error: function(link) {
			alert("Can't Add Area. It may already exist");
			location.reload();
		}
	});	
	}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_city.evs',
			type: 'POST',
			data: {action : 'removearea', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
function validate(code){
	if(code.length!=6){
		alert("Pincode Should be 6 digit number");
		document.getElementById("submit-btn").disabled = true;
	}
	else{
		document.getElementById("submit-btn").disabled = false;
	}
}
</script>