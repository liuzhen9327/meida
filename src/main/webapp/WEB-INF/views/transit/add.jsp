<%@ page import="com.meida.model.Order" %>
<%@ page import="com.meida.model.OriginalLogistic" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meida.utils.StringUtils" %>
<%@ page import="com.meida.model.Express" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16/1/7
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>添加中转信息</title>
    <%@include file="/commons/links.jsp" %>
    <link href="/css/jquery.gritter.css" rel="stylesheet">
    <style>
        .tr{background:#0C9;}
    </style>

</head>

<body>
<section>

    <%@include file="/commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="/commons/headerBar.jsp" %>
<%Order order = (Order) request.getAttribute("order");
List<OriginalLogistic> originalLogisticList = (List<OriginalLogistic>) request.getAttribute("originalLogisticList");
List<Express> expressList = (List<Express>) request.getAttribute("expressList");
%>
        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>订单信息 <span>Meida</span></h2>
        </div>
        <div class="contentpanel">

            <!-- 添加中转信息Modal -->
            <div class="panel">
                <form id="" action="" class="form-horizontal">
                    <div class="modal-header">
                        <h4>待发邮件：<%=originalLogisticList.size()%>件 总重量<span id="totalWeight"></span>KG</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row row-pad-5">
                                    <div class="col-lg-4">
                                        <select id="cbfs" class="select2"  data-placeholder="选择分发方式" required>
                                            <option value=""></option>
                                            <option value="1">原包拆包</option>
                                            <option value="2">原包转发</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-8"><code>"原包拆包"可以对应多个中转单号<br/>
                                        "原包转发"只可以对应一个中转单号</code></div>
                                </div>

                                <!--拆包row-->
                                <div id="cb" class="panel-body-nopadding hide">
                                    <div  class="row row-pad-5 ">
                                        <div class="col-lg-4">
                                            <select id="select_original_number"  class="select2"  data-placeholder="选择原始单号" required>
                                                <option value=""></option>
                                                <%for (OriginalLogistic originalLogistic : originalLogisticList){%>
                                                    <option value="<%=originalLogistic.get(OriginalLogistic.id)%>" remark="<%=StringUtils.getStr(originalLogistic.get(OriginalLogistic.remark))%>" weight="<%=originalLogistic.get(OriginalLogistic.weight)%>"><%=originalLogistic.get(OriginalLogistic.name)%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- row -->
                                    <div class="table-responsive">
                                        <table  class="table table-success mb30 ">
                                            <thead>
                                            <tr>
                                                <th><button id="add_btn" type="button" class="btn btn-white btn-xs hide" data-toggle="modal" data-target="#add_transit"><i class="fa fa-plus"></i></button></th>
                                                <th>收件信息</th>
                                                <th>中转物流信息</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="x-unpack-list">
                                            <!--
                                            <tr>
                                                <th>1</th>
                                                <th>吴昊,1882323237,湖南省长沙市雨花区曙光路22号</th>
                                                <th>中通-23879322328-40KG</th>
                                                <th><button type="button" class="btn btn-white btn-xs delete-row" ><i class="fa  fa-trash-o"></i></button></th>
                                            </tr>
                                            -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--原包转发-->
                                <div id="yb" class="panel-body-nopadding hide">
                                    <div class="table-responsive">
                                        <table class="table table-hover XTableList" id="table2">
                                            <thead>
                                            <tr style="background:#1CAF9A;">
                                                <th ><div class="ckbox ckbox-success">
                                                    <input type="checkbox" class="XTableCheckAll" id="x_select_all"/>
                                                    <label for="x_select_all" style="color:#FFF;">全选/取消&nbsp;</label>
                                                </div></th>
                                                <th><label style="color:#FFF;">收件人信息</label></th>
                                                <th><label style="color:#FFF;">物流信息</label></th>
                                                <th><label style="color:#FFF;">&nbsp;客户备注&nbsp;</label></th>
                                                <th></th>

                                            </tr>
                                            </thead>
                                            <tbody class="x-forward-list">
                                            <%int j=1;double totalWeight = 0d;
                                                for (OriginalLogistic originalLogistic : originalLogisticList){
                                                    totalWeight += originalLogistic.getBigDecimal(OriginalLogistic.weight).doubleValue();
                                            %>
                                                <tr>
                                                    <th><div class="ckbox ckbox-success">
                                                        <input type="checkbox" class="XTableCheckItem" id="checkbox<%=j%>" value="<%=originalLogistic.get(OriginalLogistic.id)%>"/>
                                                        <label for="checkbox<%=j%>"><%=j%></label>
                                                    </div></th>
                                                    <th><%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.receiver))%>,
                                                        <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.mobile))%>,
                                                        <%=StringUtils.cutStr(StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.address)), 44, Constant.CUT_FILL_STR)%></th>
                                                    <th class="wldh"><%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.name))%>-
                                                        <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.number))%>-
                                                        <%=StringUtils.getStr(originalLogistic.getStr(OriginalLogistic.weight))%>KG</th>
                                                    <th><%=originalLogistic.get(OriginalLogistic.remark) == null ? "": "<button type=\"button\" class=\"info btn btn-white btn-xs\"><i class=\"fa fa-info\"></i></button>\n" +
                                                            "<input type=\"hidden\" class=\"field_name\" value=\""+originalLogistic.get(OriginalLogistic.remark)+"\">"%></th>
                                                    <th><%--<button type="button" class="btn btn-white btn-xs delete-row" id="khinfo"><i class="fa  fa-trash-o"></i></button>--%>
                                                    </th>
                                                </tr>
                                            <%j++;}%>
                                            </tbody>

                                        </table>
                                    </div><!-- table-responsive -->


                                    <div class="row row-pad-5">
                                        <div class="col-lg-4">
                                            <select id="sjrxx" class="select2"  data-placeholder="收件人信息" required>
                                                <option class="1" value=""></option>
                                                <option class="1" value="qt">其他地址</option>
                                                <option class="1" value="1">胡浩,188982323238,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</option>
                                                <option class="1" value="1">胡浩,188982323238,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</option>
                                                <option  class="1"value="1">胡浩,188982323238,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <select  class="select2"  data-placeholder="* 物流公司" required>
                                                <option  value=""></option>
                                                <option  value="">EMS</option>
                                                <option  value="">顺丰</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="name" placeholder="* 物流单号" class="form-control"  required/>
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="text" name="name" placeholder="* 邮件重量（KG）" class="form-control"  required/>
                                        </div>
                                        <div id="new_address" class="row row-pad-5 hide">
                                            <div class="col-lg-4">
                                                <input type="text" name="name" placeholder="* 收件人" class="form-control"  required/>
                                            </div>
                                            <div class="col-lg-4">
                                                <input type="phone" name="phone" placeholder="* 联系号码" class="form-control"  required/>
                                            </div>
                                            <div class="panel">
                                                <textarea class="form-control" rows="5" placeholder="* 详细联系地址"></textarea>
                                            </div>
                                        </div>

                                        <!--row-->
                                    </div>
                                </div>
                                <!-- panel -->

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" ><i class="fa fa-print"></i>&nbsp;打印地址单</button>
                                <button type="submit" class="btn btn-primary">发货</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <!-- contentpanel -->

    </div>
    <!-- mainpanel -->
<input id="orderId" value="<%=order.get(Order.id)%>"/>
</section>
<!-- 添加中转信息Modal -->
<div class="modal fade" id="add_transit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="add_transit_form" action="" class="form-horizontal">
        <input name="orderId" type="hidden"/>
        <input name="originalId" type="hidden"/>
        <input name="transitType" type="hidden"/>
        <input name="originalNumber" type="hidden"/>


        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加地址信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row row-pad-5">
                                <div class="col-lg-4">
                                    <select id="select_contact_info" class="select2" name="contactInfo" data-placeholder="收件人信息" required>
                                        <option value=""></option>
                                        <option value="qt">其他地址</option>
                                        <%for (OriginalLogistic originalLogistic : originalLogisticList){%>
                                        <option value="<%=originalLogistic.get(OriginalLogistic.receiver)%>,<%=originalLogistic.get(OriginalLogistic.mobile)%>,<%=originalLogistic.get(OriginalLogistic.address)%>" ><%=originalLogistic.get(OriginalLogistic.receiver)%>,<%=originalLogistic.get(OriginalLogistic.mobile)%>,<%=originalLogistic.get(OriginalLogistic.address)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-lg-4"> </div>
                                <div class="col-lg-4"> 总重量:<span id="weight"></span>KG </div>
                            </div>
                            <!-- row -->
                            <div id="new_address2" class="row row-pad-5 hide">
                                <div class="col-lg-4">
                                    <input type="text" name="receiver" placeholder="* 收件人" class="form-control"  required/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="mobile" placeholder="* 联系号码" class="form-control"  required/>
                                </div>
                                <div class="panel">
                                    <textarea name="address" class="form-control" rows="5" placeholder="* 详细联系地址"></textarea>
                                </div>
                            </div>

                            <!--row-->
                            <div  class="row row-pad-5 ">
                                <div class="col-lg-4">
                                    <select class="select2" name="name" data-placeholder="物流公司" required>
                                        <option class="" value=""></option>
                                        <%for (Express express: expressList){%>
                                        <option value="<%=express.getStr(Express.code)%>"><%=express.getStr(Express.name)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="number" placeholder="* 物流单号" class="form-control"  required/>
                                </div>
                                <div class="col-lg-4">
                                    <input name="weight" class="form-control" rows="5" placeholder="* 邮件重量（KG）" required/>
                                </div>
                            </div>

                            <!--row-->

                            <textarea name="remark" class="form-control" rows="5" placeholder="备注信息"></textarea>
                        </div>
                        <p class="text-danger x-err-msg hide"></p>
                        <!-- panel-body -->

                    </div>
                    <!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" ><i class="fa fa-print"></i>&nbsp;打印地址单</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </form>
</div>
<!-- 添加中转信息modal -->
<%@include file="/commons/scripts.jsp" %>
<script src="//cdn.bootcss.com/jquery.form/3.51/jquery.form.min.js"></script>
<script src="/js/jquery.gritter.min.js"></script>
<script src="/js/XTableList.js"></script>
<script src="/js/transit/add.js"></script>
<script>$('#totalWeight').text('<%=totalWeight%>')</script>
</body>
</html>
