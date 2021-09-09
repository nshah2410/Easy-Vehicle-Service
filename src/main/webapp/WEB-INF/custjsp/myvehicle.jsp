<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            My Vehicles
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-car"></i> Vehicle
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                    		<div style="text-align: justify-right; vertical-align: middle;">
                   			 	<div align="right" style="">
                        			<button type="button" class="btn pull-right btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Add</button></br>
	                   		 	</div>
	                   		</div> 	
	                    </br>
		                    
		             </div>
		             <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No.</th>
                                  		<th>Company / Vehicle</th>
                                  		<th>Registration No.</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
	                                <c:forEach items="${vlist}" var="v" varStatus="count">
	                                <tr>
	                                <td>${count.count }</td>
	                                <td>${v.vm.cm.company_name } / ${v.vm.model_name} - ${v.vm.year}</td>
	                                <td>${v.vehicle_no }</td>
	                                 <td>
                                  		<a href="addcustomervehicle.evs?id=${v.uv_id }" class="btn btn-success">
                                  				<span class="glyphicon glyphicon-pencil"></span>
                                  		</a>
                                		/
                                  		<button type="button" onclick="remove(${v.uv_id})" class="btn btn-danger">
                                  			<span class="glyphicon glyphicon-trash"></span>
                                		</button>
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
        
<script>
function add(){
	window.location.href = "addcustomervehicle.evs";
}
</script>