<%@ page import="java.util.List" %>
<%@ page import="com.meida.model.So" %>
<%@ page import="com.meida.utils.StringUtils" %><%--
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
                background-image:url(/images/meida.jpg);
                display:block;
            }
        }
        @media (max-width:1000px) {
        }
    </style>

</head>

<body>
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

                <form action="/so/index" method="post">

                    <div class="row row-pad-5">
                        <div class="col-lg-3">
                            <input placeholder="初始物流单号/收件联系号码" value="<%=StringUtils.getStr(request.getAttribute("value"))%>" name="value" class="form-control" required/>
                        </div>
                        <%--<div id="data" class="col-lg-3 hide">--%>

                            <%--<div class="input-group ">--%>
                                <%--<input type="text" class="form-control" placeholder="订单提交日期" id="datepicker" required>--%>
                                <%--<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="col-lg-4">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;&nbsp; 搜索  검색</button>

                        </div>
                    </div><!-- row -->



                </form>


            </div>

<%List<So> list = (List<So>) request.getAttribute("list");

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
                    <%for (So so : list) {%>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#id<%=so.get(So.id)%>">
                                        <%=so.toString()%>
                                    </a>
                                </h4>
                            </div>
                            <div id="id<%=so.get(So.id)%>" class="panel-collapse collapse">


                                <div class="row editable-list-item">
                                    邮件交于物流承运方：<%=so.get(So.originalName)%>-<a><%=so.get(So.originalNumber)%></a>
                                </div>
                                <div class="row editable-list-item">
                                    物流信息
                                </div>
                                <div class="row editable-list-item">
                                    邮件交于中转物流承运方：<%=so.get(So.transitName)%>-<a><%=so.get(So.transitNumber)%></a>
                                </div>
                                <div class="row editable-list-item">
                                    物流信息
                                </div>

                            </div>
                        </div>
                    <%}%>



                </div>

                <!--<div class="panel-group" id="accordion">

                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#1">
                        <label class="col-sm-4"> EMS&nbsp;&nbsp;em123456789kr&nbsp;&nbsp;19KG</label>
                        <label class="col-sm-3"> <i class="fa  fa-history"></i> <strong>等待出仓中转</strong></label>
                         <label class="col-sm-3"> 历时：1天9小时27分</label>&nbsp;&nbsp;
                        </a>
                      </h4>
                    </div>
                    <div id="1" class="panel-collapse collapse">
                      <div class="panel-body">
                        邮件于2015/12/2/15:20:11受理,交于物流承运方：EMS-<a>em123456789kr</a>
                        <div class="row editable-list-item">
                         暂无中转信息
                      </div>
                      </div>
                    </div>
                  </div>


                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#2">
                        <label class="col-sm-4"> EMS&nbsp;&nbsp;em123456789kr&nbsp;&nbsp;19KG</label>
                        <label class="col-sm-3"> <i class="fa fa-paper-plane"></i> <strong>发往中转仓</strong></label>
                         <label class="col-sm-3"> 历时：1天9小时27分</label>&nbsp;&nbsp;
                        </a>
                      </h4>
                    </div>
                    <div id="2" class="panel-collapse collapse">
                      <div class="panel-body">
                          邮件于2015/12/2/15:20:11受理,交于物流承运方：EMS-<a>em123456789kr</a>
                        <div class="row editable-list-item">
                         暂无中转信息
                      </div>
                      </div>
                    </div>
                  </div>


                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#3">
                        <label class="col-sm-4"> EMS&nbsp;&nbsp;em123456789kr&nbsp;&nbsp;19KG</label>
                        <label class="col-sm-3"> <i class="fa fa-pencil"></i> <strong>邮件等待审核</strong></label>
                         <label class="col-sm-3"> 历时：1天9小时27分</label>&nbsp;&nbsp;
                        </a>
                      </h4>
                    </div>
                    <div id="3" class="panel-collapse collapse">
                      <div class="panel-body">
                          邮件于2015/12/2/15:20:11提交,等待服务方审核确认！

                      </div>
                    </div>
                  </div>



                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                      <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#4">
                        <label class="col-sm-4"> EMS&nbsp;&nbsp;em123456789kr&nbsp;&nbsp;19KG</label>
                        <label class="col-sm-3"> <i class="fa  fa-truck"></i> <strong>&nbsp;已出仓&nbsp;&nbsp;</strong></label>
                        <label class="col-sm-3"> 历时：1天9小时27分</label>&nbsp;&nbsp;
                        </a>

                      </h4>
                    </div>
                    <div id="4" class="panel-collapse collapse">
                      <div class="panel-body">
                          邮件于2015/12/2/15:20:11受理,交于物流承运方：EMS-<a>em123456789kr</a>
                        <div class="row editable-list-item">
                          <div class="col-sm-1">圆通</div>
                          <div class="col-sm-2"><a href="#">v290809809</a></div>
                          <div class="col-sm-1">15.8KG</div>
                          <div class="col-sm-2"><i class="fa fa-sitemap"></i> 拆包分发</div>
                        </div>
                          <div class="row editable-list-item">
                          <div class="col-sm-1">圆通</div>
                          <div class="col-sm-2"><a href="#">v290809809</a></div>
                          <div class="col-sm-1">15.8KG</div>
                          <div class="col-sm-2"><i class="fa fa-cube"></i> 原装转发</div>

                         </div>
                      </div>
                    </div>
                  </div>




                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#5">
                        <label class="col-sm-4"> EMS&nbsp;&nbsp;em123456789kr&nbsp;&nbsp;19KG</label>
                        <label class="col-sm-3"><i class="fa fa-plane"></i> <strong>&nbsp;直发&nbsp;&nbsp;</strong></label>
                         <label class="col-sm-3"> 历时：1天9小时27分</label>&nbsp;&nbsp;
                        </a>
                      </h4>
                    </div>
                    <div id="5" class="panel-collapse collapse">
                      <div class="panel-body">
                        邮件于2015/12/2/15:20:11受理,交于物流承运方：EMS-<a>em123456789kr</a>
                      </div>
                    </div>
                  </div>



                </div>-->





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

