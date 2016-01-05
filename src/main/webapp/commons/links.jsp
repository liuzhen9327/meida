<%@ page import="com.meida.config.Constant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String ctx = request.getContextPath();%>
<meta http-equiv="X-UA-Compatible"content="IE=Edge,chrome=1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="/images/favicon.png" type="image/png">

<link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootstrap-override.min.css" rel="stylesheet">

<link href="http://cdn.bootcss.com/weather-icons/1.3.2/css/weather-icons.min.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/jqueryui/1.11.4/jquery-ui.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/animate.css/3.3.0/animate.min.css" rel="stylesheet">
<link href="/css/animate.delay.min.css" rel="stylesheet">

<link href="http://cdn.bootcss.com/jquery-toggles/2.0.4/toggles.min.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/select2/3.5.2/select2.css" rel="stylesheet">
<link href="/css/lato.min.css" rel="stylesheet">
<link href="/css/roboto.min.css" rel="stylesheet">


<link href="/css/style.default.min.css" rel="stylesheet">
<link href="/css/fj.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.4.1/respond.min.js"></script>
<![endif]-->
<script>
var ctx = '<%=request.getContextPath()%>',
    fillStr = '<%=Constant.CUT_FILL_STR%>';
</script>