<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<div class="leftpanel">
	<div class="logopanel">
		<h1><span>Meida</span></h1>
	</div>
	<!-- logopanel -->
	<div class="leftpanelinner">
		<!-- This is only visible to small devices -->
		<div class="visible-xs hidden-sm hidden-md hidden-lg">
			<div class="media userlogged">
				<img alt="" src="<%=request.getContextPath()%>/images/photos/loggeduser.png" class="media-object">
				<div class="media-body">
					<h4>John Doe</h4>
					<span>"Life is so..."</span>
				</div>
			</div>
			<h5 class="sidebartitle actitle">账户中心</h5>
			<ul class="nav nav-pills nav-stacked nav-bracket mb30">
				<li><a href="profile.html"><i class="fa fa-user"></i><span>我的信息</span></a></li>
				<li><a href=""><i class="fa fa-cog"></i><span>账户设置</span></a></li>
				<li><a href="signin.html"><i class="fa fa-sign-out"></i><span>退出</span></a></li>
			</ul>
		</div>
		<h5 class="sidebartitle">快捷导航</h5>
		<ul class="nav nav-pills nav-stacked nav-bracket">
			<li class="active"><a href="index.html"><i class="fa fa-home"></i><span>控制总台</span></a></li>
			<li class="nav-parent"><a href=""><i class="fa fa-th-list"></i><span>物流处理中心</span></a>
			<ul class="children">
				<li><a href="new_form.html"><i class="fa fa-caret-right"></i> 新建物流单</a></li>
				<li><a href="tables_body.html"><i class="fa fa-caret-right"></i> 物流列表明细</a></li>
			</ul>
			</li>
			<li class="nav-parent"><a href=""><i class="fa fa-th-list"></i><span>国内件处理中心</span></a>
			<ul class="children">
				<li><a href="gn_KGtables.html"><i class="fa fa-caret-right"></i> 物流列表明细</a></li>
				<li><a href="sltables.html"><i class="fa fa-caret-right"></i> 待受理件</a></li>
				<li><a href="new_form.html"><i class="fa fa-caret-right"></i> 待妥投件</a></li>
			</ul>
			</li>
			<li class="nav-parent"><a href=""><i class="fa fa-th-list"></i><span>国际直邮件处理中心</span></a>
			<ul class="children">
				<li><a href="zy_tables.html"><i class="fa fa-caret-right"></i> 物流列表明细</a></li>
				<li><a href="sltables.html"><i class="fa fa-caret-right"></i> 待受理件</a></li>
				<li><a href="new_form.html"><i class="fa fa-caret-right"></i> 待妥投件</a></li>
			</ul>
			</li>
			<li class="nav-parent"><a href=""><i class="fa fa-th-list"></i><span>中转仓处理中心</span></a>
			<ul class="children">
				<li><a href="#"><i class="fa fa-caret-right"></i> 入库扫描</a></li>
				<li><a href="zz_tables.html"><i class="fa fa-caret-right"></i> 中转仓储明细</a></li>
				<li><a href="zz_tables.html"><i class="fa fa-caret-right"></i> 待中转件</a></li>
			</ul>
			</li>
			<li class="nav-parent"><a href=""><i class="fa fa-th-list"></i><span>Meida社区</span></a>
			<ul class="children">
				<li><a href="#"><i class="fa fa-caret-right"></i>联系我们</a></li>
				<li><a href="#"><i class="fa fa-caret-right"></i> Meida社区</a></li>
				<li>abihboy</li>
			</ul>
			</li>
		</ul>
	</div>
	<!-- leftpanelinner -->
</div>
<!-- leftpanel -->