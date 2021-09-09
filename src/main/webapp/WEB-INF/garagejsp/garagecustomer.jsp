<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Customers
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-users"></i> Customers
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
                    	                <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">Add New Customer</h4>
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
    	                                        <input type="number" class="form-control" id="phone" onblur="phone()" name="mobile_no" placeholder="Enter contact number" required>
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
                                            	<label for="message-text" class="control-label">Address:</label>
    	                                        <textarea class="form-control" id="address" name="address" placeholder="Enter Address" required>
    	                                        </textarea>
	                                        </div>
		
											<input type="hidden" name="action" value="addcustomer">
            	                            <button type="button" id="submitbtn" class="btn pull-left" onclick="insert()">Submit</button>
            	                            
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
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${clist}" var="cl" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${cl.name}</td>
                                  		<td>${cl.email_id}</td>
                                  		<td>${cl.mobile_no}</td>
                                  		<td>${cl.gender}</td>
		                                <td>
                                  			<a href="garageuservehicle.evs?id=${cl.cust_id }" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
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
		url: 'manipulate_customer.evs',
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
			url: 'manipulate_customer.evs',
			type: 'POST',
			data: {action : 'deletecustomer', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
function phone(){
	var no = document.getElementById("phone").value;
	var RE = /^[\d\.\-]+$/;
    if(!RE.test(no)){
		alert("Enter valid mobile No.");
		document.getElementById("submitbtn").disabled = true;
	}
}



function search() {
	var search= $('#search').val();
	alert(search);
	$.ajax({
	url: 'search_customer.evs',
	type: 'get',
	data: {search: search},
	success: function(data) {
	alert(data);
	$("#showlist").html(data);
	}
	});
	};
</script>