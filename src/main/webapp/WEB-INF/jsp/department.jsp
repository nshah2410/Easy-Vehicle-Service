<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Cities
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Department
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
	                    </br>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Department</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${deptlist}" var="dl" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${dl.department_name}</td>
		                                <td>
		                                	<a href="area.evs?id=${dl.dept_no }" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="remove(${dl.dept_no})" class="btn btn-danger">
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
	
function add() {
	var dept = prompt("Enter Department Name:");
	if(dept !=  null){
	$.ajax({
		url: 'manipulate_department.evs',
		type: 'POST',
		data: {action : 'adddept' , dept : dept},
		success: function(){
			alert("Department Added Succesfully");
			location.reload();
		}
	});
	}
}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_department.evs',
			type: 'POST',
			data: {action : 'deletedept', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
</script>