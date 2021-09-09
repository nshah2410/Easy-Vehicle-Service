<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${gd.garage_name }'s Details
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-wrench"></i> <a href="garage.evs" style="text-decoration: none;">Garages</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Edit Garage's Details
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
            <div class="row">
            
            	<div class="col-md-12">
                 	<div class="panel panel-default">
                        <div class="panel-heading">Garage Information</div>
                        <div class="panel-body">
                        	
                            <form class="form-horizontal" id="form">
                                 
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Garage Name</label>
                                    <div class="col-sm-7">
                                      <input type="text" class="form-control" name="garage_name" value="${gd.garage_name }" placeholder="Enter Full Name">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <span class="input-group-addon">@</span>
                                          <input type="text" name="email_id" value="${gd.email_id }" class="form-control" placeholder="Username">
                                        </div>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    <label class="col-sm-3 control-label">Mobile No</label>
                                    <div class="col-sm-7">
                                      <input type="number" class="form-control" name="mobile_no" value="${gd.mobile_no }" placeholder="Enter Mobile No">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">City</label>
                                    <div class="col-sm-7">
                                      <select class="form-control" name="city_id" required onchange="getarea(this.value)">
		                                    <option value = "">Select City</option>
		                                       	<c:forEach items="${clist}" var="c">
													<option <c:if test="${fn:contains(gd.cm.city_id,c.city_id) }" > selected="selected" </c:if> value="${c.city_id}">${c.city_name}</option>
												</c:forEach>
		                              </select>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Area</label>
                                    <div class="col-sm-7">
                                      <select class="form-control" name="area_id" required id="area">
		                                    <option value = "">Select City</option>
		                                       	<c:forEach items="${alist}" var="a">
													<option <c:if test="${fn:contains(gd.am.area_id,a.area_id) }" > selected="selected" </c:if> value="${a.area_id}">${a.area_name}</option>
												</c:forEach>
		                              </select>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Address</label>
                                    <div class="col-sm-7">
                                      <textarea class="form-control" name="address">${gd.address }</textarea>
                                    </div>
                                  </div>
                                  
                              		<input type="hidden" name="garage_id" value="${gd.garage_id }"/>
                                	<input type="hidden" name="action" value="editgarage"/>
                                	<input type="hidden" name="login_id" value="${gd.rm.user_id }"/>
                                	<input type="hidden" name="feedback" value="${gd.feedback }"/>
                              	  <div class="form-group">
                                	<div class="col-sm-offset-3 col-sm-9">
                                  		<button type="button" onclick="insert()" class="btn btn-success">Submit</button>
                                	</div>
                              	  </div>
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
function insert() {
	$.ajax({
		url: 'manipulate_garage.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Updated Successfully");
			window.location.href="garage.evs";
		},
		error: function(link) {
			alert("Can't Add Data");
			location.reload();
		}
	});	
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