<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Vehicle Company
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Companies
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                		<div style="text-align: justify-right; vertical-align: middle;">
                   			 <div align="right" style="">
                        		<button type="button" onclick="return add()" class="btn pull-right btn btn-success"><i class="fa fa-plus"></i> Add</button></br>
	                    </div>
	                    </br>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Company</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${clist}" var="cl" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${cl.company_name}</td>
		                                <td>
		                                	<a href="vehiclemodel.evs?id=${cl.company_id}" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-eye-open"></span>
                                  			</a>
                                			/
                                  			<button type="button" onclick="edit(${cl.company_id})" class="btn btn-danger">
                                  				<span class="glyphicon glyphicon-pencil"></span>
                                			</button>
                                			/
                                  			<button type="button" onclick="remove(${cl.company_id})" class="btn btn-danger">
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
	var company = prompt("Enter Company Name:");
	if(company !=  null){
	$.ajax({
		url: 'manipulate_company.evs',
		type: 'POST',
		data: {action : 'addcompany' , company : company},
		success: function(){
			alert("Company Added Succesfully");
			location.reload();
		}
	});
	}
}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_company.evs',
			type: 'POST',
			data: {action : 'deletecompany', id : id},
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