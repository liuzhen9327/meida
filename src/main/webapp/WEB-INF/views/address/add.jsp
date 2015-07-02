<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>新增地址信息</title>
  <%@include file="../../../commons/links.jsp" %>
</head>

<body>


<section>
  
	<%@include file="../../../commons/leftPanel.jsp" %>  

	<div class="mainpanel">
	
	<%@include file="../../../commons/headerBar.jsp" %>
	
	<div class="pageheader">
		<h2><i class="fa fa-pencil"></i>添加我的地址信息<span>Meida</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label">您的位置:</span>
			<ol class="breadcrumb">
				<li><a href="index.html">返回首页</a></li>
				<li><a href="<%=request.getContextPath()%>/address/list">返回地址列表</a></li>
				<li class="active">新增地址信息</li>
			</ol>
		</div>
	</div>
	<div class="contentpanel">
		<div class="col-md-6">
			<form id="basicForm" action="<%=request.getContextPath()%>/address/save" class="form-horizontal">
				<div class="panel panel-default">
					<div class="panel-heading">
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">姓名 <span class="asterisk">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="name" class="form-control" placeholder="请填写姓名" required/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">联系电话 <span class="asterisk">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="mobile" class="form-control" placeholder="请填写联系电话" required/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">联系地址 <span class="asterisk">*</span></label>
							<div class="col-sm-9">
								<div class="col-sm-9">
									<textarea rows="5" name="address" class="form-control" placeholder="为了方便您的正常收件！请填写详细地址信息！谢谢！" required></textarea>
								</div>
							</div>
						</div>
						<!-- form-group -->
					</div>
					<!-- panel-body -->
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button class="btn btn-primary">保存地址</button>
							</div>
						</div>
					</div>
				</div>
				<!-- panel -->
			</form>
		</div>
		<!--col-md-6-->
	</div>
	<!-- contentpanel -->
  </div>
<!-- mainpanel -->
</section>

<%@include file="../../../commons/scripts.jsp" %>
<%@include file="../../../commons/validate.jsp" %>
<script>
jQuery(document).ready(function(){
    "use strict";
  // Basic Form
  jQuery("#basicForm").validate({
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
