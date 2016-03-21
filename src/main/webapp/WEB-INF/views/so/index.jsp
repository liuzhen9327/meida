<%@ page import="java.util.List" %>
<%@ page import="com.meida.utils.StringUtils" %>
<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="org.apache.commons.lang.time.DateFormatUtils" %>
<%@ page import="com.meida.utils.DateUtils" %>
<%@ page import="com.meida.service.TransitLogisticService" %>
<%@ page import="com.meida.model.TransitLogistic" %>
<%@ page import="com.jfinal.plugin.ehcache.CacheKit" %>
<%@ page import="com.meida.model.Express" %>
<%@ page import="org.apache.commons.lang.math.NumberUtils" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16/1/22
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/commons/links.jsp" %>
    <title>邮件查询</title>
    <style>
        @media (max-width:1000px) {
            .ggbx {
                height:65px;
                width:100%;
                background-color:#2f7bad;
                background-image:url(/images/so_logo.jpg);
                background-repeat:no-repeat;
                background-position:center;
                display:block;
            }
        }
        @media (max-width:1000px) {
        }
    </style>

</head>

<body>
<%String value = StringUtils.getStr(request.getAttribute("value"));%>
<section>
    <!--左侧广告+联系方式leftpanel-->
    <div class="leftpanel box_st"> <img src="/images/photos/1.jpg"/>
        <div class="so_tex">
            <p><i class="fa  fa-phone"></i>&nbsp;咨询电话：18588879488</p>
            <p>Email: postmaster@vipmeida.com</p>
        </div>
    </div>
    <!--左侧广告+联系方式leftpanel-->
    <!--mainpanel-->
    <div class="mainpanel">
        <!--广告栏-->
        <div class="ggbx">
        </div>
        <!--广告栏-->
        <!--panel-body-->
        <div class="panel-body panel-default panel fj_padding">
            <!--logo-->
            <div class="panel"></div>
            <!--logo-->
            <!--筛选条件-->
            <div class="col-md-12 ">

                <form action="/so" method="get">

                    <div class="row row-pad-5">

                        <div class="col-lg-3">
                            <input placeholder="初始物流单号/收件联系号码" value="<%=value%>" name="value" class="form-control" required/>
                        </div>
                        <div class="col-lg-4">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;&nbsp; 搜索  검색</button>

                        </div>
                    </div><!-- row -->



                </form>


            </div>
            <%List<OriginalLogistic> list = (List<OriginalLogistic>) request.getAttribute("list");

            %>

            <!--筛选条件-->
            <!--结果-->
            <div class="col-md-10">
                <%if (list.size() > 0){%>
                <div class="alert alert-success">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="fa fa-info-circle"></i>&nbsp;&nbsp;
                    <strong>查询结果：<%=list.size()%>条</strong>.
                </div>
                <%} else {
                    if (request.getAttribute("value") != null){%>
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="fa fa-info-circle"></i>&nbsp;&nbsp;<strong>暂无查询结果!</strong>.
                </div>
                <%}}%>

                <div class="panel-group" id="accordion">
                    <%for (OriginalLogistic originalLogistic : list) {%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#id<%=originalLogistic.getId()%>">
                                    <h5><i class="fa fa-angle-double-right"></i>
                                        &nbsp;<%=originalLogistic.get(OriginalLogistic.name)%>
                                        &nbsp; <%=originalLogistic.get(OriginalLogistic.number)%>
                                        &nbsp; <%=originalLogistic.get(OriginalLogistic.weight)%>KG
                                        &nbsp;</h5>
                                    <h6><i class="fa fa-clock-o"></i>
                                        &nbsp;<%=DateFormatUtils.format(originalLogistic.getTimestamp("updateTime").getTime(), DateUtils.yyMMddhhmm)%></h6>
                                </a>
                            </h4>
                        </div>
                        <div id="id<%=originalLogistic.getId()%>" class="panel-collapse collapse">


                            <div class="row editable-list-item">
                                <i class="fa fa-cube"></i>&nbsp;服务商邮件交付物流承运方：
                                <div class="alert alert-warning">
                                    <%Object expressName = CacheKit.get(Express.CACHE_NAME, originalLogistic.get(OriginalLogistic.name));%>
                                    <li><%=expressName != null ? expressName:originalLogistic.get(OriginalLogistic.name)%>-<a target="_blank" href="http://m.kuaidi100.com/index_all.html?type=<%=originalLogistic.get(OriginalLogistic.name)%>&postid=<%=originalLogistic.get(OriginalLogistic.number)%>&callbackurl=#"><%=originalLogistic.get(OriginalLogistic.number)%></a></li>
                                </div>

                            </div>
                            <%List<TransitLogistic> transitLogisticList = TransitLogisticService.findByOriginalId(originalLogistic.getId());
                                if (transitLogisticList.size() > 0) {
                            %>
                                    <div class="row editable-list-item">
                                        <i class="fa fa-cubes"></i>&nbsp;中转仓邮件交付物流承运方：
                                        <div class="alert <%=transitLogisticList.size() < 2?"alert-info":"alert-warning"%>">
                                            <%for (TransitLogistic transitLogistic : transitLogisticList) {
                                                boolean flag = true;
                                                if (value.length() == 11 &&
                                                    NumberUtils.isNumber(value) &&
                                                    !transitLogistic.get(TransitLogistic.originalMobile).equals(value)) {
                                                    flag = false;
                                            %>
                                                <%}
                                                if (flag){%>
                                                    <%expressName = CacheKit.get(Express.CACHE_NAME, transitLogistic.get(TransitLogistic.name));%>
                                                    <li><%=expressName != null ? expressName:transitLogistic.get(TransitLogistic.name)%>-<a target="_blank" href="http://m.kuaidi100.com/index_all.html?type=<%=transitLogistic.get(TransitLogistic.name)%>&postid=<%=transitLogistic.get(TransitLogistic.number)%>&callbackurl=a-zhen.com/so?value=<%=value%>"><%=transitLogistic.get(TransitLogistic.number)%></a></li>
                                                <%}
                                            }%>
                                        </div>
                                    </div>
                            <%}%>


                        </div>
                    </div><!--box-->

<%}%>

                </div>

            </div>
            <!--结果-->
        </div>
    </div><!-- tab -->
    </div>
    <!--panel-body-->
    </div>
    <!--mainpanel-->
</section>


<%@include file="/commons/scripts.jsp" %>
</body>
</html>

