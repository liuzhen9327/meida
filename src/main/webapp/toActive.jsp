<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.meida.utils.ValidatorUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>去激活</title>
</head>
<body>
<%String email = new String(Base64.decodeBase64(request.getQueryString()));
if (!ValidatorUtils.isEmail(email)) response.sendRedirect("/500.jsp");%>
你已经绑定了邮箱：<%=email %>，当前状态待激活
</body>
</html>