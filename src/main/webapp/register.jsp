<%@page import="com.meida.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>注册</title>
<%@include file="commons/links.jsp" %>
</head>
<body class="signin">
<section>
<div class="signuppanel">
	<div class="row">
		<div class="col-md-6">
			<!-- signup-info -->
		</div>
		<!-- col-sm-6 -->
		<div class="col-md-6">
			<form id="registerForm" method="post" action="<%=request.getContextPath()%>/user/register">
				<input name="openId" type="hidden" value="<%=StringUtils.getStr(request.getAttribute("openId"))%>"/>
				<h3 class="nomargin">Sign Up</h3>
				<p class="mt5 mb20">
					Already a member? <a href="signin.html"><strong>Sign In</strong></a>
				</p>
				<div class="mb10">
					<label class="control-label">Email</label>
					<input type="text" name="email" class="form-control" value="<%=StringUtils.getStr(request.getAttribute("email"))%>"/>
				</div>
				<div class="mb10">
					<label class="control-label">Password</label>
					<input type="password" name="password" class="form-control" value="<%=StringUtils.getStr(request.getAttribute("password"))%>"/>
				</div>
				<br/>
				<button class="btn btn-success btn-block">Sign Up</button>
			</form>
		</div>
		<!-- col-sm-6 -->
	</div>
	<!-- row -->
	<div class="signup-footer">
		<div class="pull-left">
                &copy; 2014. All Rights Reserved. Bracket Bootstrap 3 Admin Template
		</div>
		<div class="pull-right">
                Created By: 
			<a href="http://themepixels.com/" target="_blank">ThemePixels</a>
		</div>
	</div>
</div>
<!-- signuppanel -->
</section>
<%@include file="commons/scripts.jsp" %>
<%@include file="commons/validate.jsp" %>
<script>
    jQuery(document).ready(function(){
    	jQuery("form#registerForm").validate({
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