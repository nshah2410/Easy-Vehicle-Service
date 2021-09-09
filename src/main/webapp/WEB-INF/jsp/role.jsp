<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Roles
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Roles
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
                                <c:forEach items="${rolelist}" var="rl" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${rl.role_name}</td>
		                                <td>
                                  			<button type="button" onclick="edit(${rl.role_id})" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-edit"></span>
                                			</button>
                                			/
                                  			<button type="button" onclick="remove(${rl.role_id})" class="btn btn-danger">
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
	var role = prompt("Enter Role:");
	if(role !=  null){
	$.ajax({
		url: 'manipulate_role.evs',
		type: 'POST',
		data: {action : 'addrole' , role : role},
		success: function(){
			alert("Role Added Succesfully");
			location.reload();
		}
	});
	}
}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_role.evs',
			type: 'POST',
			data: {action : 'deleterole', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
function edit(id){
	var role = prompt("Enter Role");
	if(role != null){
		$.ajax({
			url: 'manipulate_role.evs',
			type: 'POST',
			data: {action : 'editrole' , role : role , id : id},
			success: function(){
				alert("Role Updated Succesfully");
				location.reload();
			}
		});
	}
}
</script>