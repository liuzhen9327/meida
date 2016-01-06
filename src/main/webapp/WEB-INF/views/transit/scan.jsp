<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="com.meida.model.Order" %>
<%@ page import="com.meida.enumerate.OriginalLogisticStatusEnum" %>
<%@ page import="com.meida.utils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.meida.model.User" %><%--
  Created by IntelliJ IDEA.
  User: liuzhen
  Date: 2016/1/6
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>中转件扫描入库</title>
    <%@include file="/commons/links.jsp" %>
</head>

<body>


<section>

    <%@include file="/commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>

        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>中转件扫描<span>Meida</span></h2>

        </div>
<%String errMsg = (String) request.getAttribute("errMsg");
OriginalLogistic originalLogistic = (OriginalLogistic) request.getAttribute("originalLogistic");
Order order = (Order) request.getAttribute("order");
    User customer = (User) request.getAttribute("customer");
%>
        <div class="contentpanel">

            <div class="panel panel-default">
                <div class="panel-body editable-list-group">
                    <div class="row editable-list-item">
                        <form action="/transit/scan" class="form" method="post">
                        <div class="input-group">
                            <input name="searchValue" type="text" class="form-control" placeholder="请输入物流单号" value="<%=com.meida.utils.StringUtils.getStr(request.getAttribute("searchValue"))%>"/>
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-white" tabindex="-1">检索信息</button>
                                <button type="button" class="btn btn-white x-ok-btn "
                                        <%=StringUtils.isNotBlank(errMsg) ||
                                                originalLogistic.getInt(OriginalLogistic.status) != OriginalLogisticStatusEnum.waitInWarehouse.getValue()
                                                ?"disabled=\"disabled\"":""%> tabindex="-1"> 确认入库</button>

                            </div>
                        </div>
                        </form>

                    </div>
                <%if (StringUtils.isNotBlank(errMsg)){%>
                    <div><p class="text-danger x-err-msg"><%=errMsg%></p></div>
                <%} else {%>
                    <div class="x-order-info">
                        <!--  <div class="row editable-list-item">
                            <div class="col-sm-5"><a class="btn btn-primary-alt" href="#"><i class="fa  fa-print"></i> <span>打印地址</span></a></div>
                          </div>-->
                        <div class="row editable-list-item">
                            <div class="col-sm-3 fj_sm_text_title">订单编号&nbsp;：<%=com.meida.utils.StringUtils.getStr(order.getStr(Order.number))%></div>
                            <div class="col-sm-3 fj_sm_text_title">订单时间&nbsp;：<%=com.meida.utils.StringUtils.getStr(order.getTimestamp(Order.createTime))%></div>
                            <div class="col-sm-2 fj_sm_text_title" >订单数量&nbsp;：1/6</div>
                            <div class="col-sm-2 fj_sm_text_title"><i class="fa   fa-code-fork"></i> 客户信息&nbsp;：</div>
                            <div class="col-sm-2" ><%=customer.getLong(User.id) != null?"<a href='profile.html'><strong>"+customer.getStr(User.name)+"</strong></a>" : ""%></div>
                        </div><!-- row -->

                        <div class="row editable-list-item">
                            <div class="col-sm-2 fj_sm_text_title">收件方名称&nbsp;：</div>
                            <div class="col-sm-2"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%></div>
                            <div class="col-sm-2 fj_sm_text_title">联系号码&nbsp;：</div>
                            <div class="col-sm-4"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%></div>
                        </div><!-- row -->


                        <div class="row editable-list-item">
                            <div class="col-sm-3 fj_sm_text_title">收件地址&nbsp;：</div>
                            <div class="col-sm-9"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address))%></div>
                        </div><!-- row -->

                        <div class="row editable-list-item">
                            <div class="col-sm-2 fj_sm_text_title">物流公司&nbsp;：</div>
                            <div class="col-sm-2"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.name))%></div>
                            <div class="col-sm-2 fj_sm_text_title">物流单号&nbsp;：</div>
                            <div class="col-sm-2"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.number))%></div>
                            <div class="col-sm-2 fj_sm_text_title">邮件重量&nbsp;：</div>
                            <div class="col-sm-2"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.weight))%>KG</div>
                        </div><!-- row -->
                        <div class="row editable-list-item">
                            <div class="col-sm-3 fj_sm_text_title">客户预留信息&nbsp;：</div>
                            <div class="col-sm-9">
                                <%=com.meida.utils.StringUtils.getStr(order.getStr(Order.remark))%>
                            </div>
                        </div><!-- row -->

                        <div class="row editable-list-item">
                            <div class="col-sm-3 fj_sm_text_title">备注信息&nbsp;：</div>
                            <div class="col-sm-9"><%=com.meida.utils.StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.remark))%>
                            </div>
                        </div><!-- row -->
                    </div>
                    <%}%>


                </div><!-- panel-body -->
            </div><!-- panel -->

        </div><!-- contentpanel -->

    </div><!-- mainpanel -->

    <!-- rightpanel -->

</section>
<%@include file="/commons/scripts.jsp" %>
<script src="/js/transit/scan.js"></script>
</body>
</html>
