<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Employees
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-users"></i> Employee
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
	                    </div>

 	                   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" form-responsive>
    	                    <div class="modal-dialog" role="document">
        	                    <div class="modal-content">
            	                    <div class="modal-header">
                	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	                <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">Add New Employee</h4>
                        	        </div>
                                	<div class="modal-body">
                                    	<form id="form">
                                        	<div class="form-group">
                                            	<label for="recipient-name" class="control-label">Full-Name:</label>
                                            	<input type="text" class="form-control" name="name" id="recipient-name" placeholder="First-name Middle-name Last-name" required>
                                        	</div>                                        	
                                        
                                        	<div class="form-group">
                                            	<label for="message-text" class="control-label">Email:</label>
                                            	<input type="email" class="form-control" name="email_id" id="message-text" placeholder="email id:- abc@gmail.com" required>
                                        	</div>
                                        	<div class="form-group">
                                            	<label for="message-text" class="control-label">Contact No:</label>
    	                                        <input type="number" class="form-control" id="phone" name="mobile_no" placeholder="Enter contact number" required>
	                                        </div>
	                                        
	                                        <div class="form-group">
		                                    	<label>Gender</label>
		                                        <select class="form-control" name="gender" required>
		                                    		<option value = "">Select Gender</option>
		                                       		<option value = "Male">Male</option>
		                                       		<option value = "Female">Female</option>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                    	<label>City:</label>
		                                        <select class="form-control" name="city_id" required onchange="getarea(this.value)">
		                                    		<option value = "">Select City</option>
		                                       		<c:forEach items="${city}" var="c">
														<option value="${c.city_id}">${c.city_name}</option>
													</c:forEach>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                    	<label>Area</label>
		                                        <select class="form-control" name="area" id="area" onchange="getgarage(this.value)" required>
		                                    		<option value = "">Select Area</option>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                    	<label>Garage Name:</label>
		                                        <select class="form-control" name="garage_id" id="garage" required>
		                                    		<option value = "">Select Garage</option>
		                                       		<c:forEach items="${glist}" var="g">
														<option value="${g.garage_id}">${g.garage_name}</option>
													</c:forEach>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                    	<label>Department</label>
		                                        <select class="form-control" name="department" required>
		                                    		<option value = "">Select Department</option>
		                                       		<c:forEach items="${deptlist}" var="d">
														<option value="${d.dept_no}">${d.department_name}</option>
													</c:forEach>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <input type="hidden" name="action" value="addemployee">
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
                                  		<th>Name</th>
                                  		<th>Email Id</th>
                                  		<th>Mobile No.</th>
                                  		<th>Gender</th>
                                  		<th>Garage</th>
                                  		<th>Department</th>                
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${emplist}" var="el" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${el.emp_name}</td>
                                  		<td>${el.email_id}</td>
                                  		<td>${el.mobile_no}</td>
                                  		<td>${el.gender}</td>
                                  		<td>${el.gm.garage_name }</td>
                                  		<td>${el.dm.department_name }</td>
		                                <td>
                                  			<a href="editemployee.evs?id=${el.emp_id}" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-pencil"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="remove(${el.emp_id})" class="btn btn-danger">
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
		url: 'manipulate_employee.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Added Successfully");
			location.reload();
		},
		error: function(link) {
			alert("Can't Add Data");
			location.reload();
		}
	});	
	}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_employee.evs',
			type: 'POST',
			data: {action : 'deleteemployee', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}

function getarea(id) {
	$.ajax({
	    type: 'GET',
	    url: 'manipulate_garage.evs',
	    data: {action : 'getarea', cityid: id},
	    success: function(data){
	    	
			var obj = JSON.parse(data);
			
			var $select = $("#area");
	         $select.find("option").remove();  
	         $("<option>").val(null).text("Select Area").appendTo($select);
	         $.each(obj, function(index, area) {
	         $("<option>").val(area.area_id).text(area.area_name).appendTo($select);
	         }); 
	    
	    }
  })
}
function getgarage(id) {
	$.ajax({
	    type: 'GET',
	    url: 'manipulate_garage.evs',
	    data: {action : 'getgarage', area_id: id},
	    success: function(data){
	    	
			var obj = JSON.parse(data);
			
			var $select = $("#garage");
	         $select.find("option").remove();  
	         $("<option>").val(null).text("Select Garage").appendTo($select);
	         $.each(obj, function(index, g) {
	         $("<option>").val(g.garage_id).text(g.garage_name).appendTo($select);
	         }); 
	    
	    }
  })
}
</script>