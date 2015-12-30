<%--
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
    <%@include file="../../../commons/links.jsp" %>
    <title>新建订单</title>
</head>

<body>

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>
<section>
    <%@include file="../../../commons/leftPanel.jsp" %>

    <div class="mainpanel">

        <%@include file="../../../commons/headerBar.jsp" %>

        <div class="pageheader">
            <h2><i class="fa fa-pencil"></i>物流订单预报单 <span>Meida</span></h2>


        </div>
        <div class="contentpanel">

            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <h4 class="panel-title">订单编号：MD00012878979</h4>

                    </div>
                    <div class="panel-body panel-body-nopadding">

                        <!-- BASIC WIZARD -->
                        <div id="basicWizard" class="basic-wizard">



                            <div class="tab-content">




                                <div class="form-group">
                                    <label class="col-sm-2">物流属性 <span class="asterisk">*</span></label>

                                    <div class="col-sm-2">
                                        <select id="wlsx"  class="select2"  data-placeholder="">

                                            <option value="dl">代理</option>
                                            <option value="zfzz">直发中转</option>
                                            <option value="zd">直达</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="dl" class="form-group">
                                    <label class="col-sm-2">受理方 <span class="asterisk">*</span></label>

                                    <div class="col-sm-2">
                                        <select class="select2" data-placeholder="选择转运受理">
                                            <option value=""></option>
                                            <option value="">携程海贸</option>
                                            <option value="">中外运</option>
                                            <option value="">唯品美达</option>
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
                                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> 添加信息</button></th>
                                                <th><label class="fj_text_c">收件信息</label></th>
                                                <th><label class="fj_text_c">物流信息</label></th>
                                                <th><label class="fj_text_c">备注信息</label></th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><a data-content="吴昊,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">吴昊,18877687766,广东省广州市白云区三元里大...</a></td>
                                                <td>EMS,em99098909kr,19KG</td>
                                                <td><a data-content="帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">帮我发大箱子...</a></td>
                                                <td class="table-action">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-white btn-xs" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil"></i></button>
                                                        <button type="button" class="btn btn-white delete_row btn-xs"><i class="fa fa-trash-o"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><a data-content="吴昊,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">吴昊,18877687766,广东省广州市白云区三元里大...</a></td>
                                                <td>EMS,em99098909kr,19KG</td>
                                                <td><a data-content="帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">帮我发大箱子...</a></td>
                                                <td class="table-action">   <div class="btn-group">
                                                    <button type="button" class="btn btn-white btn-xs" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil"></i></button>
                                                    <button type="button" class="btn btn-white delete_row btn-xs"><i class="fa fa-trash-o"></i></button>
                                                </div> </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td><a data-content="吴昊,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">吴昊,18877687766,广东省广州市白云区三元里大...</a></td>
                                                <td>EMS,em99098909kr,19KG</td>
                                                <td><a data-content="帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">帮我发大箱子...</a></td>
                                                <td class="table-action">   <div class="btn-group">
                                                    <button type="button" class="btn btn-white btn-xs" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil"></i></button>
                                                    <button type="button" class="btn btn-white delete_row btn-xs"><i class="fa fa-trash-o"></i></button>
                                                </div> </td>
                                            </tr>

                                            <tr>
                                                <td>4</td>
                                                <td><a data-content="吴昊,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">吴昊,18877687766,广东省广州市白云区三元里大...</a></td>
                                                <td>EMS,em99098909kr,19KG</td>
                                                <td><a data-content="帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室" data-placement="top" data-toggle="popover" data-container="body" class="popovers current" type="" data-original-title="" title="">帮我发大箱子...</a></td>
                                                <td class="table-action">   <div class="btn-group">
                                                    <button type="button" class="btn btn-white btn-xs" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil"></i></button>
                                                    <button type="button" class="btn btn-white delete_row btn-xs"><i class="fa fa-trash-o"></i></button>
                                                </div></td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div><!-- table-responsive -->
                                </div>

                                <!--多行数据添加-->




                                <div class="panel">
                                    <textarea class="form-control" rows="5" placeholder="订单备注"  required></textarea>
                                </div>

                                <div class="form-group">

                                    <a class="btn btn-default-alt">保存</a>
                                    <a  class="btn btn-primary-alt">订单提交</a>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="basicForm" action="" class="form-horizontal">
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
                                    <input type="text" name="name" placeholder="* 收件人" class="form-control"  required/>
                                </div>
                                <div class="col-lg-4">
                                    <input type="phone" name="phone" placeholder="* 联系号码" class="form-control"  required/>
                                </div>

                                <div class="panel">
                                    <textarea class="form-control" rows="5" placeholder="* 详细联系地址"></textarea>
                                </div>


                                <div class="col-lg-4">
                                    <select class="select2"  data-placeholder="邮件公司">
                                        <option value=""></option>
                                        <option value="EMS">EMS</option>
                                        <option value="顺丰">顺丰</option>
                                        <option value="中通">中通</option>

                                        <option value="申通">申通</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <input type="wlnub" name="wlub" placeholder="邮件编号" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <input type="kg" name="kg" placeholder="邮件重量（KG）" class="form-control" />
                                </div>
                            </div><!-- row -->
                            <textarea class="form-control" rows="5" placeholder="备注信息"></textarea>
                        </div><!-- panel-body -->


                    </div><!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>

            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </form>
</div>
<!-- 添加modal -->
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
                            </div><!-- row -->
                            <textarea class="form-control" rows="5" placeholder="备注信息">中转仓地址：李文.21983908012.广州市白云区石井镇22号。帮我发大号箱子一起发走，剩下的发另外一个地址：胡丽,18877687766,广东省广州市白云区三元里大道北马路对面22号云峰酒店2楼302室</textarea>
                        </div><!-- panel-body -->


                    </div><!-- panel -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>

            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </form>
</div>
<!-- 修改modal -->
</body>
<%@include file="../../../commons/scripts.jsp" %>
<script>
    jQuery(document).ready(function() {

        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });


//选择直达后隐藏受理方控件
        jQuery('#wlsx').change(function(){

            if($(this).val()=="zd"){$('#dl').addClass('hide');}else{

                $('#dl').removeClass('hide');
            };
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
</html>
