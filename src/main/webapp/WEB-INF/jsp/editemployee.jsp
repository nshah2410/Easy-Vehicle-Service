<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${el.emp_name }'s Details
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-users"></i> <a href="employee.evs" style="text-decoration: none;">Employees</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Edit Employee's Details
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
            <div class="row">
            
            	<div class="col-md-12">
                 	<div class="panel panel-default">
                        <div class="panel-heading">Employee Information</div>
                        <div class="panel-body">
                        	
                            <form class="form-horizontal" id="form">
                                 
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-7">
                                      <input type="text" class="form-control" name="name" value="${el.emp_name }" placeholder="Enter Full Name">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <span class="input-group-addon">@</span>
                                          <input type="text" name="email_id" value="${el.email_id}" class="form-control" placeholder="Username">
                                        </div>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    <label class="col-sm-3 control-label">Mobile No</label>
                                    <div class="col-sm-7">
                                      <input type="number" class="form-control" name="mobile_no" value="${el.mobile_no }" placeholder="Enter Mobile No">
                                    </div>
                                  </div>
                                  
                                  <c:set var="male" value="Male"></c:set>
                                  <c:set var="female" value="Female"></c:set>
                                   <div class="form-group">
                                   		<label class="col-sm-3 control-label">Gender</label>&nbsp;&nbsp;
                                    	<div class="col-sm-1">
                                            <input name="gender" <c:if test="${fn:containsIgnoreCase(el.gender, 'Male')}"> checked </c:if>  value="Male" type="radio">    
                                    	</div>
                                    	<b class="col-sm-3" >Male</b>
                                    	
                                    	<div class="col-sm-1">
                                            <input  name="gender" <c:if test="${fn:containsIgnoreCase(el.gender, 'Female')}"> checked </c:if> value="Female" type="radio">
                                    	</div>
                                    		<b class="col-sm-2" >Female</b>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Garage</label>
                                    <div class="col-sm-7">
                                      <select class="form-control" name="garage_id" required>
		                                    <option value = "">Select Garage</option>
		                                       	<c:forEach items="${glist}" var="d">
													<option <c:if test="${fn:contains(el.gm.garage_id,d.garage_id) }" > selected="selected" </c:if> value="${d.garage_id}">${d.garage_name}</option>
												</c:forEach>
		                              </select>
                                    </div>
                                  </div>
                                  
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Department</label>
                                    <div class="col-sm-7">
                                      <select class="form-control" name="department" required>
		                                    <option value = "">Select Department</option>
		                                       	<c:forEach items="${deptlist}" var="d">
													<option <c:if test="${fn:contains(el.dm.dept_no,d.dept_no) }" > selected="selected" </c:if> value="${d.dept_no}">${d.department_name}</option>
												</c:forEach>
		                              </select>
                                    </div>
                                  </div>
                                  
                              		<input type="hidden" name="user_id" value="${el.rm.user_id }"/>
                                	<input type="hidden" name="role" value="${el.rm.role }"/>
                              		<input type="hidden" name="id" value="${el.emp_id }"/>
                              		<input type="hidden" name="action" value="editemployee"/>
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
		url: 'manipulate_employee.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Updated Successfully");
			window.location.href="index.evs";
		},
		error: function(link) {
			alert("Can't Update Data");
			location.reload();
		}
	});	
	}
</script>