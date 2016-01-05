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
User customer = (User) request.getAttribute("customer");%>
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
                                    <form class="form">
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
                                                    <textarea id="remark" class="form-control" rows="5" placeholder="订单备注"><%=StringUtils.getStr(order.getStr(Order.remark))%></textarea>
                                                </div>
                                                <p class="text-danger x-err-msg hide"></p>
                                            </div>
                                            <!-- tab-content -->

                                        </div>
                                        <!-- #basicWizard -->
                                        <!--多行数据添加-->

                                        <div class="col-sm-9 col-sm-offset-3">
                                            <button class="btn btn-primary" onClick="sltables.html">受理订单</button>
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
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="basicForm" action="" class="form-horizontal">
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
                                    <input type="text" name="name" placeholder="* 收件人" class="form-control" value="吴昊"  required/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="phone" placeholder="* 联系号码" class="form-control" value="18872678723"  required/>
                                </div>
                                <div class="panel">
                                    <textarea class="form-control" rows="5" placeholder="* 详细联系地址"  required>吴昊,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</textarea>
                                </div>
                                <div class="col-lg-4">
                                    <select class="select2"  data-placeholder="邮件公司">
                                        <option value="EMS">EMS</option>
                                        <option value="顺丰">顺丰</option>
                                        <option value="中通">中通</option>
                                        <option value="申通">申通</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="wlnub" name="wlub" placeholder="邮件编号" class="form-control" value="em9892329879kr"/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="kg" name="kg" placeholder="邮件重量（KG）" class="form-control" value="12.9"/>
                                </div>
                            </div>
                            <!-- row -->
                            <textarea class="form-control" rows="5" placeholder="备注信息">中转仓地址：李文.21983908012.广州市白云区石井镇22号。帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</textarea>
                        </div>
                        <!-- panel-body -->

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
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/colorpicker.js"></script>
<script>
    jQuery(document).ready(function() {

        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });

        // Delete row in a table
        jQuery('.delete_row').click(function(){
            var c = confirm("确认删除此条信息吗？");
            if(c)
                jQuery(this).closest('tr').fadeOut(function(){
                    jQuery(this).remove();
                });

            return false;
        });



    });
</script>
</body>
</html>

