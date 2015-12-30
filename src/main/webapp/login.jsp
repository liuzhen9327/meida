<%@ page import="com.meida.utils.StringUtils" %>
<%@ page import="com.meida.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>登录</title>
<%@include file="commons/links.jsp" %>
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
				<strong>Not a member? <a href="register.jsp">Sign Up</a></strong>
			</div>
			<!-- signin0-info -->
		</div>
		<!-- col-sm-7 -->
		<div class="col-md-5">
			<form id="loginForm" method="post" action="<%=request.getContextPath()%>/user/login">
				<h4 class="nomargin">Sign In</h4>
				<p class="mt5 mb20">
					Login to access your account.
				</p>
				<input type="text" class="form-control" name="email" placeholder="Email" value="<%=StringUtils.getStr(request.getAttribute(User.email))%>"/>
				<input type="password" class="form-control" name="password" placeholder="Password" value="<%=StringUtils.getStr(request.getAttribute(User.password))%>"/>
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
		jQuery("form#loginForm").validate({
			rules: {
	            email: {
	                required: true,
	                email: true
	            },
	            password: {
	            	required: true
	            }
	        },
	        messages: {
	        	email: {
	                required: "请填写邮箱",
	                email:'邮箱格式不正确'
	            },
	            password: {
	            	required: "请填写密码"
	            }
	        }
		});
    });
</script>
</body>
</html>