<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up for EVS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href='<c:url value="login/images/icons/favicon.ico"/>' >
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
	  email_error.innerHTML = 'Enter valid Email Id For Ex:- abc@gmail.com' ;
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
			<div class="wrap-login100 p-l-55 p-r-55 p-t-25 p-b-54">
				<form class="login100-form validate-form" id="form">
					<span class="login100-form-title p-b-15">
						Forgot Password
					</span>
					
					<div class="wrap-input100 validate-input m-b-15" data-validate = "Username is required" >
						<span class="label-input100">E-Mail ID</span>
						<input class="input100" type="email" name="username" id="username" onblur="valemail()" placeholder="Type your email-id">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>	
					<span id="email_error" style="display:none;"></span>				
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button onclick="forgot()" type="button" id="submitbtn" class="login100-form-btn">
								Find
							</button>
						</div>
					</div>
					
					<div class="text-right p-t-10 p-b-3">
						Already have an account?
						<a href="login.evs">
							Sign-In
						</a>
					</div>

				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
<script src='<c:url value="/assests/js/jquery.js" />'></script>	
</body>
 
<script>
function forgot() {
	var username = document.getElementById("username").value;
	
	if(username != ""){
		$.ajax({
			url: 'forgotpassword.evs',
			method: 'post',
			data: $('#form').serialize(),
			success: function(res) {
				alert(res);
				window.location.href="login.evs";
			},
			error: function(res) {
				alert("Username doesnot exists");
				location.reload();
			}
		});	
	}
	else{
		var email_error = document.getElementById('email_error');
		email_error.innerHTML = 'Enter valid mobile No. For Ex:- abc@gmail.com' ;
		email_error.style.display = 'inherit';	
	}
}
</script>
</html>