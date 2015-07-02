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
			<div class="signup-info">
				<div class="logopanel">
					<h1><span>[</span> bracket <span>]</span></h1>
				</div>
				<!-- logopanel -->
				<div class="mb20">
				</div>
				<h5><strong>Bootstrap 3 Admin Template!</strong></h5>
				<p>
					Bracket is a theme that is perfect if you want to create your own content management, monitoring or any other system for your project.
				</p>
				<p>
					Below are some of the benefits you can have when purchasing this template.
				</p>
				<div class="mb20">
				</div>
				<div class="feat-list">
					<i class="fa fa-wrench"></i>
					<h4 class="text-success">Easy to Customize</h4>
					<p>
						Bracket is made using Bootstrap 3 so you can easily customize any element of this template following the structure of Bootstrap 3.
					</p>
				</div>
				<div class="feat-list">
					<i class="fa fa-compress"></i>
					<h4 class="text-success">Fully Responsive Layout</h4>
					<p>
						Bracket is design to fit on all browser widths and all resolutions on all mobile devices. Try to scale your browser and see the results.
					</p>
				</div>
				<div class="feat-list mb20">
					<i class="fa fa-search-plus"></i>
					<h4 class="text-success">Retina Ready</h4>
					<p>
						When a user load a page, a script checks each image on the page to see if there's a high-res version of that image. If a high-res exists, the script will swap that image in place.
					</p>
				</div>
				<h4 class="mb20">and much more...</h4>
			</div>
			<!-- signup-info -->
		</div>
		<!-- col-sm-6 -->
		<div class="col-md-6">
			<form id="registerForm" method="post" action="<%=request.getContextPath()%>/user/register">
				<h3 class="nomargin">Sign Up</h3>
				<p class="mt5 mb20">
					Already a member? <a href="signin.html"><strong>Sign In</strong></a>
				</p>
				<div class="mb10">
					<label class="control-label">Email</label>
					<input type="text" name="email" class="form-control"/>
				</div>
				<div class="mb10">
					<label class="control-label">Password</label>
					<input type="password" name="password" class="form-control"/>
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