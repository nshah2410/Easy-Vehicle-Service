<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Privileges
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Privileges
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                       	<ul class="list-unstyled list-inline showcase-btn">
                    		<li><button type="button" onclick="return add()" class="btn btn-success">Add</button></li>
                		</ul>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Role</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${privilegelist}" var="pl" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${pl.privilege_name}</td>
		                                <td>
                                  			<button type="button" onclick="edit(${pl.p_id})" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-edit"></span>
                                			</button>
                                			/
                                  			<button type="button" onclick="remove(${pl.p_id})" class="btn btn-danger">
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
	var privilege = prompt("Enter Privilege:");
	if(privilege !=  null){
	$.ajax({
		url: 'manipulate_privilege.evs',
		type: 'POST',
		data: {privilege : privilege},
		success: function(){
			alert("privilege Added Succesfully");
			location.reload();
		}
	});
	}
}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_privilege.evs',
			type: 'POST',
			data: {action : 'deleteprivilege', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
function edit(id){
	var privilege = prompt("Enter Privilege");
	if(privilege != null){
		$.ajax({
			url: 'manipulate_privilege.evs',
			type: 'POST',
			data: {action : 'editprivilege' , privilege : privilege , id : id},
			success: function(){
				alert("Updated Successfully");
				location.reload();
			}
		});
	}
}
</script>