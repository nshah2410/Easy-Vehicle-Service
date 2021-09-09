<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Customers
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                             <li>
                                <i class="fa fa-users"></i>  <a href="garagecustomer.evs" style="text-decoration: none;">Garage Customers</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"> ${name }'s Vehicles</i> 
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
                                  		<th>Vehicle No.</th>
                                  		<th>Model Name/ Year</th>
                                  		<th>Service Date</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${uservehicles}" var="uv" varStatus="count">
                                    <tr>
                                  		<td>${count.count}</td>
                                  		<td>${uv.uvm.vehicle_no}</td>
                                  		<td>${uv.uvm.vm.model_name} / ${uv.uvm.vm.year}</td>
                                  		<td><fmt:formatDate value="${uv.service_date }" type="date"/></td>
		                                <td>
                                  			<a href="servicedetails.evs?id=${uv.service_id }" class="btn btn-danger">
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
<script>
	
function insert() {
	$.ajax({
		url: 'manipulate_customer.evs',
		method: 'post',
		data: $('#form').serialize(),
		success: function() {
			alert("Added Successfully");
			location.reload();
		},
		error: function(link) {
			alert("Can't Add Data");
			location.reload();
		}
	});	
	}
function remove(id){
	if(confirm("Are You Sure You want to delete??")){
		$.ajax({
			url: 'manipulate_customer.evs',
			type: 'POST',
			data: {action : 'deletecustomer', id : id},
			success: function() {
				alert("Deleted Sucessfully");
				location.reload();
			}
		});
	}
}
function phone(){
	var no = document.getElementById("phone").value;
	var RE = /^[\d\.\-]+$/;
    if(!RE.test(no)){
		alert("Enter valid mobile No.");
		document.getElementById("submitbtn").disabled = true;
	}
}



function search() {
	var search= $('#search').val();
	alert(search);
	$.ajax({
	url: 'search_customer.evs',
	type: 'get',
	data: {search: search},
	success: function(data) {
	alert(data);
	$("#showlist").html(data);
	}
	});
	};
</script>