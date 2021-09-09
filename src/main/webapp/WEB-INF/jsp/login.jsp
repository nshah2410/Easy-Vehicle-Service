<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.username" var="u"/> 
</security:authorize>

<c:if test="${u ne null}">
	<c:redirect url="index.evs"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login for EVS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href='<c:url value="login/images/evslogo.png"/>' >
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/bootstrap/css/bootstrap.min.css" />' >
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />' > 
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/fonts/iconic/css/material-design-iconic-font.min.css" /> '>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/animate/animate.css" /> ' >
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/css-hamburgers/hamburgers.min.css" />' >
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/animsition/css/animsition.min.css" />' >
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/select2/select2.min.css" />'>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href='<c:url value="login/vendor/daterangepicker/daterangepicker.css" />'>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href='<c:url value="login/css/util.css" />' >
	<link rel="stylesheet" type="text/css" href='<c:url value="login/css/main.css" />' >
<!--===============================================================================================-->
<script>
function valemail(){
	var x = document.getElementById("username").value;
	var atposition=x.indexOf("@");  
	var dotposition=x.lastIndexOf(".");  
	var email_error = document.getElementById('email_error');
	if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
	  email_error.innerHTML = 'Enter valid mobile No. For Ex:- abc@gmail.com' ;
	  email_error.style.display = 'inherit';
	  document.getElementById("submitbtn").disabled = true;  
	}  
	else{
		email_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}
</script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(<c:url value="login/images/bg-01.jpg" />);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" id="form">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" id="username" onblur="valemail()" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<span id="email_error" style="display:none;"></span>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" id="password" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<input type="hidden" name="_csrf" value="${_csrf.token }">
					
					
					
					
					<div class="text-right p-t-8 p-b-31">
						<a href="forgotpass.evs">
							Forgot Password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn" onclick="login()" id="submitbtn">
								Login
							</button>
						</div>
					</div>
				</form>
				</br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" onclick="signup()" class="login100-form-btn">
								Sign Up
							</button>
						</div>
					</div>
					<p id="demo"></p>
				
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<!-- jQuery -->
    <script src='<c:url value="/assests/js/jquery.js" />'></script>
<!--===============================================================================================-->
	
<script type="text/javascript">
function signup(){
	window.location.href="signup.evs";
}
function login(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	if(username != "" && password != ""){
		$.ajax({
			url: 'login',
			method: 'post',
			data: $('#form').serialize(),
			success: function() {				
				window.location.href="index.evs";
			},
			error: function(data) {
				alert("Enter Valid Username and Password.");
				location.reload();
			}
		});
	}
	else{
		alert("Enter Username and Password");
	}
	
}	
</script>
</body>
</html>