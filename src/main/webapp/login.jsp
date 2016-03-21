<%@ page import="com.meida.model.User" %>
<%@ page import="org.apache.commons.lang.ObjectUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/pageParams.jsp" %>
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
					<img src="/images/logo.png" width="100" height="100">
				</div>
				<!-- logopanel -->
				<div class="mb20">
				</div>
				<!-- <h5><strong>Welcome to Bracket Bootstrap 3 Template!</strong></h5>-->
				<ul>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> 高效的运作模式</li>
					<li><i class="fa fa-arrow-circle-o-right mr5"></i> 专业的服务开发团队</li>
					<!--     <li><i class="fa fa-phone mr5"></i> 技术需求：18588879488</li>-->
					<li><i class="fa fa-wechat mr5"></i> 客服微信：vipmeida</li>
					<!--  <li><i class="fa fa-coffee mr5"></i> 商务合作：18538586277</li>-->
				</ul>
			</div>
			<!-- signin0-info -->
		</div>
		<!-- col-sm-7 -->
		<div class="col-md-5">
			<form id="loginForm" method="post" action="<%=request.getContextPath()%>/user/login">
				<h4 class="nomargin">-Meida-</h4>
				<p class="mt5 mb20">
				</p>
				<%if(request.getAttribute("errMsg") != null) {%>
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<i class="fa  fa-exclamation-triangle"></i>&nbsp;&nbsp;<strong><%=request.getAttribute("errMsg")%></strong>&nbsp;&nbsp;
					</div>
				<%}%>
				<input type="text" class="form-control" name="email" placeholder="邮箱" value="<%=ObjectUtils.toString(request.getAttribute(User.email))%>"/>
				<input type="password" class="form-control" name="password" placeholder="密码" value="<%=ObjectUtils.toString(request.getAttribute(User.password))%>"/>
				<%--<a href=""><small>忘记密码了?</small></a>--%>
				<strong>还没账号? </strong>
				<a href="<%=ctx%>/register.jsp"><small>马上注册</small></a>
				<button type="submit" class="btn btn-success btn-block">登录</button>
			</form>
		</div>
		<!-- col-sm-5 -->
	</div>
	<!-- row -->
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