<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="com.meida.model.Express" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meida.model.User" %>
<%@ page import="com.meida.model.Order" %>
<%@ page import="com.meida.utils.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: liuzhen
  Date: 2016/1/5
  Time: 7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单受理</title>
    <%@include file="/commons/links.jsp" %>
</head>

<body>

<section>
    <%@include file="/commons/leftPanel.jsp" %>
<%Order order = (Order) request.getAttribute("order");
List<User> myFriends = (List<User>) request.getAttribute("myFriends");
List<Express> expressList = (List<Express>)request.getAttribute("expressList");
List<OriginalLogistic> originalLogisticList = (List<OriginalLogistic>) request.getAttribute("originalLogisticList");
User customer = order.getAcceptUser();%>
    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>

        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>订单受理 <span>Meida</span></h2>
        </div>
        <div class="contentpanel">
            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">订单编号：<%=order.getStr(Order.number)%></h4>
                        <p>订单创建时间：<%=order.getTimestamp(Order.createTime)%></p>
                    </div>
                    <div class="panel-body panel-body-nopadding">

                        <!-- BASIC WIZARD -->
                        <div id="basicWizard" class="basic-wizard">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <form class="form" action="/order/accept" method="post" data-toggle="validator" role="form">
                                        <input name="id" type="hidden" value="<%=order.getLong(Order.id)%>"/>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><i class="fa fa-user"></i> 客户</label>
                                            <div class="col-sm-2"> <a href="javascript:void(0)"><%=customer.getStr(User.name)%></a> </div>
                                        </div>
                                        <!--<div class="form-group">
                                            <label class="col-sm-2 control-label"><i class="fa fa-cubes"></i> 受理邮件数：</label>
                                            <div class="col-sm-2"> 3 </div>
                                        </div>-->
                                        <div class="form-group">
                                            <label class="col-sm-2"><i class="fa fa-code-fork"></i> 受理方<span class="asterisk">*</span></label>
                                            <div class="col-sm-3">
                                                <select class="select2" data-placeholder="选择转运受理" required>
                                                    <option value=""></option>
                                                    <%for (User friend : myFriends) { %>
                                                    <option value="<%=friend.getLong(User.id)%>"><%=friend.getStr(User.name)%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                            <label class="col-sm-4"><a href="profile_list_my.html">转运方管理</a></label>
                                        </div>
                                        <!--多行数据添加-->
                                        <!-- BASIC WIZARD -->
                                        <div id="basicWizard" class="basic-wizard">
                                            <div class="tab-content">

                                                <!--多行数据添加-->
                                                <div class="panel">
                                                    <div class="table-responsive">
                                                        <table class="table table-success mb30 table-hover">
                                                            <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>收件信息</th>
                                                                <th>物流信息</th>
                                                                <th>备注信息</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody class="x-data-list">

                                                            <%int i = 0;
                                                                for (OriginalLogistic originalLogistic : originalLogisticList){%>
                                                            <tr>
                                                                <td><%=++i%><input type="hidden" value="<%=originalLogistic.getLong(OriginalLogistic.id)%>"/></td>
                                                                <td><a data-content="<%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%>,
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%>,
                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address))%>" data-placement="top" data-toggle="popover" data-container="body" class="popovers current">
                                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%>,
                                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%>,
                                                                    <%=StringUtils.cutStr(StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address)), 13, Constant.CUT_FILL_STR)%></a></td>
                                                                <td><%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.name))%>,
                                                                    <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.number))%>,
                                                                    <%=originalLogistic.getBigDecimal(OriginalLogistic.weight).doubleValue()%>KG</td>
                                                                <td><a data-content="<%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.remark))%>"
                                                                       data-placement="top" data-toggle="popover" data-container="body" class="popovers current">
                                                                    <%=StringUtils.cutStr(StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.remark)), 6, Constant.CUT_FILL_STR)%></a></td>
                                                                <td class="table-action">
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-white btn-xs x-edit-btn" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>
                                                                        <button type="button" class="btn btn-white x-delete-row btn-xs"><i class="fa fa-trash-o"></i></button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <%}%>


                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- table-responsive -->
                                                </div>

                                                <!--多行数据添加-->

                                                <div class="panel">
                                                    <textarea name="remark" class="form-control" rows="5" placeholder="订单备注"><%=StringUtils.getStr(order.getStr(Order.remark))%></textarea>
                                                </div>
                                                <p class="text-danger x-err-msg hide"></p>
                                            </div>
                                            <!-- tab-content -->

                                        </div>
                                        <!-- #basicWizard -->
                                        <!--多行数据添加-->

                                        <div class="col-sm-9 col-sm-offset-3">
                                            <button type="submit" class="btn btn-primary">受理订单</button>
                                            <button type="button" onclick="javascript:window.history.back()" class="btn btn-default">返回</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- tab-content -->

                        </div>
                        <!-- #basicWizard -->

                    </div>
                    <!-- panel-body -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-md-6 -->

        </div>
        <!-- contentpanel -->

    </div>
    <!-- mainpanel -->

</section>
<!-- 修改Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form class="form-horizontal x-data-form">
        <input type="hidden" name="orderId" value="<%=order.getLong(Order.id)%>"/>
        <input type="hidden" name="id"/>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row row-pad-5">
                                <div class="col-lg-4">
                                    <input type="text" name="receiver" placeholder="* 收件人" class="form-control"  required/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="mobile" placeholder="* 联系号码" class="form-control"  required/>
                                </div>
                                <div class="panel">
                                    <textarea class="form-control" name="address" rows="5" placeholder="* 详细联系地址"  required></textarea>
                                </div>
                                <div class="col-lg-4">
                                    <select class="select2" name="name" placeholder="邮件公司">
                                        <%for (Express express: expressList){%>
                                        <option value="<%=express.getStr(Express.code)%>"><%=express.getStr(Express.name)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="wlnub" name="number" placeholder="邮件编号" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <input type="kg" name="weight" placeholder="邮件重量（KG）" class="form-control" />
                                </div>
                            </div>
                            <!-- row -->
                            <textarea class="form-control" name="remark" rows="5" placeholder="备注信息"></textarea>
                        </div>
                        <!-- panel-body -->
                       <p class="text-danger x-err-msg hide"></p>
                    </div>
                    <!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 修改modal -->
<%@include file="/commons/scripts.jsp" %>
<script src="/js/order/commons.js"></script>
<script>

    $(function(){
        $('.x-data-form').submit(function () {
            var form = $(this);
            form.ajaxSubmit({
                url: '/original/save',
                type: 'post',
                success: function (resp) {
                    if (resp.succ) {
                        refreshDataList(resp.data, form.find('input[name="id"]').val());
                        form.parent().modal('hide');
                        var orderId = form.find('input[name="orderId"]').val();
                        form[0].reset();
                        form.find('input[name="orderId"]').val(orderId);
                    } else {
                        form.find('.x-err-msg').text(resp.errMsg).removeClass('hide');
                    }
                }
            });
            return false;
        });
    })
</script>
</body>
</html>

