<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${cl.name }'s Details
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> <a href="customer.evs" style="text-decoration: none;">Customer</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Edit Customer's Details
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
                                    <label class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-7">
                                      <input type="text" class="form-control" name="name" value="${cl.name }" placeholder="Enter Full Name">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <span class="input-group-addon">@</span>
                                          <input type="text" name="email_id" value="${cl.email_id}" class="form-control" placeholder="Username">
                                        </div>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    <label class="col-sm-3 control-label">Mobile No</label>
                                    <div class="col-sm-7">
                                      <input type="number" class="form-control" name="mobile_no" value="${cl.mobile_no }" placeholder="Enter Mobile No">
                                    </div>
                                  </div>
                                  
                                  <c:set var="male" value="Male"></c:set>
                                  <c:set var="female" value="Female"></c:set>
                                   <div class="form-group">
                                   		<label class="col-sm-3 control-label">Gender</label>&nbsp;&nbsp;
                                    	<div class="col-sm-1">
                                            <input name="gender" <c:if test="${fn:containsIgnoreCase(cl.gender, 'Male')}"> checked </c:if>  value="Male" type="radio">    
                                    	</div>
                                    	<b class="col-sm-3" >Male</b>
                                    	
                                    	<div class="col-sm-1">
                                            <input  name="gender" <c:if test="${fn:containsIgnoreCase(cl.gender, 'Female')}"> checked </c:if> value="Female" type="radio">
                                    	</div>
                                    		<b class="col-sm-2" >Female</b>
                                  	</div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Address</label>
                                    <div class="col-sm-7">
                                      <textarea type="number" class="form-control" name="address" value="${cl.address}">${cl.address}</textarea>
                                    </div>
                                  </div>
                                  
                              		<input type="hidden" name="user_id" value="${cl.rm.user_id }"/>
                                  	<input type="hidden" name="role" value="${cl.rm.role }"/>
                              		<input type="hidden" name="id" value="${cl.cust_id }"/>
                              		<input type="hidden" name="action" value="editcustomer"/>
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
		url: 'manipulate_customer.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Updated Successfully");
			window.location.href="customer.evs";
		},
		error: function(link) {
			alert("Can't Add Data");
			location.reload();
		}
	});	
	}
</script>