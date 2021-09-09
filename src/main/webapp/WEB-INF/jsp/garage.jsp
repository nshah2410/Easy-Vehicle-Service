<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function valphone(){
	var no = document.getElementById("phone").value;
	var RE = /^[\d\.\-]+$/;
	var mobile_error = document.getElementById('mobile_error');
    if(!RE.test(no) || no.length != 10){
    	mobile_error.innerHTML = 'Enter valid mobile No. For Ex:- 9911111111' ;
    	mobile_error.style.display = 'inherit';
		document.getElementById("submitbtn").disabled = true;
	}
    else{
		email_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}

function valemail(){
	var x = document.getElementById("message-text").value;
	var atposition=x.indexOf("@");  
	var dotposition=x.lastIndexOf(".");
	var email_error = document.getElementById('email_error');
	if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
	  email_error.innerHTML = 'Enter valid Email Id For Ex:- abc@gmail.com' ;
	  email_error.style.display = 'inherit';
	  document.getElementById("submitbtn").disabled = true;  
	}  
	else{
		email_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}
</script>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Garage
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-wrench"></i> Garage
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
                    	                <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">Add New Employee</h4>
                        	        </div>
                                	<div class="modal-body">
                                    	<form id="form">
                                        	<div class="form-group">
                                            	<label for="recipient-name" class="control-label">Garage Name:</label>
                                            	<input type="text" class="form-control" name="garage_name" id="recipient-name" placeholder="Garage Name" required>
                                        	</div>                                        	
                                        
                                        	<div class="form-group">
                                            	<label for="message-text" class="control-label">Email:</label>
                                            	<input type="email" class="form-control" name="email_id" id="message-text" onblur="valemail()" placeholder="email id:- abc@gmail.com" required>
                                        	</div>
                                        	 
	                                        <span id="email_error" style="display:none;"></span>
                                        	<div class="form-group">
                                            	<label for="message-text" class="control-label">Contact No:</label>
    	                                        <input type="number" class="form-control" id="phone" name="mobile_no" onblur="valphone()" placeholder="Enter contact number" required>
	                                        </div>
	                                        <span id="mobile_error" style="display:none;"></span>
	                                        <div class="form-group">
		                                    	<label>City</label>
		                                        <select class="form-control" name="city" id="city" required onchange="getarea(this.value)">
		                                    		<option value = "">Select City</option>
		                                    		 <c:forEach items="${clist}" var="c">
		                                    			<option <c:if test="${c.city_id == param.cityid }" > selected="selected" </c:if> value = "${c.city_id }">${c.city_name }</option>
		                                    		</c:forEach>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                    	<label>Area</label>
		                                        <select class="form-control" name="area" id="area" required>
		                                    		<option value = "">Select Area</option>
		                               		 	</select>
		                                    </div>
		                                    
		                                    <div class="form-group">
                                    			<label>Address</label>
                                      			<textarea class="form-control" name="address"></textarea>
                                  			</div>
		                                    
		                                    
		                                    <input type="hidden" name="action" value="addgarage">
            	                            <button type="button" class="btn btn-success pull-left" id="submitbtn" onclick="insert()">Submit</button>
            	                            
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
                                  		<th>Garage Name</th>
                                  		<th>Email Id</th>
                                  		<th>Mobile No.</th>
                                  		<th>Rating</th>
                                  		<th>Inventory</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${glist}" var="g" varStatus="count">
                                    <tr>
                                  		<td>${count.count }</td>
                                  		<td>${g.garage_name }</td>
                                  		<td>${g.email_id }</td>
                                  		<td>${g.mobile_no }</td>
                                  		<td>${g.feedback }</td>
                                  		<td>
                                  			<a href="admingarageinventory.evs?gid=${g.garage_id }" class="btn btn-primary">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
                                  		</td>
		                                <td>
		                                	<a href="garagedetails.evs?gid=${g.garage_id }" class="btn btn-primary">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
                                  			/
                                  			<a href="editgarage.evs?gid=${g.garage_id }" class="btn btn-success">
                                  				<span class="glyphicon glyphicon-pencil"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="remove()" class="btn btn-danger">
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
		url: 'manipulate_garage.evs',
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
			url: 'manipulate_garage.evs',
			type: 'POST',
			data: {action : 'deletegarage', id : id},
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


</script>