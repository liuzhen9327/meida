<%@ page import="com.meida.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meida.enumerate.OrderStatusEnum" %>
<%@ page import="com.meida.model.User" %><%--
  Created by IntelliJ IDEA.
  User: liuzhen
  Date: 2016/1/5
  Time: 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>物流处理中心</title>
    <%@include file="/commons/links.jsp" %>
</head>

<body>

<section>
    <%@include file="/commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>

        <div class="pageheader">
            <h2><i class="fa fa-table"></i> 物流处理中心 <span>Meida</span></h2>

        </div>

        <div class="contentpanel">

<%List<Order> orderList = (List<Order>) request.getAttribute("orderList");%>

            <div class="row">

                <div class="panel panel-default">
                    <div class="panel-heading">

                        <h3 class="panel-title">物流订单列表</h3>
                        <p><a href="sltables.html"><i class="fa  fa-history"></i> <strong>待受理件（25）</strong></a> <a href="zztables.html"><i class="fa  fa-home"></i> <strong>未中转（25）</strong></a> <a href="zztables.html"><i class="fa  fa-plane"></i> <strong>直发件（25）</strong></a></p>
                    </div>
                    <div class="panel-body">

                        <div class="table-responsive">
                            <!-- 筛选条件 -->
                            <div class="panel-body">


                                <div class="form-group">
                                    <label class="col-sm-1 control-label">订单编号</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="name" class="form-control" />
                                    </div>
                                    <label class="col-sm-1 control-label">订单状态</label>
                                    <div class="col-sm-2">
                                        <select class="form-control ">
                                            <option></option>
                                            <option>预约待受理</option>
                                            <option>受理成功</option>
                                            <option>直达件</option>
                                        </select>
                                    </div>
                                    <label class="col-sm-1 control-label">联系号码</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="name" class="form-control" />
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-white">搜索</button>
                                        <button type="button" class="btn btn-white" data-toggle="modal" data-target="#myModal2">高级搜索</button>
                                    </div>
                                </div>



                            </div>
                            <!-- 筛选条件 -->
                            <table class="table table-success" >
                                <thead class="table_hand " >

                                <tr>
                                    <th >订单编号	</th>
                                    <th >状态</th>
                                    <th >总件数</th>
                                    <th >等待入库数</th>
                                    <th >等待出仓数</th>
                                    <th >已出仓数</th>
                                    <th >受理时间</th>
                                    <th >操作</th>
                                </tr>
                                </thead>
                                <tbody class="x-data-list">
                                <%for (Order order : orderList) {%>
                                <%OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));%>
                                <tr class="gradeC">
                                    <th ><a href="/order/detail/<%=order.get(Order.id)%>">
                                        <input type="hidden" value="<%=order.getLong(Order.id)%>"/><%=order.get(Order.number)%>
                                    </a></th>
                                    <th ><i class="fa <%=orderStatus.getClassName()%>"></i> <strong><%=orderStatus.getName()%></strong></th>
                                    <th ><%=order.getInt(Order.totalWarehouse)%></th>
                                    <th ><%=order.getInt(Order.waitInWarehouse) == 0 ? "-":order.getInt(Order.waitInWarehouse)%></th>
                                    <th ><%=order.getInt(Order.waitExWarehouse) == 0 ? "-":order.getInt(Order.waitExWarehouse)%></th>
                                    <th ><%=order.getInt(Order.exWarehouse) == 0 ? "-":order.getInt(Order.exWarehouse)%></th>
                                    <th ><%=order.getAcceptTimeStr()%></th>
                                    <th ><%=orderStatus == OrderStatusEnum.reserve
                                            && order.getLong(Order.ownerId).equals(((User) request.getAttribute("user")).getLong(User.id))?
                                            "<button class='btn btn-primary x-cancel-btn btn-xs'>取消订单</button>":""%></th>
                                </tr>
                                <%}%>

                                </tbody>
                            </table>
                        </div><!-- table-responsive -->

                        <!--分页-->
                        <!--<ul class="pagination nomargin pull-right">
                            <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                            <li><a href="#">1</a></li>
                            <li class="active"><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>-->
                        <!--分页-->

                    </div><!-- panel-body -->
                </div><!-- panel -->
            </div>

        </div><!-- contentpanel -->

    </div><!-- mainpanel -->


</section>
<!-- 高级搜索Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="basicForm" action="" class="form-horizontal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">高级搜索</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row row-pad-5">
                                <div class="col-lg-4">
                                    <input type="text" name="" placeholder="订单编号" class="form-control"   />
                                </div>
                                <div class="col-lg-4">

                                    <!--<select class="select2" data-placeholder="订单状态">
                                       <option value="0"></option>
                                       <option value="1">预约待受理</option>
                                       <option value="2">受理成功</option>
                                       <option value="3">直达件</option>
                                     </select>-->

                                    <select class="select2" data-placeholder="选择订单状态">
                                        <option value=""></option>
                                        <%OrderStatusEnum[] orderStatusEnums = OrderStatusEnum.values();
                                            for (OrderStatusEnum orderStatusEnum : orderStatusEnums) {%>
                                        <option value="<%=orderStatusEnum.getValue()%>"><%=orderStatusEnum.getName()%></option>
                                        <%}%>
                                    </select>

                                </div>

                                <div class="col-lg-4">
                                    <input type="wlnub" name="wlub" placeholder="邮件编号" class="form-control" />
                                </div>

                            </div>
                            <!-- row -->
                            <div class="row row-pad-5">
                                <div class="col-lg-4">
                                    <input type="text" name="" placeholder="联系人" class="form-control"   />
                                </div>

                                <div class="col-lg-4">
                                    <input type="text" name="" placeholder="收件联系号码" class="form-control"   />
                                </div>
                                <div class="col-lg-4">
                                    <input type="text" name="" placeholder="受理方ID" class="form-control"   />
                                </div>

                            </div>
                            <!-- row -->
                            <div class="row row-pad-5">
                                <div class="col-lg-4">
                                    <label class="control-label">受理时间段</label>
                                </div>
                                <div class="col-lg-4">
                                    <input id="meeting" type="date" class="form-control input-sm"/>
                                </div>


                                <div class="col-lg-4">
                                    <input id="meeting" type="date" class="form-control input-sm"/>
                                </div>

                            </div>
                            <!-- row -->
                        </div>
                        <!-- panel-body -->

                    </div>
                    <!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">搜索</button>
                </div>
            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 高级搜索modal -->
<%@include file="/commons/scripts.jsp" %>
<script>
    jQuery(document).ready(function() {

        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });

        // Delete row in a table
        jQuery('.x-cancel-btn').click(function(){
            var ele = $(this);
            var id = ele.closest('tr').find('th:first').find('input:first').val();
            if(isNaN(id)) {
                console.log('id %s not number!', id);
                return;
            }
            var c = confirm("确认取消订单吗？");
            if(c)
                $.post('/order/cancel',{id:id}, function(resp){
                    if(resp.succ) {
                        ele.closest('tr').fadeOut(function () {
                            jQuery(this).remove();
                        });
                    }
                },'json');

            return false;
        });



    });
</script>

</body>
</html>
