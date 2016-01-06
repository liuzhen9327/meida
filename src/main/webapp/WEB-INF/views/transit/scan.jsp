<%--
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

        <div class="contentpanel">

            <div class="panel panel-default">
                <div class="panel-body editable-list-group">
                    <div class="row editable-list-item">
                        <form action="/transit/scan" class="form" method="post">
                        <div class="input-group">
                            <input type="hidden" name="id" value="">
                            <input name="searchValue" type="text" class="form-control" placeholder="请输入物流单号"/>
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-white" tabindex="-1">检索信息</button>
                                <button type="button" class="btn btn-white x-ok-btn"  tabindex="-1"> 确认入库</button>

                            </div>
                        </div>
                        </form>

                    </div>
                    <div class="x-order-info">
                    <!--  <div class="row editable-list-item">
                        <div class="col-sm-5"><a class="btn btn-primary-alt" href="#"><i class="fa  fa-print"></i> <span>打印地址</span></a></div>
                      </div>-->
                    <div class="row editable-list-item">
                        <div class="col-sm-3 fj_sm_text_title">订单编号&nbsp;：<span id="orderNumber" ></span></div>
                        <div class="col-sm-3 fj_sm_text_title">订单时间&nbsp;：<span id="createTime" ></span></div>
                        <div class="col-sm-2 fj_sm_text_title" >订单数量&nbsp;：<span id="totalWarehouse" ></span>1/6</div>
                        <div class="col-sm-2 fj_sm_text_title"><i class="fa   fa-code-fork"></i> 客户信息&nbsp;：</div>
                        <div class="col-sm-2" id="customer"><a href="profile.html"><strong>VIPMEIDAKOREA</strong></a></div>
                    </div><!-- row -->

                    <div class="row editable-list-item">
                        <div class="col-sm-2 fj_sm_text_title">收件方名称&nbsp;：</div>
                        <div class="col-sm-2"><span id="receiver" ></span></div>
                        <div class="col-sm-2 fj_sm_text_title">联系号码&nbsp;：</div>
                        <div class="col-sm-4"><span id="mobile" ></span></div>
                    </div><!-- row -->


                    <div class="row editable-list-item">
                        <div class="col-sm-3 fj_sm_text_title">收件地址&nbsp;：</div>
                        <div class="col-sm-9"><span id="address" ></span></div>
                    </div><!-- row -->

                    <div class="row editable-list-item">
                        <div class="col-sm-2 fj_sm_text_title">物流公司&nbsp;：</div>
                        <div class="col-sm-2"><span id="name" ></span></div>
                        <div class="col-sm-2 fj_sm_text_title">物流单号&nbsp;：</div>
                        <div class="col-sm-2"><span id="number" ></span></div>
                        <div class="col-sm-2 fj_sm_text_title">邮件重量&nbsp;：</div>
                        <div class="col-sm-2"><span id="weight" ></span></div>
                    </div><!-- row -->
                    <!--<div class="row editable-list-item">
                        <div class="col-sm-3 fj_sm_text_title">客户预留信息&nbsp;：</div>
                        <div class="col-sm-9">
                            包裹发中通装运
                        </div>
                    </div>--><!-- row -->

                    <div class="row editable-list-item">
                        <div class="col-sm-3 fj_sm_text_title">备注信息&nbsp;：</div>
                        <div class="col-sm-9" id="remark">
                        </div>
                    </div><!-- row -->
                    </div>

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
