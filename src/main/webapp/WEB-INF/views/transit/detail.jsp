<%@ page import="com.meida.model.Order" %>
<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="com.meida.model.TransitLogistic" %>
<%@ page import="com.meida.model.User" %>
<%@ page import="com.meida.utils.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meida.enumerate.OriginalLogisticStatusEnum" %>
<%@ page import="com.meida.enumerate.TransitLogisticTypeEnum" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16/1/7
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单信息</title>
    <%@include file="/commons/links.jsp" %>
</head>

<body>
<section>
    <%@include file="/commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>
<%Order order = (Order) request.getAttribute("order");
List<OriginalLogistic> originalLogisticList = (List<OriginalLogistic>) request.getAttribute("originalLogisticList");
List<TransitLogistic> transitLogisticList = (List<TransitLogistic>) request.getAttribute("transitLogisticList");
    User customer = order.getAcceptUserModel();
%>
        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>订单信息 <span>Meida</span></h2>


        </div>
        <div class="contentpanel">

            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <h4 class="panel-title">订单编号：<%=order.get(Order.number)%></h4>
                        <p>订单创建时间：<%=order.getTimestamp(Order.createTime)%></p>
                    </div>
                    <div class="panel-body panel-body-nopadding">

                        <!-- BASIC WIZARD -->
                        <div id="basicWizard" class="basic-wizard">



                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><i class="fa fa-user"></i> 客户 :</label>
                                        <div class="col-sm-2">
                                            <a href="profile.html"><%=customer.get(User.name)%></a>
                                        </div>
                                    </div>


                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        总件数：
                                        <%=order.get(Order.totalWarehouse)%>
                                    </div>
                                    <div class="col-sm-3">
                                        发往中转仓/等待入库：
                                        <%=order.get(Order.waitInWarehouse)%>
                                    </div>
                                    <div class="col-sm-3">
                                        已入库/待中转：
                                        <%=order.get(Order.waitExWarehouse)%>
                                    </div>
                                    <div class="col-sm-3">
                                        已中转出仓：
                                        <%=order.get(Order.exWarehouse)%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">预留信息 :</label>

                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" placeholder="备注信息" readonly="readonly"><%=order.get(Order.remark)%></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2"><i class="fa fa-file-o"></i> 原始件信息 :</label>
                                </div>
                                <!--多行数据添加-->
                                <div class="table-responsive">

                                    <table class="table table-success mb30 table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>收件信息</th>
                                            <th>处理状态</th>
                                            <th>物流信息</th>
                                            <th>备注信息</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%int i=0;for (OriginalLogistic originalLogistic: originalLogisticList) {
                                            OriginalLogisticStatusEnum status = OriginalLogisticStatusEnum.valueOf(originalLogistic.getInt(OriginalLogistic.status));
                                        %>
                                            <tr>
                                                <td><%=++i%><input type="hidden" value="<%=originalLogistic.getLong(OriginalLogistic.id)%>"/></td>
                                                <td><a data-content="<%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%>,
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%>,
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address))%>" data-placement="top" data-toggle="popover" data-container="body" class="popovers current">
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%>,
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%>,
                                                    <%=StringUtils.cutStr(StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address)), 13, Constant.CUT_FILL_STR)%></a></td>
                                                <td><i class="fa <%=status.getClassName()%>"></i>&nbsp;<span><%=status.getName()%>"></span></td>
                                                <td><%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.name))//TODO info.html%>,
                                                    <a href="info.html"><%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.number))%></a>,
                                                    <%=originalLogistic.getBigDecimal(OriginalLogistic.weight).doubleValue()%>KG</td>
                                                <td><a data-content="<%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.remark))%>"
                                                       data-placement="top" data-toggle="popover" data-container="body" class="popovers current">
                                                    <%=StringUtils.cutStr(StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.remark)), 6, Constant.CUT_FILL_STR)%></a></td>
                                                <td><%--<button type="button"  name="2" class="ckbtn btn btn-white btn-xs" data-toggle="modal" data-target="#ckifo"><i class="fa fa-eye"></i></button>--%></td>
                                            </tr>
                                        <%}%>


                                        </tbody>
                                    </table>
                                </div>

                                <!--多行数据添加-->
                                <div class="form-group">
                                    <label class="col-sm-2"><i class="fa fa-retweet"></i> 中转件信息 :</label>
                                </div>
                                <!--中转多行数据添加-->
                                <div class="table-responsive">
                                    <table class="table table-success mb30 table-hover">
                                        <thead>
                                        <tr>
                                            <th>
                                                <a class="btn btn-success btn-xs" href="add_zzinfo.html"><i class="fa fa-plus"></i> 中转发货</a></th>
                                            <th><label class="fj_text_c">收件信息</label></th>
                                            <th><label class="fj_text_c">原始物流信息</label></th>
                                            <th><label class="fj_text_c">中转物流信息</label></th>
                                            <th><label class="fj_text_c">发货方式</label></th>
                                            <th><label class="fj_text_c">备注信息</label></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%int j=0;for (TransitLogistic transitLogistic: transitLogisticList) {
                                            TransitLogisticTypeEnum type = TransitLogisticTypeEnum.valueOf(transitLogistic.getInt(TransitLogistic.type));
                                        %>
                                            <tr>
                                                <td><%=++j%><input type="hidden" value="<%=transitLogistic.getLong(TransitLogistic.id)%>"/></td>
                                                <td><a data-content="<%=transitLogistic.get(TransitLogistic.contactInfo)%>" data-placement="top"
                                                       data-toggle="popover" data-container="body" class="popovers current">
                                                    <%=StringUtils.cutStr(transitLogistic.getStr(TransitLogistic.contactInfo), 22, Constant.CUT_FILL_STR)%></a></td>
                                                <td><a href="info.html"><%=StringUtils.getStr(transitLogistic.getStr(TransitLogistic.originalNumber))%></a></td>
                                                <td><%=StringUtils.getStr(transitLogistic.getStr(TransitLogistic.name))//TODO info.html%>,
                                                    <a href="info.html"><%=StringUtils.getStr(transitLogistic.getStr(TransitLogistic.number))%></a>,
                                                    <%=transitLogistic.getBigDecimal(TransitLogistic.weight).doubleValue()%>KG</td>
                                                <td><i class="fa <%=type.getClassName()%>"></i> <%=type.getName()%></td>
                                                <td><a data-content="<%=StringUtils.getStr(transitLogistic.getStr(TransitLogistic.remark))%>"
                                                       data-placement="top" data-toggle="popover" data-container="body" class="popovers current">
                                                    <%=StringUtils.cutStr(StringUtils.getStr(transitLogistic.getStr(TransitLogistic.remark)), 6, Constant.CUT_FILL_STR)%></a></td>
                                                <td ><%--<button type="button" class="btn btn-white btn-xs" data-toggle="modal" data-target="#cb_modal"><i class="fa fa-eye"></i></button>--%></td>
                                            </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <!--中转多行数据添加-->





                            </div>



                        </div><!-- tab-content -->



                    </div><!-- #basicWizard -->

                </div><!-- panel-body -->
            </div><!-- panel -->
        </div><!-- col-md-6 -->


    </div>
    <!-- contentpanel -->

    </div>
    <!-- mainpanel -->

</section>
<!-- 查看详情Modal -->
<div class="modal fade" id="ckifo"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="" action="" class="form-horizontal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close2">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">业务详情</h4>
                </div>
                <div class="modal-body">

                    <div class="row editable-list-item">
                        <address>
                            <i class="fa fa-user"></i>&nbsp;<strong>胡浩</strong><br>
                            <i class="fa fa-phone"></i>&nbsp; 180589343848<br>
                            <i class="fa fa-map-marker"></i>&nbsp;广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室

                        </address>

                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-file-o"></i> 邮件信息:
                        <ul>
                            <li> EMS-<a href="info.html">em87897983kr</a>-20KG <a id="ckzz" class="btn btn-primary-alt btn-xs hide"  data-toggle="modal" data-target="#ckzzifo">查看中转详情</a></li>
                        </ul>

                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-list-ul"></i> 业务记录：
                        <ul>
                            <li><p class="text-primary"> 历时1天12小时8分</p></li>

                            <ul>
                                <li>2015-11-03 17:27:30   订单提交成功</li>
                                <li>2015-11-03 17:27:30   订单受理成功</li>
                                <li>2015-11-03 17:27:30   订单发往中转仓（中转\受理）</li>
                                <li>2015-11-03 17:27:30   订单发往目的地（直达）</li>
                                <li>2015-11-03 17:27:30   中转仓扫描入库</li>
                                <li><p class="text-danger">2015-11-03 17:27:30   中转仓分拣出库&nbsp;</p></li>
                            </ul>
                            </li>

                        </ul>
                    </div>
                    <div class="row editable-list-item">
                        <i class="fa fa-paperclip"></i> 备注信息：<br/> <p >中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库 </p>
                    </div>


                </div>

            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 查看详情modal -->
<!-- 查看原装中转详情Modal -->
<div class="modal fade" id="yz_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="basicForm" action="" class="form-horizontal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">中转业务详情</h4>
                </div>
                <div class="modal-body">

                    <div class="row editable-list-item">
                        <address>
                            <i class="fa fa-user"></i>&nbsp;<strong>胡浩</strong><br>
                            <i class="fa fa-phone"></i>&nbsp; 180589343848<br>
                            <i class="fa fa-map-marker"></i>&nbsp;广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室

                        </address>

                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-file-o"></i> 中转邮件信息:
                        <ul>
                            <li> 中通-<a href="">9834390289</a>-130KG </li>
                        </ul>

                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-file-o"></i> 关联原始邮件信息:
                        <ul>
                            <li> EMS-<a href="">em87897983kr</a>-20KG</li>
                            <li> EMS-<a href="">em87897983kr</a>-100KG</li>
                            <li> EMS-<a href="">em87897983kr</a>-10KG</li>
                        </ul>

                    </div>

                    <!--<div class="row editable-list-item">
                        <i class="fa  fa-list-ul"></i> 业务记录：
                         <ul>
                      <li><p class="text-primary"> 历时1天12小时8分</p></li>

                        <ul>
                          <li>2015-11-03 17:27:30   订单提交成功</li>
                          <li>2015-11-03 17:27:30   订单受理成功</li>
                          <li>2015-11-03 17:27:30   订单发往中转仓（中转\受理）</li>
                          <li>2015-11-03 17:27:30   订单发往目的地（直达）</li>
                          <li>2015-11-03 17:27:30   中转仓扫描入库</li>
                          <li><p class="text-danger">2015-11-03 17:27:30   中转仓分拣出库</p></li>
                        </ul>
                      </li>

                    </ul>
                     </div>-->
                    <div class="row editable-list-item">
                        <i class="fa fa-paperclip"></i> 备注信息：<br/> <p >中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库 </p>
                    </div>


                </div>

            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 查看原装中转详情modal -->
<!-- 查看拆包中转详情Modal -->
<div class="modal fade" id="cb_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="basicForm" action="" class="form-horizontal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">中转业务详情</h4>
                </div>
                <div class="modal-body">

                    <div class="row editable-list-item">


                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-file-o"></i> 中转邮件信息:
                        <ul>
                            <li> 中通-<a href="">9834390289</a>-130KG
                                <ul>
                                    <li>

                                        <address>
                                            <i class="fa fa-user"></i>&nbsp;<strong>胡浩</strong>
                                            <i class="fa fa-phone"></i>&nbsp; 180589343848<br>
                                            <i class="fa fa-map-marker"></i>&nbsp;广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室

                                        </address>
                                    </li>

                                </ul>
                            </li>

                            <li> 中通-<a href="">9834390289</a>-130KG
                                <ul>
                                    <li>

                                        <address>
                                            <i class="fa fa-user"></i>&nbsp;<strong>胡浩</strong>
                                            <i class="fa fa-phone"></i>&nbsp; 180589343848<br>
                                            <i class="fa fa-map-marker"></i>&nbsp;广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室

                                        </address>
                                    </li>

                                </ul>
                            </li>
                        </ul>

                    </div>

                    <div class="row editable-list-item">
                        <i class="fa  fa-file-o"></i> 关联原始邮件信息:
                        <ul>
                            <li> EMS-<a href="">em87897983kr</a>-20KG</li>

                        </ul>

                    </div>

                    <!--<div class="row editable-list-item">
                        <i class="fa  fa-list-ul"></i> 业务记录：
                         <ul>
                      <li><p class="text-primary"> 历时1天12小时8分</p></li>

                        <ul>
                          <li>2015-11-03 17:27:30   订单提交成功</li>
                          <li>2015-11-03 17:27:30   订单受理成功</li>
                          <li>2015-11-03 17:27:30   订单发往中转仓（中转\受理）</li>
                          <li>2015-11-03 17:27:30   订单发往目的地（直达）</li>
                          <li>2015-11-03 17:27:30   中转仓扫描入库</li>
                          <li><p class="text-danger">2015-11-03 17:27:30   中转仓分拣出库</p></li>
                        </ul>
                      </li>

                    </ul>
                     </div>-->
                    <div class="row editable-list-item">
                        <i class="fa fa-paperclip"></i> 备注信息：<br/> <p >中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库中转仓分拣出库 </p>
                    </div>


                </div>

            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 查看拆包中转详情modal -->
<%@include file="/commons/scripts.jsp" %>
<script>
    jQuery(document).ready(function() {

        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });

    });
    //判断显示中转详情按钮
    jQuery('.ckbtn').click(function() {

        if($(this).attr("name")!="1"){
            $("#ckzz").addClass('hide');
        }else{
            $('#ckzz').removeClass('hide');
        }
    });


</script>
</body>
</html>
