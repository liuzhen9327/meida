<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.meida.config.Constant" %>
<%@ page import="org.apache.commons.lang.ObjectUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/pageParams.jsp" %>
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
					<h1><span>[</span> VIPMEIDA <span>]</span></h1>
				</div><!-- logopanel -->

				<div class="mb20"></div>
			</div><!-- signup-info -->

		</div><!-- col-sm-6 -->

		<div class="col-md-6">

			<form id="registerForm" method="post" action="<%=request.getContextPath()%>/user/register">
				<input name="openId" type="hidden" value="<%=ObjectUtils.toString(request.getAttribute("openId"))%>"/>
				<h3 class="nomargin">Sign Up</h3>
				<p class="mt5 mb20">已有账号? <a href="<%=ctx%>/login.jsp"><strong>马上登陆</strong></a></p>

				<label class="control-label">用户资料<code>请填写详细资料，方便工作人员快速审核</code></label>
				<%if(request.getAttribute("errMsg") != null) {%>
				<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<i class="fa  fa-exclamation-triangle"></i>&nbsp;&nbsp;<strong><%=request.getAttribute("errMsg")%></strong>&nbsp;&nbsp;
				</div>
				<%}%>
				<div class="row mb10">
					<div class="col-sm-6">
						<input type="text" name="user.name" class="form-control" placeholder="姓名" required value="<%=ObjectUtils.toString(request.getAttribute("user.name"))%>"/>
					</div>
					<div class="col-sm-6">
						<input type="text" name="user.phone" class="form-control" placeholder="联系电话" required value="<%=ObjectUtils.toString(request.getAttribute("user.phone"))%>"/>
					</div>
				</div>
				<div class="row mb10">
					<div class="col-sm-6">
						<input type="text" name="user.nick" class="form-control" placeholder="账号昵称" required value="<%=ObjectUtils.toString(request.getAttribute("user.nick"))%>"/>
					</div>
					<div class="col-sm-6">
						<input type="text" name="user.wechat" class="form-control" placeholder="微信号" required value="<%=ObjectUtils.toString(request.getAttribute("user.wechat"))%>"/>
					</div>

				</div>
				<div class="mb10">
					<label class="control-label">工作地址</label>
					<textarea name="user.work_address" class="form-control" rows="5" placeholder=""  required><%=ObjectUtils.toString(request.getAttribute("user.work_address"))%></textarea>
				</div>
				<div class="mb10">
					<label class="control-label">邮箱地址(用于登录)</label>
					<input type="text" name="user.email" required class="form-control" value="<%=ObjectUtils.toString(request.getAttribute("user.email"))%>"/>
				</div>

				<div class="mb10">
					<label class="control-label">设置密码</label>
					<input type="password" name="user.password" class="form-control" required value="<%=ObjectUtils.toString(request.getAttribute("user.password"))%>"/>
				</div>

				<div class="mb10">
					<label class="control-label">确认密码</label>
					<input type="password" class="form-control" name="confirmPassword" required/>
				</div>

				<br />
				<p id="error-msg" class="text-danger hide"></p>
				<button type="submit" class="btn btn-success btn-block">资料提交</button>
			</form>
		</div><!-- col-sm-6 -->

	</div>
	<!-- row -->
</div>
<!-- signuppanel -->
</section>
<%@include file="commons/scripts.jsp" %>
<%--<%@include file="../commons/validate.jsp" %>--%>
<script>
    jQuery(document).ready(function(){
		$('input[name="confirmPassword"]').keyup(function() {
			if($('input[name="user.password"]').val() == $(this).val()){
				$('#error-msg').addClass('hide');
			}
		});
		$('form#registerForm').submit(function() {
			if($('input[name="user.password"]').val() != $('input[name="confirmPassword"]').val()){
				$('#error-msg').text('两次输入密码不一致').removeClass('hide');
				return false;
			}
			return true;
		})
//    	jQuery("form#registerForm").validate({
//			rules: {
//	            email: {
//	                required: true,
//	                email: true
//	            },
//				name: {
//					required: true
//				},
//	            password: {
//	            	required: true
//	            }
//	        },
//	        messages: {
//	        	email: {
//	                required: "请填写邮箱",
//	                email:'邮箱格式不正确'
//	            },
//				name: {
//					required: "请填写昵称"
//				},
//	            password: {
//	            	required: "请填写密码"
//	            }
//	        }
//		});
    });
</script>
</body>
</html>