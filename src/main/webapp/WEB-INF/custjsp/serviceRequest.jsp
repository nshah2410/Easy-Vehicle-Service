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
                                <i class="fa fa-list"></i> Send Request
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                <form method="post" action="price_estimation.evs">
                    <div class="col-lg-12">
                    		<div class="form-group">
								<label class="col-sm-1 control-label">Vehicle</label>
								<div class="col-sm-3">
		                        <select class="form-control" name="vehicle" id="vehicle" onchange="getparts(this.value)">
		                        <option value = "0">Select Vehicle</option>
		                        		<c:forEach var="v" items="${vlist}">
		                        			<option value="${v.vm.vmodel_id }"> (${v.vehicle_no }) - ${v.vm.model_name} (${v.vm.year}) 
		                        		</c:forEach>
		                        </select>
		                        </div>
		                   
								<label class="col-sm-1 control-label">City</label>
								<div class="col-sm-3">
		                        		<select class="form-control" name="city" id="city" required onchange="getarea(this.value)">
		                                	<option value = "0">Select City</option>
		                                	<c:forEach items="${clist}" var="c">
		                                    	<option value = "${c.city_id }">${c.city_name }</option>
		                                    </c:forEach>
		                               	</select>
		                        </div>
		                        
		                        <label class="col-sm-1 control-label">Area</label>
								<div class="col-sm-3">
		                        		<select class="form-control" name="area" id="area" required>
		                                	<option value = "0">Select Area</option>
		                               	</select>
		                               	</select>
		                        </div>
		                        
		                    </div>
		             </div>
		             <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                    	<th>Sr. No.</th>
                                  		<th>Parts Name</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                
                                   
                                </tbody>
                            </table>
                        </div>
                        
                        <input type="submit" id="submit-btn" class="btn pull-right btn-success" value="Get Estimation">
                    </div>
                    </form>
                </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<script>
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
                 + '<td> <input type="checkbox" name="parts" value="'
                 +parts.part_id
                 +'">';
         });
     $('#tbody').append(trHTML);
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
function estimation(){
	var city = document.getElementById("city").value;
	var area = document.getElementById("area").value;
	var vehicle = document.getElementById("vehicle").value;
	var checkboxes = document.getElementsByName('parts');
	var selected = [];
	for (var i=0; i<checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	        selected.push(checkboxes[i].value);
	    }
	}
	if(vehicle == 0){
		alert("Please select Vehicle first");
		document.getElementById('submit-btn').disabled = true;
	}
	else if(city == 0){
		alert("Please select City first");
		document.getElementById('submit-btn').disabled = true;
	}
	else if(area == 0){
		alert("Please select Area first");
		document.getElementById('submit-btn').disabled = true;
	}
	else if(selected.length == 0){
		alert("Please select at least one parts")
		document.getElementById('submit-btn').disabled = true;
	}
	else{
		document.getElementById('submit-btn').disabled = false;
	}
	
}
</script>