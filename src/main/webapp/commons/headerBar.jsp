<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="headerbar">
	<a class="menutoggle"><i class="fa fa-bars"></i></a>
	<%--<form class="searchform" action="index.html" method="post">--%>
		<%--<input type="text" class="form-control" name="keyword" placeholder="Search here..."/>--%>
	<%--</form>--%>
	<div class="header-right">
		<ul class="headermenu">
			<li>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				<img src="<%=request.getContextPath()%>/images/photos/loggeduser.png" alt=""/>
                John Doe
				<span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
					<li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> 个人中心</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 账号设置</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> 帮助</a></li>
					<li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> 退出</a></li>
				</ul>
			</div>
			</li>
		</ul>
	</div>
	<!-- header-right -->
</div>
<!-- headerbar -->