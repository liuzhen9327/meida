<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>MEIDA微服</title>
    
  <link href="css/bootstrap-editable.css" rel="stylesheet">
  <link href="css/style.default.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.4.1/respond.min.js"></script>
<![endif]-->
</head>

<body>

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
  
  <%@include file="../../commons/leftPanel.jsp" %>  
  
  <div class="mainpanel">
    
    <%@include file="../../commons/headerBar.jsp" %>

    <div class="pageheader">
      <h2><i class="fa fa-home"></i> MEIDA微管理系统 <span>Subtitle goes here...</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="index.html">Bracket</a></li>
          <li class="active">首页</li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">

      <div class="row">

        <div class="col-sm-6 col-md-3">
          <div class="panel panel-success panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">待受理件</small>
                    <h1>70</h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <div class="row">
                  <div class="col-xs-6">
                    <small class="stat-label">国际直邮件</small>
                    <h4><a style="color:#FFF" href="#">13</a></h4>
                  </div>

                  <div class="col-xs-6">
                    <small class="stat-label">国内件</small>
                    <h4><a style="color:#FFF" href="#">13</a></h4>
                  </div>
                  
                  <div class="col-xs-6">
                    <small class="stat-label">中转件</small>
                    <h4><a style="color:#FFF" href="#">13</a></h4>
                  </div>
                </div><!-- row -->
                
              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->

        

        <div class="col-sm-6 col-md-3">
          <div class="panel panel-primary panel-stat">
            <div class="panel-heading">
<div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-user.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">我的地址</small>
                    <h1><a style="color:#FFF" href="address_list.html">13</a></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <div class="row">
                  <div class="col-xs-6">
                    <small class="stat-label">我的地址</small>
                    <h4><a style="color:#FFF" href="address_list.html">13</a></h4>
                  </div>

                  <div class="col-xs-6">
                    <small class="stat-label">我的合作</small>
                    <h4><a style="color:#FFF" href="profile_list_my.html">13</a></h4>
                  </div>
                 
                </div>

              </div>
             <!----  <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">Page Views</small>
                    <h1>300k+</h1>
                  </div>
                </div><!-- row -->

                <!--<div class="mb15"></div>

                <small class="stat-label">% Bounce Rate</small>
                <h4>34.23%</h4>

              </div>-->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->


        <div class="col-sm-6 col-md-3">
          <div class="panel panel-dark panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">我的待妥投件</small>
                    <h1>33</h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <div class="row">
                  <div class="col-xs-6">
                    <small class="stat-label">国内件</small>
                    <h4><a style="color:#FFF" href="#">13</a></h4>
                  </div>

                  <div class="col-xs-6">
                    <small class="stat-label">国际件</small>
                    <h4><a style="color:#FFF" href="#">13</a></h4>
                  </div>
                </div><!-- row -->

              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->
          
      </div><!-- row -->

      <!-- row -->


      

    </div><!-- contentpanel -->

  </div><!-- mainpanel -->

</section>
<%@include file="../../commons/scripts.jsp" %>
</body>
</html>
