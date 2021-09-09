<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Privilege Component
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index.evs" style="text-decoration: none;">DashBoard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Privilege Components
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
                                  		<th>Privilege</th>
                                  		<th>Component name</th>
                                  		<th>Component Link</th>
                                  		<th>Action</th>
                                  		<th>Add Component</th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="f" items="${privilegelist}" varStatus="count">
                                		<tr>
                                  			<td>${count.count}</td>
                                  			<td>${f.privilege_name}</td>
                                  			<td>
                                  				<c:forEach var="c" items="${f.pcm}">
                                  					${c.component_name}
                                  					<br/>
                                  					<br/>
                                  				</c:forEach>
                                  			</td>
                                  			<td>
                                  				<c:forEach var="c" items="${f.pcm}">
                                  					${c.link }
                                  					<br/>
                                  					<br/>
                                  				</c:forEach>
                                 			</td>
                                  			<td>
                                  				<c:forEach var="c" items="${f.pcm}">
                                  		 			<button class="btn btn-danger btn-xs" onclick="remove(${c.pc_id})" type="button"><span class="glyphicon glyphicon-trash"></span></button>
                                  					<br/>
                                  					<br/>
                                  				</c:forEach>
                                  			</td>
                                  			<td>
                                  				<a href="proj.acm?p=4&id=${f.p_id }" class="btn btn-success">
                                  				<span class="glyphicon glyphicon-plus"></span>
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