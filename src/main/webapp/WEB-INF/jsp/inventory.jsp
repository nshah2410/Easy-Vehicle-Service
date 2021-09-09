<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Inventory List 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-list"></i> Inventory
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
		                        <select class="form-control" name="company" onchange="getmodel(this.value)">
		                        		<option value = "0">Select Vehicle Company</option>
		                        		<c:forEach items="${clist}" var="c">
		                        			<option value="${c.company_id }">${c.company_name }</option>
		                        		</c:forEach>
		                        </select>
		                        </div>
		                    
		                    <div class="col-sm-1">		                    
		                    </div>
		                    
								<label class="col-sm-1 control-label">Vehicle Model</label>
								<div class="col-sm-3">
		                        <select class="form-control" name="Model" id="model" onchange="getparts(this.value)">
		                        		<option value = "0">Select Vehicle Model</option>
		                        </select>
		                        </div>
		                        
		                         <div class="col-sm-2">
				                 </div>
		                        
		                        <ul class="list-unstyled list-inline showcase-btn">
                    				<li><button type="button" onclick="return add()" class="btn btn-success">Add</button></li>
                				</ul>
		                    </div>
		                    
		             </div>
		             <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Parts Name</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                
                                   
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
                 + parts.part_name
                 +'</td>'
                 + '<td> <button type="button" onclick="edit('
                 +parts.part_id
       			+')" class="btn btn-danger"> <span class="glyphicon glyphicon-edit"></span></button> / <button type="button" onclick="remove('
  	  			+parts.part_id
  	  			+')" class="btn btn-danger"> <span class="glyphicon glyphicon-trash"></span></button></td>';
         });
     $('#tbody').append(trHTML);
}
function add() {
	var part = prompt("Enter Part name:");
	var vehicle = document.getElementById("model").value;
	if(vehicle != 0){
		if(part !=  null){
			$.ajax({
				url: 'manipulate_inventory_part.evs',
				type: 'POST',
				data: {action : 'addpart' , part : part, vehicle: vehicle },
				success: function(data){
					alert("Part Added Succesfully");
					dynamic(data);
				}
			});
			}
	}
	else{
		alert("Please select vehicle first");
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

function getparts(id){
	$.ajax({
	    type: 'post',
	    url: 'manipulate_inventory_part.evs',
	    data: {action : 'getparts', vid: id},
	    success: function(data){
	    	dynamic(data);
	    }
	    })
}
</script>