<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Vehicle List 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-list"></i> Vehicles
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                    		<div class="form-group">
								<label class="col-sm-1 control-label">Company</label>
								<div class="col-sm-3">
		                        <select class="form-control" name="company" onchange="getmodel(this.value); getlistmodel(this.value)">
		                        		<option value = "0">Select Vehicle Company</option>
		                        		<c:forEach items="${clist}" var="c">
		                        			<option value="${c.company_id }">${c.company_name }</option>
		                        		</c:forEach>
		                        </select>
		                        </div>
		                    
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
                            					<label>Vehicle Model</label>
                            						<select class="form-control" name="model" id="model" onchange="getparts(this.value)">
                                						<option value = "0">Select Vehicle Model</option>
                            						</select>
                        					</div>
                        
                        					<button type="button" class="btn pull-left" onclick="insert()">Submit</button>
            	                            <input type="hidden" name="garage_id" value="${cid }">
            	                            <input type="hidden" name="action" value="addvehicle">
                						</form>
                    					<div class="clearfix">
                    						<input type="hidden" name="garage_id" value="${cid }" id="garage_id">
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
</br>
		                    
								
		                     		                        
		                        
		               	</div>
		                    
		             </div>
		             <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Vehicle Name</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                	<c:forEach items="${vlist}" var="v" varStatus="count">
                                		<tr>
                                			<td>${count.count }</td>
                                			<td>${v.vm.cm.company_name } / ${v.vm.model_name } - ${v.vm.year }</td>
                                			<td>
                                				<button type="button" class="btn btn-danger">
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
function dynamic(data){
	var $select = $("#tbody");
    $select.find("tr").remove();
	var obj = JSON.parse(data);
	var trHTML = '';
    $.each(obj, function (i, parts) {
         trHTML +=
                 '<tr><td>'
                 + (i+1) 
                 + '</td><td>'
                 + parts.model_name + " - " + parts.year
                 +'</td>'
                 + '<td>  <button type="button" onclick="remove('
  	  			+parts.vmodel_id 
  	  			+')" class="btn btn-danger"> <span class="glyphicon glyphicon-trash"></span></button></td> </tr>';
         });
     $('#tbody').append(trHTML);
}
function insert() {
	var model = document.getElementById("model").value;
	alert(model);
	if(model !=  null){
			$.ajax({
				url: 'manipulate_garage_vehicle.evs',
				type: 'POST',
				data: $('#form').serialize(),
				success: function(data){
					alert("Vehicle Added Succesfully");
				}
			});
			}
	else{
		alert("Please select vehicle model first");
	}
}
function remove(id){
	var vehicle = document.getElementById("model").value;
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_inventory_part.evs',
			type: 'POST',
			data: {action : 'deletepart', id : id, vid : vehicle},
			success: function(data) {
				alert("Deleted Sucessfully");
				dynamic(data);
			}
		});
	}
}
function edit(id){
	var part = prompt("Enter part name");
	var vehicle = document.getElementById("model").value;
	if(part != null){
		$.ajax({
			url: 'manipulate_inventory_part.evs',
			type: 'POST',
			data: {action : 'editparts' , part : part , id : id, vehicle : vehicle},
			success: function(data){
				alert("Part Updated Succesfully");
				dynamic(data);
			}
		});
	}
	else{
		alert("Field can't be null!");
	}
}

function getmodel(id) {
	$.ajax({
	    type: 'GET',
	    url: 'manipulate_addcustomervehicle.evs',
	    data: {action : 'getcompanymodel', cid: id},
	    success: function(data){
	    	
			var obj = JSON.parse(data);
			
			var $select = $("#model");
	         $select.find("option").remove();  
	         $("<option>").val("0").text("Select Model").appendTo($select);
	         
	         $.each(obj, function(index, vehicle) {
	         $("<option>").val(vehicle.vmodel_id).text(vehicle.model_name + " - " + vehicle.year).appendTo($select);
	         }); 
	    
	    }
  })
}

function getlistmodel(id){
	var garage = document.getElementById("garage_id").value;
	$.ajax({
	    type: 'POST',
	    url: 'manipulate_garage_vehicle.evs',
	    data: {action : 'getvehicle', id: id , garage_id : garage},
	    success: function(data){
			dynamic(data);
	    }
  })
}
</script>