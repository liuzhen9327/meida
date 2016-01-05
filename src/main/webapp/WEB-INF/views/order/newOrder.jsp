<%@ page import="com.meida.model.Order" %>
<%@ page import="com.meida.utils.StringUtils" %>
<%@ page import="com.meida.enumerate.OrderTypeEnum" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meida.model.User" %>
<%@ page import="com.meida.model.Express" %>
<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="com.meida.config.Constant" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 15/12/31
  Time: 00:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/commons/links.jsp" %>
    <title>新建订单</title>
</head>

<body>
<section>
    <%@include file="/commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>

        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>物流订单预报单 <span>Meida</span></h2>


        </div>
        <div class="contentpanel">
<%Order order = (Order) request.getAttribute("order");
List<User> myFriends = (List<User>) request.getAttribute("myFriends");
List<Express> expressList = (List<Express>)request.getAttribute("expressList");
List<OriginalLogistic> originalLogisticList = (List<OriginalLogistic>) request.getAttribute("originalLogisticList");%>
            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <h4 class="panel-title">订单编号：<%=StringUtils.getStr(order.getStr(Order.number))%></h4>

                    </div>
                    <div class="panel-body panel-body-nopadding">

                        <!-- BASIC WIZARD -->
                        <div id="basicWizard" class="basic-wizard">



                            <div class="tab-content">




                                <div class="form-group">
                                    <label class="col-sm-2">物流属性 <span class="asterisk">*</span></label>

                                    <div class="col-sm-2">
                                        <select id="orderType" class="select2">
                                            <%OrderTypeEnum[] orderTypeEnums = OrderTypeEnum.values();
                                                for (OrderTypeEnum orderTypeEnum : orderTypeEnums) {%>
            <option value="<%=orderTypeEnum.getValue()%>" <%=order.getInt(Order.type) == orderTypeEnum.getValue()?"selected":""%>><%=orderTypeEnum.getName()%></option>
                                                <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div id="acceptUserDiv" class="form-group">
                                    <label class="col-sm-2">受理方 <span class="asterisk">*</span></label>

                                    <div class="col-sm-2">
                                        <select id="acceptUser" class="select2" data-placeholder="<%=myFriends.size() > 0?"选择转运受理":"请添加转运方"%>">
                                            <option value=""></option>
                                            <%for (User friend : myFriends) { %>
                                            <option value="<%=friend.getLong(User.id)%>"><%=friend.getStr(User.name)%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <label class="col-sm-4"><a href="profile_list_my.html">转运方管理</a></label>
                                </div>




                                <!--多行数据添加-->
                                <div class="panel">
                                    <div class="table-responsive">
                                        <table class="table table-success mb30 table-hover">
                                            <thead>
                                            <tr>
                                                <th>
                                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#addModal">
                                                        <i class="fa fa-plus"></i> 添加信息
                                                    </button>
                                                </th>
                                                <th><label class="fj_text_c">收件信息</label></th>
                                                <th><label class="fj_text_c">物流信息</label></th>
                                                <th><label class="fj_text_c">备注信息</label></th>
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
                                    </div><!-- table-responsive -->
                                </div>

                                <!--多行数据添加-->




                                <div class="panel">
                                    <textarea id="remark" class="form-control" rows="5" placeholder="订单备注"><%=StringUtils.getStr(order.getStr(Order.remark))%></textarea>
                                </div>
                                <p class="text-danger x-err-msg hide"></p>
                                <div class="form-group">

                                    <a class="btn btn-default-alt x-save-btn">保存</a>
                                    <a class="btn btn-primary-alt x-commit-btn">订单提交</a>
                                </div>
                            </div><!-- tab-content -->


                        </div>
                        <!-- #basicWizard -->


                    </div><!-- panel-body -->

                </div><!-- panel -->
            </div><!-- col-md-6 -->


        </div>
        <!-- contentpanel -->

    </div>
    <!-- mainpanel -->

</section>
<!-- 添加Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form class="form-horizontal x-data-form">
        <input type="hidden" id="orderId" name="orderId" value="<%=order.getLong(Order.id)%>"/>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加信息</h4>
                </div>
                <div class="modal-body">

                    <div class="panel panel-default">



                        <div class="panel-body">
                            <div class="row row-pad-5">
                                <div class="col-lg-4 ckbox ckbox-default">
                                    <input type="checkbox" value="1" id="checkboxDefault" checked="checked" />
                                    <label for="checkboxDefault">同步上条收件信息</label>
                                </div>
                                <div class="col-lg-4">
                                    <input type="text" name="receiver" placeholder="* 收件人" class="form-control required"/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="mobile" placeholder="* 联系号码" class="form-control required"/>
                                </div>

                                <div class="panel">
                                    <textarea class="form-control required" name="address" rows="5" placeholder="* 详细联系地址" ></textarea>
                                </div>


                                <div class="col-lg-4">
                                    <select class="select2 select2-offscreen required" name="name" placeholder="邮件公司" >
                                        <option value=""></option>
                                        <%for (Express express: expressList){%>
                                        <option value="<%=express.getStr(Express.code)%>"><%=express.getStr(Express.name)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="wlnub" name="number" placeholder="邮件编号" class="form-control required"/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="kg" name="weight" placeholder="邮件重量（KG）" class="form-control required number" />
                                </div>
                            </div><!-- row -->
                            <textarea class="form-control" name="remark" rows="5" placeholder="备注信息"></textarea>
                            <p class="text-danger x-err-msg hide"></p>
                        </div><!-- panel-body -->


                    </div><!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" >保存</button>
                </div>

            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </form>
</div>
<!-- 添加modal -->
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
                                    <input type="text" name="receiver" placeholder="* 收件人" class="form-control required" />
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="mobile" placeholder="* 联系号码" class="form-control required" />
                                </div>
                                <div class="panel">
                                    <textarea class="form-control required" name="address" rows="5" placeholder="* 详细联系地址"  ></textarea>
                                </div>


                                <div class="col-lg-4">
                                    <select class="select2 required" name="name" placeholder="邮件公司" >
                                        <%for (Express express: expressList){%>
                                        <option value="<%=express.getStr(Express.code)%>"><%=express.getStr(Express.name)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="wlnub" name="number" placeholder="邮件编号" class="form-control required" />
                                </div>
                                <div class="col-lg-4">
                                    <input type="kg" name="weight" placeholder="邮件重量（KG）" class="form-control number" />
                                </div>
                            </div><!-- row -->
                            <textarea class="form-control" name="remark" rows="5" placeholder="备注信息"></textarea>
                            <p class="text-danger x-err-msg hide"></p>
                        </div><!-- panel-body -->


                    </div><!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" >修改</button>
                </div>

            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </form>
</div>
<!-- 修改modal -->
</body>
<%@include file="/commons/scripts.jsp" %>
<script src="//cdn.bootcss.com/jquery.form/3.51/jquery.form.min.js"></script>
<script src="/js/order/commons.js"></script>
<script src="/js/order/newOrder.js"></script>
<script>
    //选择直达后隐藏受理方控件
    jQuery('#orderType').change(function () {
        if ($(this).val() == <%= OrderTypeEnum.through.getValue() %>) {
            $('#acceptUserDiv').addClass('hide');
        } else {
            $('#acceptUserDiv').removeClass('hide');
        }
    });
</script>
</html>
