<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Serviced Vehicles
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Service History
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
                                  		<th>Vehicle</th>
                                  		<th>Serviced On</th>
                                  		<th>Garage Name</th>
                                  		<th>Details</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${services }" var="s" varStatus="count">
                                    <tr>
                                  		<td>${count.count }</td>
                                  		<td>${s.uvm.vm.model_name } ( ${s.uvm.vehicle_no } )</td>
                                  		<td><fmt:formatDate value="${s.service_date }" type="date"/></td>
                                  		<td>${s.gm.garage_name }</td>
		                                <td>
		                                	<a href="servicedetails.evs?id=${s.service_id }" class="btn btn-primary">
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