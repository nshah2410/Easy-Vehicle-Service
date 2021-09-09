<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Feedback
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-star"></i> Pending Feedback
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
                                <c:forEach items="${feed }" var="s" varStatus="count">
                                    <tr>
                                  		<td>${count.count }</td>
                                  		<td>${s.uvm.vm.model_name } ( ${s.uvm.vehicle_no } )</td>
                                  		<td><fmt:formatDate value="${s.service_date }" type="date"/></td>
                                  		<td>${s.gm.garage_name }</td>
		                                <td style="text-align: center;">
		                                	
		                                	<div class="rate">
    											<input type="radio" onchange="rate(${s.service_id })" id="star1" name="rate" value="1" />
    												<label for="star1" title="text"><i class="fa fa-star"></i></label>
    											<input type="radio" onchange="rate(${s.service_id })" id="star2" name="rate" value="2" />
    												<label for="star2" title="text"><i class="fa fa-star"></i></label>
    											<input type="radio" onchange="rate(${s.service_id })" id="star3" name="rate" value="3" />
    												<label for="star3" title="text"><i class="fa fa-star"></i></label>
    											<input type="radio" onchange="rate(${s.service_id })" id="star4" name="rate" value="4" />
    												<label for="star4" title="text"><i class="fa fa-star"></i></label>
    											<input type="radio" onchange="rate(${s.service_id })" id="star5" name="rate" value="5" />
    												<label for="star5" title="text"><i class="fa fa-star"></i></label>
  											</div>
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
function rate(id){
	var sel = document.getElementsByName("rate");
	var count = 0;
	if(sel[0].checked){
		count = 5;
	}
	if(sel[1].checked){
		count = 4;
	}
	if(sel[2].checked){
		count = 3;
	}
	if(sel[3].checked){
		count = 2;
	}
	if(sel[4].checked){
		count = 1;
	}
	
	$.ajax({
		url: 'manipulate_feedback.evs',
		type: 'POST',
		data: {action : 'submit_feedback' , service_id : id , feedback : count},
		success: function(){
			alert("Thank You for your feedback");
			location.reload();
		}
	});	
}
</script>