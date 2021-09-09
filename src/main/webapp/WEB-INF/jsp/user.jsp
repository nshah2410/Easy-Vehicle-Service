<script>

function add(){
	window.location.href="registration.evs";
}
</script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           Users
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
                       

                    
                        <ul class="list-unstyled list-inline showcase-btn">
                    		<li><button type="button" onclick="add()" class="btn btn-success">Add</button></li>
                		</ul>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Name</th>
                                  		<th>Email ID</th>
                                  		<th>Mobile No.</th>
                                  		<th>Role</th>
                                  		<th>Gender</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<td>1</td>
                                  	<td>Shah Neel</td>
                                  	<td>nshah2410@gmail.com</td>
                                  	<td>7405996943</td>
                                  	<td>Admin</td>
                                  	<td>Male</td>
                                  	<td>
                                  		<a href="Userform.evs" class="btn btn-danger">
                                  			<span class="glyphicon glyphicon-pencil"></span>
                                  		</a> /
                                  		<button type="button" onclick="remove()" class="btn btn-danger">
                                  			<span class="glyphicon glyphicon-trash"></span>
                                		</button>
                                  	</td>
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