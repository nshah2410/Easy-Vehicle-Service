<%@page import="spring.model.inventoryModel"%>
<%@page import="spring.model.garageInventoryModel"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
List<String> part = new ArrayList<String>();
List<String> price = new ArrayList<String>();
List<String> quantity = new ArrayList<String>();
List<inventoryModel> im = new ArrayList<inventoryModel>();
if(request.getAttribute("gilist")!=null){
	part = (List) request.getAttribute("gilist");
}
if(request.getAttribute("pricelist")!=null){
	price = (List) request.getAttribute("pricelist");
}
if(request.getAttribute("quantitylist")!=null){
	quantity = (List) request.getAttribute("quantitylist");
}

if(request.getAttribute("plist") != null){
	im = (List) request.getAttribute("plist");
}
%>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Vehicle Part's List
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li>
                                <i class="fa fa-list"></i>  <a href="garageInventory.evs" style="text-decoration: none;">Inventory</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-list"></i> Parts
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-12">
                    		<div class="form-group">
							
</br>	                        
		               	</div>
		                    
		             </div>
		             <div class="col-lg-12">
		             <form id="form">
                        <div class="table-responsive">
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
                                					<td><%=gm.getPart_name() %> <input type="hidden" name="part" value="<%=gm.getPart_id() %>"></td>
                                					<td><input class="form-control" type="number" name="price" value="<%=price.get(c) %>"></td>
                                					<td><input class="form-control" type="number" name="quantity" value="<%=quantity.get(c) %>"></td>
                                					</tr>
                              					<%
                              			c++;
                              			}
                              		}
                              		%>
                                </tbody>
                            </table>
                        </div>
                        <input type="hidden" name="action" value="addpdetails">
                        <input type="hidden" name="garage_id" value="${cid }">
                        <input type="hidden" name="Model" value="${param.vehicle_id }">
                        <input type="hidden" name = "gi_id" value="${gi_id }">
                        <button type="button" onclick="insert()" class="btn pull-right btn-success">Submit</button>
                        </form>
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
		url: 'manipulate_garage_inventory_part.evs',
		type: 'POST',
		data: $('#form').serialize(),
		success: function(data){
			alert("Parts Updated Succesfully");
			window.location.href="garageInventory.evs";
		}
	});
}
</script>