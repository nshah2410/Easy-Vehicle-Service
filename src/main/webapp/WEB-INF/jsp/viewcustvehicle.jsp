<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ${custlist.name }'s Vehicles 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Customer
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Vehicle Reg. No.</th>
                                  		<th>Vehicle Model</th>
                                  		<th>Vehicle Model Year</th>
                                  		<th>Service History</th>
                                	</tr>
                                </thead>
                                <tbody>
									<c:forEach var="f" items="${custlist.uvm}" varStatus="count">                                
                                    <tr>
                                  		<td>${count.count }</td>
                                  		<td>${f.vehicle_no }</td>
                                  		<td>${f.vm.model_name }</td>
                                  		<td>${f.vm.year }</td>
		                                <td>
                                  			<a href="uservehiclehistory.evs?vid=${f.uv_id}" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
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
