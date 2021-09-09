<%@page import="java.util.ArrayList"%>
<%@page import="spring.model.cityModel"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           Price Comparision
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                             <li>
                                <i class="fa fa-list"></i>  <a href="servicerequest.evs" style="text-decoration: none;">Send Request</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-bar-chart"></i> Estimation
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
                                  		<th>Sr. No.</th>
                                  		<th>Garage Name</th>
                                  		<th>Estimated Price ( <i class="fa fa-inr"></i> )</th>
                                  		<th>Ratings</th>
                                  		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">		                            
	                               <c:forEach var="outer" items="${estimation }" varStatus="count">
	                               <tr>
	                               		 <td>${count.count }</td>
											<c:forEach var="in" items="${outer }">
												<td id="${count.count }id">${in}</td>
											</c:forEach>
											<td>
												<button type="button" onclick="getdata(${count.count})" class="btn btn btn-success"> Send Request</button>
											</td>
									</tr>	                               
	                               </c:forEach> 
                                </tbody>
                                
                            </table>
                        </div>
                         <c:forEach var="p" items="${parts }" >
                           <input type="hidden" name="parts" value="${p}">
                         </c:forEach>
                         <input type="hidden" name="vehicle_id" id="v_id" value="${vehicle_id }"> 
                     
                    </div>
                    
                </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<script>
function getdata(val){
	var garage_name = document.getElementById ( val + "id" ).innerText;
	var vehicle_id = document.getElementById("v_id").value;
	var parts = [];
	<% String[] x = request.getParameterValues("parts");
	for(int i = 0 ; i < x.length; i++){
	%>
	parts.push(<%=x[i]%>);
	<%
	}
	%>
	$.ajax({
	    type: 'post',
	    url: 'send_request.evs',
	    data: {parts : parts, Garage_name : garage_name, vehicle_id : vehicle_id },
	    success: function(data){
	    	alert(data);
	    	window.location.href="index.evs";
	    }
	    })
	
}
</script>      
