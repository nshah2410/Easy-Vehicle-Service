<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${gdetail.garage_name }'s Details
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;"> DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-wrench"></i> <a href="garage.evs" style="text-decoration: none;"> Garage</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i> Garage's Details
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
                                 
                                  <div class="table-responsive">
                            		<table class="table table-hover table-striped">
                                		<tbody>
		                                    <tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Garage Name</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${gdetail.garage_name }
		                                  			</td>
		                                  			<td>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Email Id</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${gdetail.email_id }
		                                  			</td>
		                                  			<td>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Mobile No.</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${gdetail.mobile_no }
		                                  			</td>
		                                  			<td>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Address</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${gdetail.address }, ${gdetail.am.area_name }, ${gdetail.cm.city_name }
		                                  			</td>
		                                  			<td>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Ratings</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${gdetail.feedback } / 5
		                                  			</td>
		                                  			<td>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">No. of Employees</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${employees }
		                                  			</td>
		                                  			<td>
		                                  				<a href="garageemployee.evs?gid=${gdetail.garage_id }" class="btn btn-outline-primary">
                                  							<span>View</span>
                                  						</a>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">No. of Customers</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${customers }
		                                  			</td>
		                                  			<td>
		                                  				<a href="garagecustomer.evs?gid=${gdetail.garage_id }" class="btn btn-outline-primary">
                                  							<span>View</span>
                                  						</a>
		                                  			</td>
		                                  		</tr>
		                                  		<tr>
		                                  			<td>
		                                  				<label class="control-label col-sm-8">Vehicle Serviced</label>
		                                  			</td>
		                                  			<td style="text-align:left">
		                                  				${services }
		                                  			</td>
		                                  			<td>
		                                  				<a href="" class="btn btn-outline-primary">
                                  							<span>View</span>
                                  						</a>
		                                  			</td>
		                                  		</tr>
		                                	</tr>
		                                </tbody>
		                            </table>
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