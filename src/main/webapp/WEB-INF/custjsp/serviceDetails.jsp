<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="page-wrapper">
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Service Summary
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i><a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li>
                                <i class="fa fa-users"></i><a href="garagecustomer.evs" style="text-decoration: none;">Garage Customers</a>
                            </li>
							<li>
                                <i class="fa fa-list"></i> Service Summary
                            </li>                            
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="containt">
						<span class="tablinks" onclick="openCity(event,'Summary')" id="defaultOpen"></span>
		            <div id="Summary" class="tabcontent padding-bottom-45">
		
		                <div class="pedding-lr-15">
		
		
		                    <div class="summary-row border-bottom">
		                        <h2>Car Detail</h2>
		                        <p class="order-id">Order ID #${sdetails.service_id }</p>
		                        <div class="car-detail-wrp">
		                            <p class="car-neme"><span>${sdetails.uvm.vm.cm.company_name }</span>
		                                ${sdetails.uvm.vm.model_name}
		                            </p>
		                        </div>
		
		                    </div>
		
		                    <div class="summary-row border-bottom">
		                        <h2>Order Detail</h2>
		
		                        <div class="summary-detail">
		                            <span class="summary-icon"><i class="fa fa-calendar"></i></span>
		                            <p><span>Service Date</span>
		                            	<fmt:formatDate value="${sdetails.service_date}" type="date"/>
		                            </p>
		                        </div>
		
		                        <div class="summary-detail">
		                            <span class="summary-icon"><i class="fa fa-calendar"></i></span>
		                            <p><span>Delivery Date</span>
		                                <fmt:formatDate value="${sdetails.delivery_date}" type="date"/>
		                            </p>
		                        </div>
		
		                        <div class="summary-detail">
		                            <span class="summary-icon"><i class="fa fa-map-marker"></i></span>
		                            <p><span>Pickup Address</span>
		                            	${sdetails.cm.address}
		                            </p>
		                        </div>
		                    </div>
		
		                    <div class="summary-row border-bottom">
		                        <h2>Vendor Detail</h2>
		
		                        <div class="summary-detail">
		                            <span class="summary-icon"><i class="fa fa-gear"></i></span>
		                            <p><span>Vendor Name</span>
		                                ${sdetails.gm.garage_name}</p>
		                        </div>
		
		                        <div class="summary-detail">
		                            <span class="summary-icon"><i class="fas fa-mobile-alt"></i></span>
		                            <p><span>Contact Number</span>
		                                ${sdetails.gm.mobile_no}</p>
		                        </div>
		
		                    </div>
		
		                    <div class="summary-row border-bottom">
		                        <h2>Services</h2>
		
		                        <%
								List<Integer> price = (List) request.getAttribute("price");
								List<String> parts = (List) request.getAttribute("parts");
								int count = 1;
								for(int i = 0 ; i < price.size(); i++){
								%>		
			                        <div class="order-service-list border-bottom">
			                            <span class="order-number"><%=count++ %></span>
			                            <div class="service-name-price">
			                                <h3><%=parts.get(i) %></h3>
			                                <span class="price"><%=price.get(i) %></span>
			                            </div>
			                       	</div>
								<%
								}
								%>
							</div>
		
		
		                </div>
		
		                <div class="total-tax-wrp">
		                    <div class="total-lable-vale">
		                        <lable>Sub Total</lable>
		                        <span class="price">${total }</span>
		                    </div>
		
		                    <div class="total-lable-vale">
		                        <lable>Total(Including Taxes)</lable>
		                        <span class="price">${sdetails.t_amount}</span>
		                    </div>
		                </div>                
		            </div>
                </div>
                <!-- /.row -->
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</div>