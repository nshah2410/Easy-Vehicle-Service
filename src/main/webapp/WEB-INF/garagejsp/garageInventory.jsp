<%@page import="spring.model.inventoryModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
List<String> part = new ArrayList<String>();
List<String> price = new ArrayList<String>();
List<String> quantity = new ArrayList<String>();
List<inventoryModel> im = new ArrayList<inventoryModel>();

if(request.getAttribute("gilist")!=null){
	part = (ArrayList) request.getAttribute("gilist");
}
if(request.getAttribute("pricelist")!=null){
	price = (ArrayList) request.getAttribute("pricelist");
}
if(request.getAttribute("quantitylist")!=null){
	quantity = (ArrayList) request.getAttribute("quantitylist");
}

if(request.getAttribute("plist") != null){
	im = (ArrayList) request.getAttribute("plist");
}
%>
<div id="page-wrapper" >

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Inventory List 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-list"></i> Inventory
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                <form id="form">
                    <div class="col-lg-12">
                    		<div class="form-group">
								<label class="col-sm-1 control-label">Company</label>
								<div class="col-sm-3">
		                        <select class="form-control" name="company" onchange="getmodel(this.value)">
		                        		<option value = "0">Select Vehicle Company</option>
		                        		<c:forEach items="${clist}" var="c">
		                        			<option value="${c.company_id }">${c.company_name }</option>
		                        		</c:forEach>
		                        </select>
		                        </div>
		                        
		                        <label class="col-sm-1 control-label">Vehicle:</label>
								<div class="col-sm-3">
		                        <select class="form-control" name="vehicle" onchange="getparts()" id="vehicle">
		                        		<option value = "0">Select Vehicle</option>
		                        </select>
		                        </div>
		                    
		                    <div class="col-sm-1">		                    
		                    </div>
		                    <div class="col-sm-2">
				            </div>
				            
				            
                        	<c:if test="${fn:containsIgnoreCase(sessionScope.role, 'ROLE_GARAGE_ADMIN')}">
				            	<div align="right" style="">
                        			<button type="button" class="btn pull-right btn btn-success" onclick="view()"><i class="fa fa-edit"></i> Update</button></br>
                        		</div>
				            </c:if>
				            
		                    <input type="hidden" name="garage_id" value="${cid }" id="garage_id">
		                    <input type="hidden" name="vehicle_id" id="vehicle_id" value="${param.vehicle_id }">
		                       
		                    </div>
		                    
		             </div>
		              <div class="col-sm-1">		                    
		              </div>
		              <div class="col-sm-1">		                    
		              </div>
		             <div class="col-lg-12">
                        <div class="table-responsive" id="out-table">
                            <table class="table table-hover table-striped">
                                <thead>
                                
                                    <tr>
                                  		<th>Sr. No</th>
                                  		<th>Parts Name</th>
                                  		<th>Price</th>
                                  		<th>Quantity</th>
                                	</tr>
                                </thead>
                                <tbody id="tbody">
                                  <% int count = 1;
                              		int length = part.size();
                              		int c = 0;  
                              		if(part != null && c < length)
                              		{	
                              			for(inventoryModel gm : im){
                              					%>
                              						<tr>
                              						<td><%=count++ %>
                                					<td><%=gm.getPart_name() %></td>
                                					<td><%=price.get(c) %></td>
                                					<td><%=quantity.get(c) %></td>
                                					</tr>
                              					<%
                              			c++;
                              			}
                              		}
                              		%>
                                </tbody>
                            </table>
                            <input type="hidden" name="action" value="addpdetails">
                        </div>
                       
                    </div>
                     </form>
                </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<script>
function dynamic(data){
	var $select = $("#tbody");
    $select.find("tr").remove();
    var $select = $("#out-table");
    $select.find("button").remove();
	var obj = JSON.parse(data);
	var trHTML = '';
    $.each(obj, function (i, parts) {
         trHTML +=
        	 '<tr><td>'
             + (i+1) 
             + '</td><td>'
             + parts.model_name + " - " + parts.year
             +'</td>'
             + '<td>  <button type="button" onclick="view('
	  		 +parts.vmodel_id
	  		 +')" class="btn btn-danger"> <span class="glyphicon glyphicon-eye-open"></span></button></td> </tr>';
     });
     $('#tbody').append(trHTML);
     
}

function getmodel(id) {
	var garage = document.getElementById("garage_id").value;
	$.ajax({
	    type: 'POST',
	    url: 'manipulate_garage_vehicle.evs',
	    data: {action : 'getvehicle', id: id, garage_id: garage},
	    success: function(data){
	    	
			var obj = JSON.parse(data);
			
			var $select = $("#vehicle");
	         $select.find("option").remove();  
	         $("<option>").val(null).text("Select Vehicle").appendTo($select);
	         $.each(obj, function(index, vehicle) {
	         $("<option>").val(vehicle.vmodel_id).text(vehicle.model_name + " - " + vehicle.year).appendTo($select);
	         });
	    }
  })
}

function getparts(){
	var garage = document.getElementById("garage_id").value;
	var id = document.getElementById("vehicle").value;
	window.location.href="garageinventoryparts.evs?garage_id="+garage+"&vehicle_id="+id;
}

function view(){
	var garage = document.getElementById("garage_id").value;
	var id = document.getElementById("vehicle_id").value;
	
	window.location.href="updateinventoryparts.evs?garage_id="+garage+"&vehicle_id="+id;
}
</script>