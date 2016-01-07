<%@ page import="com.meida.model.Menu" %>
<%@ page import="org.apache.commons.lang.*" %>
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
        <!--
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
		-->

        <h5 class="sidebartitle">快捷导航</h5>
        <ul class="nav nav-pills nav-stacked nav-bracket">
            <%User user = (User) request.getAttribute("user");
                List<Menu> parentMenuList = Menu.allParentMenu();
                boolean flag = false;
                String currentMenu = user.getCurrentMenu();
                for (Menu parentMenu : parentMenuList) {
            %>
            <li class="nav-parent"><a href="<%=parentMenu.getStr(Menu.path)%>">
                <i class="<%=parentMenu.getStr(Menu.className)%>"></i><span><%=parentMenu.getStr(Menu.name)%></span></a>
                <ul class="children">
                    <%List<Menu> subMenuList = parentMenu.findSubMenu(parentMenu.getLong(Menu.id));
                        for (Menu subMenu : subMenuList) {%>
                    <li<%if (!flag && org.apache.commons.lang.StringUtils.isNotBlank(currentMenu) && subMenu.getStr(Menu.path).equals(currentMenu)){
                                flag = true;%>" class='active'"
                            <%}%>
                    ><a href="<%=subMenu.getStr(Menu.path)%>"><i class="<%=subMenu.getStr(Menu.className)%>"></i><%=subMenu.getStr(Menu.name)%></a></li>
                    <%}%>
                </ul>
            </li>
            <%}%>
        </ul>
	</div>
    <script>var prevMenu = '<%=user.getPrevMenu()%>';</script>
	<!-- leftpanelinner -->
</div>
<!-- leftpanel -->