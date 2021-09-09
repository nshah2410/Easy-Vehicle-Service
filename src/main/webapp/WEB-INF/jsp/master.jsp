<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.username" var="u"/> 
</security:authorize>

<c:if test="${u eq null}">
	<c:redirect url="login.evs"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Easy Vehicle Service</title>
    
    <link rel="icon" type="image/png" href='<c:url value="login/images/evslogo.png"/>' >

    <!-- Bootstrap Core CSS -->
    <link href='<c:url value="/assests/css/bootstrap.min.css" />' rel="stylesheet">

    <!-- Custom CSS -->
    <link href='<c:url value="/assests/css/sb-admin.css"/>'rel="stylesheet">
    <link href='<c:url value="/assests/css/search.css"/>'rel="stylesheet">
    <link href='<c:url value="/assests/css/rating.css"/>'rel="stylesheet">
	
	<!-- Service Details CSS -->
	
	<link href='<c:url value="/assests/service/css/all.css"  />' rel="stylesheet">
    <link href='<c:url value="/assests/service/css/style.css" />'  rel="stylesheet">
    <link href='<c:url value="/assests/service/css/responsive.css" />' rel="stylesheet">
	
    <!-- Morris Charts CSS -->
    <link href='<c:url value="/assests/css/plugins/morris.css" />' rel="stylesheet">

    <!-- Custom Fonts -->
    <link href='<c:url value="/assests/font-awesome/css/font-awesome.min.css" />' rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&display=swap" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
        .table>thead>tr>th {
            text-align: center;
        }
        
        .table>tbody>tr>td {
            text-align: center;
        }
    </style>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.evs">EVS</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user } <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="profile.evs"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href='<c:url value="/logout"/>'><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                
                <c:if test="${fn:containsIgnoreCase(role, 'role_admin')}">
                    <li>
                        <a href="index.evs"><i class="fa fa-home"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa	 fa-wrench"></i> Garage<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="garage.evs"> Manage Garages</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-user"></i> Customers <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo3" class="collapse">
                            <li>
                                <a href="customer.evs"> Manage Customers</a>
                            </li>
                            <li>
                                <a href="customervehicle.evs">Customer's Vehicle</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo4"><i class="fa fa-users" aria-hidden="true"></i> Employee <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo4" class="collapse">
                            <li>
                                <a href="employee.evs">Manage Employees</a>
                            </li>
                            <li>
                                <a href="department.evs">Department</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo5"><i class="fa fa-car" aria-hidden="true"></i> Vehicles <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo5" class="collapse">
                            <li>
                                <a href="vehiclecompany.evs">Manage Vehicles</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo6"><i class="fa fa-info-circle" aria-hidden="true"></i> Miscellaneous <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo6" class="collapse">
                            <li>
                                <a href="city.evs">City</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo7"><i class="fa fa-list"></i> Inventory <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo7" class="collapse">
                            <li>
                                <a href="inventory.evs">Inventory Management</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    <c:if test="${fn:containsIgnoreCase(role, 'role_customer')}">
                    	<li>
                        	<a href="index.evs"><i class="fa fa-home"></i> Dashboard</a>
                   		</li>
                   		 <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo6"><i class="fa fa-car" aria-hidden="true"></i> My Vehicle <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo6" class="collapse">
                            <li>
                                <a href="myvehicle.evs">My Vehicle</a>
                            </li>
                            <li>
                                <a href="service.evs">Service History</a>
                            </li>
                            <li>
                                <a href="addcustomervehicle.evs">Add Vehicle</a>
                            </li>
                        </ul>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo12"><i class="fa fa-car" aria-hidden="true"></i> Request Service<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo12" class="collapse">
                            <li>
                                <a href="servicerequest.evs">Service Request</a>
                            </li>
                            <!-- <li>
                                <a href="garageservicerequest.evs">Service Request for a particular Garage</a>
                            </li> -->
                        </ul>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo14"><i class="fa fa-star-o" aria-hidden="true"></i> Feedback<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo14" class="collapse">
                            <li>
                                <a href="pendingfeedback.evs"> Pending Feedback</a>
                            </li>
                        </ul>
                        <!-- <a href="javascript:;" data-toggle="collapse" data-target="#demo13"><i class="fa fa-question" aria-hidden="true"></i> Query<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo13" class="collapse">
                            <li>
                                <a href="query.evs"> Ask a Query</a>
                            </li>
                        </ul> -->
                        
                    </li>
                    </c:if>
                    
                    <c:if test="${fn:containsIgnoreCase(role, 'role_garage_admin')}">
                    	<li>
                        	<a href="index.evs"><i class="fa fa-home"></i> Dashboard</a>
                   		</li>
                   		<li>
                        	<a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-user" aria-hidden="true"></i> Employee <i class="fa fa-fw fa-caret-down"></i></a>
                        	<ul id="demo1" class="collapse">
	                            <li>
    	                            <a href="garageemployee.evs">Manage Employee</a>
        	                    </li>
            	            </ul>
                	   </li>
                	   <li>
                        	<a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-user" aria-hidden="true"></i> Customers <i class="fa fa-fw fa-caret-down"></i></a>
                        	<ul id="demo3" class="collapse">
	                            <li>
    	                            <a href="garagecustomer.evs">Manage Customers</a>
        	                    </li>
            	            </ul>
                	   </li>
                   		<li>
                        	<a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-car" aria-hidden="true"></i> Vehicle <i class="fa fa-fw fa-caret-down"></i></a>
                        	<ul id="demo2" class="collapse">
	                            <li>
    	                            <a href="garagevehicle.evs">Vehicle Offered</a>
        	                    </li>
            	            </ul>
                	   </li>
                   		<li>
                        	<a href="javascript:;" data-toggle="collapse" data-target="#demo6"><i class="fa fa-list" aria-hidden="true"></i> Inventory <i class="fa fa-fw fa-caret-down"></i></a>
                        	<ul id="demo6" class="collapse">
	                            <li>
    	                            <a href="garageInventory.evs">Inventory Management</a>
        	                    </li>
            	            </ul>
                	   </li>
                	   <li>
                        	<a href="javascript:;" data-toggle="collapse" data-target="#demo7"><i class="fa fa-users" aria-hidden="true"></i> Service Request <i class="fa fa-fw fa-caret-down"></i></a>
                        	<ul id="demo7" class="collapse">
	                            <li>
    	                            <a href="pendingrequest.evs">Pending requests</a>
        	                    </li>
        	                    <li>
    	                            <a href="acceptedrequest.evs">Accepted Requests</a>
        	                    </li>
        	                    <li>
    	                            <a href="declinedrequest.evs">Declined Requests</a>
        	                    </li>
        	                    <li>
    	                            <a href="scheduledpickup.evs">Scheduled Pickup</a>
        	                    </li>
        	                    <li>
    	                            <a href="vehiclerecieved.evs">Vehicles Recieved</a>
        	                    </li>
        	                    <!-- <li>
    	                            <a href="assigndriver.evs">Assign Driver to Scheduled Request</a>
        	                    </li> -->
            	            </ul>
                	   </li>
                    </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
		
		<section class="content">
    		<tiles:insertAttribute name="path" />
    	</section>
		
    	
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src='<c:url value="/assests/js/jquery.js" />'></script>
    <script src='<c:url value="/assests/js/jquery.autocomplete.js" />'></script>

    <!-- Bootstrap Core JavaScript -->
    <script src='<c:url value="/assests/js/bootstrap.min.js" />'></script>

    <!-- Morris Charts JavaScript -->
    <script src='<c:url value="/assests/js/plugins/morris/raphael.min.js" />'></script>
    <script src='<c:url value="/assests/js/plugins/morris/morris.min.js" />'></script>
    <script src='<c:url value="/assests/js/plugins/morris/morris-data.js" />'></script>
    <script src="https://kit.fontawesome.com/yourcode.js"></script>
	<!-- Service Details JS -->
	<script src='<c:url value="/assests/service/js/jquery.min.js" />'></script>
	<script src='<c:url value="/assests/service/js/function.js" />'></script>
</body>

</html>
