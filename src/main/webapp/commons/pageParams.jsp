<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.meida.utils.UrlUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String p = request.getParameter("p");
    if (StringUtils.isNotBlank(p)) {
        UrlUtils.resolveParams2Request(p, request);
    }
%>
