<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="commons/links.jsp" %>
<title>登录</title>
</head>
<body class="signin">
<section>
<div class="signinpanel">
	<div class="row">
		<div class="col-md-7">
			<div class="signin-info">
				<div class="logopanel">
					<h1><span>[</span> bracket <span>]</span></h1>
				</div>
				<!-- logopanel -->
				<div class="mb20">
				</div>
				<h5><strong>Welcome to Bracket Bootstrap 3 Template!</strong></h5>
				<ul>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> Fully Responsive Layout</li>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> HTML5/CSS3 Valid</li>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> Retina Ready</li>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> WYSIWYG CKEditor</li>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> and much more...</li>
				</ul>
				<div class="mb20">
				</div>
				<strong>Not a member? <a href="signup.html">Sign Up</a></strong>
			</div>
			<!-- signin0-info -->
		</div>
		<!-- col-sm-7 -->
		<div class="col-md-5">
			<form id="loginForm" method="post" action="index.html">
				<h4 class="nomargin">Sign In</h4>
				<p class="mt5 mb20">
					Login to access your account.
				</p>
				<input type="text" class="form-control uname" name="uname" placeholder="Username"/>
				<input type="password" class="form-control pword" name="pword" placeholder="Password"/>
				<a href=""><small>Forgot Your Password?</small></a>
				<button class="btn btn-success btn-block">Sign In</button>
			</form>
		</div>
		<!-- col-sm-5 -->
	</div>
	<!-- row -->
	<div class="signup-footer">
		<div class="pull-left">
                &copy; 2014. All Rights Reserved. Bracket Bootstrap 3 Admin Template
		</div>
	</div>
</div>
<!-- signin -->
</section>
<%@include file="commons/scripts.jsp" %>
<%@include file="commons/validate.jsp" %>
<script>
    jQuery(document).ready(function(){
        // Please do not use the code below
        // This is for demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
            jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if(c && c == 'dodgerblue') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
        
		jQuery("#loginForm").validate({
			rules: {
	            uname: {
	                required: true
	            },
	            pword: {
	            	required: true
	            }
	        },
	        messages: {
	        	uname: {
	                required: "请填写用户名"
	            },
	            pword: {
	            	required: "请填写密码"
	            }
	        },
			highlight: function(element) {
			  jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			success: function(element) {
			  jQuery(element).closest('.form-group').removeClass('has-error');
			}
		});
    });
</script>
</body>
</html>