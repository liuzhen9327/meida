<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="../../../commons/links.jsp" %>
	<title>地址列表</title>
</head>

<body>

<section>
  
  <%@include file="../../../commons/leftPanel.jsp" %>
  
  <div class="mainpanel">
    
    <%@include file="../../../commons/headerBar.jsp" %>
    <div class="pageheader">
      <h2><i class="fa fa-table"></i> 地址列表 <span>Meida</span></h2>
  
    </div>
    
    <div class="contentpanel">
      

      
      <div class="row">
  
      <div class="panel panel-default">
         <div class="panel-heading">
          
          <h3 class="panel-title"><a href="<%=request.getContextPath()%>/address/add">点击新建地址信息</a></h3>
         
        </div>
        <div class="panel-body">
          <h5 class="subtitle mb5"></h5>
          
          <br />
          <div class="col-md-6">
          <h5 class="subtitle mb5">Table With Actions</h5>
          <p class="mb20">An example of table with actions in every rows.</p>
          <div class="table-responsive">
          <table class="table mb30">
            <thead>
              <tr>
                <th>序号</th>
                <th>收件姓名</th>
                <th>联系方式</th>
                <th>联系地址</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td class="table-action">
                  <a href="new_address.html"><i class="fa fa-pencil"></i></a>
                  <a href="" class="delete-row"><i class="fa fa-trash-o"></i></a>
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td class="table-action">
                  <a href=""><i class="fa fa-pencil"></i></a>
                  <a href="" class="delete-row"><i class="fa fa-trash-o"></i></a>
                </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td class="table-action">
                  <a href=""><i class="fa fa-pencil"></i></a>
                  <a href="" class="delete-row"><i class="fa fa-trash-o"></i></a>
                </td>
              </tr>
            </tbody>
          </table>
          </div><!-- table-responsive -->
        </div><!-- col-md-6 --><!-- table-responsive -->
          
          
          
        </div><!-- panel-body -->
      </div><!-- panel -->
        
    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
</section>

</body>
<%@include file="../../../commons/scripts.jsp" %>

<script>
  jQuery(document).ready(function() {
    "use strict";
    // Delete row in a table
    jQuery('.delete-row').click(function(){
      var c = confirm("Continue delete?");
      if(c)
        jQuery(this).closest('tr').fadeOut(function(){
          jQuery(this).remove();
        });
        return false;
    });
  });
</script>
</html>
