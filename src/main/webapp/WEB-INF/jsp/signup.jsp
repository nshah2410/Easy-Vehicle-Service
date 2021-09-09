<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function valemail(){
	var x = document.getElementById("email").value;
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
function phone(){
	var no = document.getElementById("contact").value;
	var RE = /^[\d\.\-]+$/;
	var mob_error = document.getElementById('mob_error');
    if(!RE.test(no) || no.legnth !=10){
    	mob_error.innerHTML = 'Enter valid mobile No. For Ex:- 9123455232' ;
    	mob_error.style.display = 'inherit';
		document.getElementById("submitbtn").disabled = true;
	}
    else{
    	mob_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}

function passvalid(){
	var str = document.getElementById("password").value;
	var pass_error = document.getElementById('pass_error');
	if (!(str.match(/[a-z]/g) && str.match(/[A-Z]/g) && str.match(/[0-9]/g) && str.match(/[^a-zA-Z\d]/g) && str.length >= 8)){
		pass_error.innerHTML = 'Password should have atleast 8 character and should contain 1 uppercase, 1 lowercase and a special Character' ;
		pass_error.style.display = 'inherit';
		document.getElementById("submitbtn").disabled = true;
	}
	else{
		pass_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}

function repass(){
	var pass = document.getElementById("password").value;
	var repass = document.getElementById("repassword").value;
	var repass_error = document.getElementById('repass_error');
	if(!pass.match(repass)){
		repass_error.innerHTML = "Password and re-enter password doesn't match!" ;
		repass_error.style.display = 'inherit';
		document.getElementById("submitbtn").disabled = true;
	}
	else{
		repass_error.style.display = 'none';
		document.getElementById("submitbtn").disabled = false;
	}
}
</script>
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

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(<c:url value="login/images/bg-01.jpg" />);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-25 p-b-54">
				<form class="login100-form validate-form" id="form">
					<span class="login100-form-title p-b-15">
						Sign-Up
					</span>

					<div class="wrap-input100 validate-input m-b-15" data-validate = "Username is required">
						<span class="label-input100">Fullname</span>
						<input class="input100" type="text" name="name" id="name" placeholder="Type your Fullname">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-15" data-validate = "Username is required">
						<span class="label-input100">E-Mail ID</span>
						<input class="input100" type="email" name="email_id" id ="email" onblur="valemail()" placeholder="Type your email-id">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<span id="email_error" style="display:none;"></span>

					<div class="wrap-input100 validate-input m-b-15" data-validate = "Username is required">
						<span class="label-input100">Contact No.</span>
						<input class="input100" id="contact" type="tel" onblur="phone()" name="mobile_no" placeholder="Type your contact number">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<span id="mob_error" style="display:none;"></span>

					<div class="wrap-input100 validate-input m-b-15" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" id="password" type="password" onblur="passvalid()" name="password" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;" ></span>
					</div>
					<span id="pass_error" style="display:none;"></span>

					<div class="wrap-input100 validate-input m-b-15" data-validate="Password is required">
						<span class="label-input100">Re-enter Password</span>
						<input class="input100" type="password" id="repassword" onblur="repass()" name="password" placeholder="Re-enter your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<span id="repass_error" style="display:none;"></span>
					
					<div class="text-right p-t-10 p-b-3">
						
					</div>
					<input type="hidden" name="action" value="signup"/>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button onclick="signup()" type="button" id="submitbtn" class="login100-form-btn">
								Sign Up
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
function signup() {
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var mobile = document.getElementById("contact").value;
	var pass = document.getElementById("password").value;
	var retype = document.getElementById("repassword").value;
	if(name == "" || email == "" || mobile == "" || pass == "" || retype == ""){
		alert("All fields must be filled");
	}
	else{
		$.ajax({
			url: 'manipulate_customer.evs',
			method: 'post',
			data: $('#form').serialize(),
			success: function() {
				alert("Registered Successfully");
				window.location.href="login.evs";
			},
			error: function() {
				alert("Can't Add Data");
				location.reload();
			}
		});
	}
		
}
</script>
</html>