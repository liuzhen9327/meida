<%@ page import="com.meida.utils.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16/1/23
  Time: 02:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>传excel</title>
</head>
<body>

<form action="/so/upload" method="post" enctype="multipart/form-data">
<input type="file" name="file"/><button type="submit" value="">确定上传</button>
</form>
<%=StringUtils.getStr(request.getAttribute("msg"))%>
</body>
</html>
