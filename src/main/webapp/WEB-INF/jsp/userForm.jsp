<script>
function viewp() {
	  var x = document.getElementById("inputPassword3");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           User Registration Form 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> User Details
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                    	<div class="panel panel-default">
                        <div class="panel-heading">User Information</div>
                        <div class="panel-body">
                        	
                            <form:form modelAttribute="userForm">
                                 
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-7">
                                      <form:input type="text" class="form-control" path="name" value="" placeholder="Enter Full Name"/>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <span class="input-group-addon">@</span>
                                          <form:input type="text" path="email_id" class="form-control" placeholder="Username"/>
                                        </div>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    <label class="col-sm-3 control-label">Mobile No</label>
                                    <div class="col-sm-7">
                                      <form:input type="number" class="form-control" path="mobile_no"  placeholder="Enter Mobile No"/>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                	<label class="col-sm-3 control-label">Gender</label>
                                	<div class="col-sm-7">
                                		<label class="radio-inline">
                                    		<form:radiobutton path="gender" value="male" checked/>Male
                                		</label>
                                		<label class="radio-inline">
	                                    	<form:radiobutton path="gender" value="female"/>Female
    	                            	</label>
    	                            </div>
                            	  </div> 
                                   
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Role</label>
                                    <div class="col-sm-7">
                                        <form:select class="form-control" path="rm.role_id">
                                            <option value="">-- Select a Role --</option>
                                            <c:forEach items="${role}" var="a">
													<form:option value="${a.role_id}">${a.role_name}</form:option>
											</c:forEach>
                                        </form:select>
                                    </div>
                                  </div>
                                  
                              	  <div class="form-group">
                              	  	<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <form:password path="password" path="password" value="" class="form-control" id="inputPassword3" placeholder="Password"/>
                                          <span class="input-group-btn">
                                            <button class="btn btn-default" onclick="viewp()" type="button"><span class="glyphicon glyphicon-eye-open"></span></button>
                                          </span>
                                        </div>
                                    </div>
                                  </div>
                              		<input type="hidden" name="action" value="adduser"/>
                              	  <div class="form-group">
                                	<div class="col-sm-offset-3 col-sm-9">
                                  		<form:button class="btn btn-success">Submit</form:button>
                                	</div>
                              	  </div>
                        	</form:form>
                        </div>
                   </div>
                   

                    
                    </div>
                </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->