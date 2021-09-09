
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add Customer Vehicle
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;"> DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Customer Vehicle
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-md-12">
                 	<div class="panel panel-default">
                        <div class="panel-heading">User Information</div>
                        <div class="panel-body">
                        	
                            <form class="form-horizontal" id="form">
                                  
                                
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label">Vehicle Company</label>
                                    <div class="col-sm-7">
                                    	<select class="form-control" name="vehiclecompany" onchange="getmodel(this.value)">
		                                	<option value = "">Select Vehicle Company</option>
		                                	<c:forEach items="${companylist}" var="c">
												<option value="${c.company_id}">${c.company_name}</option>
											</c:forEach>
		                            	</select>
		                            </div>
                                 </div>
                                 
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label">Vehicle Model</label>
                                    <div class="col-sm-7">
                                    	<select id="model" class="form-control" name="vehiclemodel">
		                                	<option value = "">Select Vehicle Model</option>
		                                	
		                            	</select>
		                            </div>
                                 </div>
                                 
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label">Vehicle Registration Number</label>
                                    <div class="col-sm-7">
                                    	<input type="text" class="form-control" onkeyup="this.value = this.value.toUpperCase();" name="registration_no" placeholder="GJ-01-XX-1234">
		                            </div>
                                 </div>
                                  	
                              	  <div class="form-group">
                                	<div class="col-sm-offset-3 col-sm-9">
                                  		<button type="button" onclick="insert()" id="submitbtn" class="btn btn-success">Submit</button>
                                	</div>
                              	  </div>
                              	  <input type="hidden" name="action" value="addcustomervehicle">
                              	  <input type="hidden" name="customer_id" value="<%= session.getAttribute("cid") %>"> 
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

function getmodel(id) {
	$.ajax({
	    type: 'GET',
	    url: 'manipulate_addcustomervehicle.evs',
	    data: {action : 'getcompanymodel', cid: id},
	    success: function(data){
	    	
			var obj = JSON.parse(data);
			
			var $select = $("#model");
	         $select.find("option").remove();  
	         $("<option>").val(null).text("Select Model").appendTo($select);
	         $.each(obj, function(index, vehicle) {
	         $("<option>").val(vehicle.vmodel_id).text(vehicle.model_name + " - " + vehicle.year).appendTo($select);
	         }); 
	    
	    }
  })
}

function insert() {
	$.ajax({
		url: 'manipulate_add_vehicle.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Added Successfully");
			location.reload();
		},
		error: function() {
			alert("Can't Add Data");
			location.reload();
		}
	});	
	}
</script>