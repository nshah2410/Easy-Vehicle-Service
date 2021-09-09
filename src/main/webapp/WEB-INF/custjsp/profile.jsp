<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script>
function viewp() {
	  var x = document.getElementById("password1");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
	
function passvalid(){
	var str = document.getElementById("password1").value;
	if (!(str.match(/[a-z]/g) && str.match(/[A-Z]/g) && str.match(/[0-9]/g) && str.match(/[^a-zA-Z\d]/g) && str.length >= 8)){
		alert("Password should have atleast 8 character and should contain 1 uppercase, 1 lowercase and a special Character");
		document.getElementById("submitbtn").disabled = true;
	}
	else{
		document.getElementById("submitbtn").disabled = false;
	}
}

function phone(){
	var no = document.getElementById("contact").value;
	var RE = /^[\d\.\-]+$/;
    if(!RE.test(no) || no.length < 10){
		alert("Enter valid mobile No.");
		document.getElementById("submitbtn").disabled = true;
	}
}
</script>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${cl.name }'s Profile
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Profile
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
                                      <input type="text" class="form-control" name="name" value="${cl.name  }" placeholder="Enter Full Name">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                          <span class="input-group-addon">@</span>
                                          <input type="text" name="email_id" value="${cl.email_id}" readonly="readonly" class="form-control" placeholder="Username">
                                        </div>
                                    </div>
                                  </div>
                                  
                                   <div class="form-group">
                                    <label class="col-sm-3 control-label">Mobile No</label>
                                    <div class="col-sm-7">
                                      <input type="number" class="form-control" id="contact" name="mobile_no" onblur="phone()" value="${cl.mobile_no }" placeholder="Enter Mobile No">
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
                                  
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label">Password </label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                        	<input type="password" name="password" id="password1" onblur="passvalid()" value="${cl.rm.password}" class="form-control" placeholder="Password">
                                         	<span class="input-group-btn">
                                            	<button class="btn btn-default" onclick="viewp()" type="button"><span class="glyphicon glyphicon-eye-open"></span></button>
                                          	</span>
                                        </div>
                                    </div>
                                  </div>
                                  	<input type="hidden" name="user_id" value="${cl.rm.user_id }"/>
                                  	<input type="hidden" name="role" value="${cl.rm.role }"/>
                              		<input type="hidden" name="id" value="${cl.cust_id }"/>
                              		<input type="hidden" name="action" value="customer_profile"/>
                              	  <div class="form-group">
                                	<div class="col-sm-offset-3 col-sm-9">
                                  		<button type="button" onclick="update()" id="submitbtn" class="btn btn-success">Submit</button>
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
function update() {
	$.ajax({
		url: 'manipulate_profile.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Updated Successfully");
			window.location.href="index.evs";
		},
		error: function(link) {
			alert("Can't Update profile");
			location.reload();
		}
	});	
	}
</script>