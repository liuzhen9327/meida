<%@ page import="com.meida.utils.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<html>--%>
<%--<head>--%>
<%--<title>传excel</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<form action="/so/importExcel" method="post" enctype="multipart/form-data">--%>
<%--<input type="file" name="file"/><button type="submit" value="">确定上传</button>--%>
<%--</form>--%>
<%--<%=StringUtils.getStr(request.getAttribute("msg"))%>--%>
<%--</body>--%>
<%--</html>--%>

<html lang="en">
<head>
    <title>数据上传</title>
    <%@include file="/commons/links.jsp" %>
    <link href="/css/dropzone.css" rel="stylesheet">
</head>

<body class="horizontal-menu">


<section>

    <div class="mainpanel">

        <div class="contentpanel">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns">
                        <a href="" class="minimize">&minus;</a>
                    </div>
                    <h4 class="panel-title">订单记录上传</h4>
                    <p>请预先下载订单模板<a href="<%=ctx%>/download/template">《订单模板》</a>整理好数据再上传，如遇上传失败等异常请联系系统运营方进行调试！ </p>
                    <p>因数据量大，系统将定期一个月即30天清理一次，请务必做好数据备份以免造成损失!<a href="javascript:alert('功能正在开发中..')">《数据备份至本地》</a></p>
                </div>

                <div class="panel-body">

                    <%--<%if (request.getAttribute("msg") != null) {--%>
                        <%--if (request.getAttribute("errCode") == null) {%>--%>
                        <div class="alert alert-success hide">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa  fa-check-circle-o"></i>&nbsp;&nbsp;
                            <strong>
                                <%--<%=StringUtils.getStr(request.getAttribute("msg"))%>.--%>
                            </strong>
                        </div>
                    <%--<%} else {%>--%>
                        <div class="alert alert-danger hide">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa  fa-exclamation-triangle"></i>&nbsp;&nbsp;
                                <strong>
                                    <%--<%=request.getAttribute("msg")%>--%>
                                </strong>&nbsp;&nbsp;
                        </div>
                    <%--<%}--%>
                    <%--}%>--%>
                    <form id="excelForm" action="/so/upload" class="dropzone" enctype="multipart/form-data">
                        <div class="fallback">
                            <input name="file" type="file" multiple/>
                        </div>
                    </form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns">
                        <a href="" class="minimize">&minus;</a>
                    </div>
                    <h4 class="panel-title">页面链接</h4>
                    <p>如有需要展示至第三方平台供客户查询使用，请复制此链接！</p>

                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="readonlyinput">查询页面链接</label>
                        <div class="col-sm-6">
                            <input type="text" value="<%=request.getScheme()+"://"+request.getServerName()+request.getContextPath()%>/so" id="readonlyinput" class="form-control" readonly="readonly" />
                        </div>
                    </div>

                </div>

            </div>

        </div><!--contentpanel-->

    </div><!-- mainpanel -->

</section>


<%@include file="/commons/scripts.jsp" %>
<script src="/js/dropzone.min.js"></script>
<script src="/js/colorpicker.js"></script>



<script>
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone(document.getElementById('excelForm'), { // Make the whole body a dropzone
        url: "/so/upload", // Set the url
//        acceptedFiles: 'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        acceptedFiles: ".xlsx",
    });
    myDropzone.on("addedfile", function(file) {
        if (this.files[1]!=null){
            this.removeFile(this.files[0]);
        }
    });
    myDropzone.on("success", function(file, resp) {
        var tipsdiv = '';
        if (resp.succ) {
            tipsdiv = $('.alert-success');
            tipsdiv.find('strong').text(resp.data);
        }else {
            tipsdiv = $('.alert-danger');
            tipsdiv.find('strong').text(resp.errMsg);
        }
        tipsdiv.removeClass('hide')
        setTimeout(function() {
            tipsdiv.addClass('hide');
        }, 4000)
    });
//    $("#excelForm").dropzone({
//        maxFiles: 2000,
//        url: "/so/upload",
//        addedfile : function() {
//            if (this.files[1]!=null){
//                this.removeFile(this.files[0]);
//            }
//        },
//        success: function(file, resp){
//            var tipsdiv = '';
//            if (resp.succ) {
//                tipsdiv = $('.alert-success');
//                tipsdiv.find('strong').text(resp.data);
//            }else {
//                tipsdiv = $('.alert-danger');
//                tipsdiv.find('strong').text(resp.errMsg);
//            }
//            tipsdiv.removeClass('hide')
//        }
//    });
//    Dropzone.options.myAwesomeDropzone = {
//        accept: function(file, done) {
//            console.log("uploaded");
//            done();
//        },
//        init: function() {
//            this.on("addedfile", function() {
//                if (this.files[1]!=null){
//                    this.removeFile(this.files[0]);
//                }
//            });
//            this.on("success", function(file, resp) {
//                var tipsdiv = '';
//                if (resp.succ) {
//                    tipsdiv = $('.alert-success');
//                    tipsdiv.find('strong').text(resp.data);
//                }else {
//                    tipsdiv = $('.alert-danger');
//                    tipsdiv.find('strong').text(resp.errMsg);
//                }
//                tipsdiv.removeClass('hide')
//            });
//        }
//    };
//    new Dropzone("div#excelForm", {
//        uploadMultiple: true,
//        maxFilesize: 30, // MB
//        acceptedFiles: ".xlsx",
//        accept: function (file, done) {
//            console.log("uploaded");
//            done();
//        },
//        init: function () {
//            this.on("addedfile", function () {
//                if (this.files[1] != null) {
//                    this.removeFile(this.files[0]);
//                }
//            });
//        }
//    });
    jQuery(document).ready(function () {

        "use strict";

        // Tags Input
//        jQuery('#tags').tagsInput({width: 'auto'});

        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });

        // Textarea Autogrow
//        jQuery('#autoResizeTA').autogrow();
//
//        // Color Picker
//        if (jQuery('#colorpicker').length > 0) {
//            jQuery('#colorSelector').ColorPicker({
//                onShow: function (colpkr) {
//                    jQuery(colpkr).fadeIn(500);
//                    return false;
//                },
//                onHide: function (colpkr) {
//                    jQuery(colpkr).fadeOut(500);
//                    return false;
//                },
//                onChange: function (hsb, hex, rgb) {
//                    jQuery('#colorSelector span').css('backgroundColor', '#' + hex);
//                    jQuery('#colorpicker').val('#' + hex);
//                }
//            });
//        }
//
//        // Color Picker Flat Mode
//        jQuery('#colorpickerholder').ColorPicker({
//            flat: true,
//            onChange: function (hsb, hex, rgb) {
//                jQuery('#colorpicker3').val('#' + hex);
//            }
//        });
//
//        // Date Picker
//        jQuery('#datepicker').datepicker();
//
//        jQuery('#datepicker-inline').datepicker();
//
//        jQuery('#datepicker-multiple').datepicker({
//            numberOfMonths: 3,
//            showButtonPanel: true
//        });
//
//        // Spinner
//        var spinner = jQuery('#spinner').spinner();
//        spinner.spinner('value', 0);
//
//        // Input Masks
//        jQuery("#date").mask("99/99/9999");
//        jQuery("#phone").mask("(999) 999-9999");
//        jQuery("#ssn").mask("999-99-9999");
//
//        // Time Picker
//        jQuery('#timepicker').timepicker({defaultTIme: false});
//        jQuery('#timepicker2').timepicker({showMeridian: false});
//        jQuery('#timepicker3').timepicker({minuteStep: 15});


    });
</script>
</body>
</html>
