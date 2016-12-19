<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery-3.1.0.min.js"></script>    
    <script src="js/bootstrap.min.js"></script>    
   <title>Trang Trưởng khoa tìm kiếm</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="img/logo.PNG" type="image/x-icon" />
    <link rel="shortcut icon" href="img/logo.PNG"/>
<script>
var validationApp = angular.module('validationApp', []);

  validationApp.controller('mainController', function($scope) {
     
    $scope.submitForm = function() {
      if ($scope.userForm.$valid) {
        alert('May Report finished.');
      }

    };

  });
</script>
  <style>
img {
    width: 100%;
    height: auto;
}
body {
    background-image: url("img/bkg3.jpg");
}
</style>
</head>
<body>
<jsp:include page= "HeaderTK.jsp"></jsp:include>
<sql:setDataSource var ="con" driver ="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8?useUnicode=true&characterEncoding=UTF-8" user="root" password="vothithanhvi"/>

  <sql:query var="tthd" sql="select * from tthoidong" dataSource="${con}"/>
  <div class="container">
          <div class="row">
             <!-- <div class="col-md-2"></div>
              <div class="col-md-8">-->
             <div class="btn-group btn-group-justified" role="group" aria-label="abc">
                                 <div class="btn-group" role="group">
                                   <a href="TK_NhapTTGV.jsp"> <button type="button"  class="btn btn-default" >Nhập/Xem thông tin</button></a>
                                </div>
                                <div class="btn-group" role="group">
                                  <a href="TK_SapXep.jsp">  <button type="button" class="btn btn-default">Sắp xếp hội đồng</button></a>
                                </div>
                                <div class="btn-group" role="group">
                                    <a href="TK_TimKiem.jsp"> <button type="button" class="btn btn-info">Tìm kiếm hội đồng
                                             </button></a> 
                                </div>
              </div><br>

           
            <div class="row">
                  <form method="post" name="frm" action="SearchTK">
                            <div class="row">
                 <div class=" col-md-offset-3 col-md-2"> 
                         <label class=>Tìm theo </label>
                    </div>
                    <div class="col-md-2" >
                        <select class="form-control " name="timtheo" onchange="onCBChange(this);">
                            <option value="tgv" name="timtheo">Tên GV</option>
                            <option value="dd" name="timtheo">Địa điểm</option>
                            <option value="td" name="timtheo">Thời điểm</option>
                        </select>
                    </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="noidungtim" id="noidungtim" >
                  </div>
                   <div>
                     <button type="submit" id="btnTim" value="SearchTK"> Tìm kiếm </button>
                  </div>
            </div>
            </form>
            
            <br>
            <br>
               <div class="well well-lg">               
                                  <table class="table table-bordered "  id="tthd">
                                      <thead>
                                       <tr>
                                        <th>STT</th>
                                        <th>Địa Điểm</th>
                                          <th>Ngày</th>
                                        <th>Từ giờ</th>
                                        <th>Đến giờ</th>
                                        <th>Chủ tịch</th>
                                        <th>Ủy viên 1</th>
                                        <th>Ủy viên 2</th>
                                        <th>Ủy viên 3</th>
                                        <th>Thư Kí</th>
                                        <th>Tên đề tài</th>
                                      
                                  </tr>
                                         <c:forEach var="rows" items="${tthd.rows}">
                                <tr>
	                             <td>${rows.STT }</td>
	                             <td> ${rows.DiaDiem}</td>
	                             <td> ${rows.Ngay}</td>
	                             <td> ${rows.StartTime}</td>
	                             <td> ${rows.EndTime }</td>
	                             <td> ${rows.ChuTich }</td>
	                             <td> ${rows.UyVien1 }</td>
	                              <td> ${rows.UyVien2 }</td>
	                               <td> ${rows.UyVien3}</td>
	                                <td> ${rows.ThuKy }</td>
	                                
	                                 <td> ${rows.TenDeTai }</td>
	                                 
	                       </tr>
                       
                           </c:forEach>
                                      </thead>
                                      <%
                int count = 0;
                String color = "#013ADF";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#81DAF5";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
          <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(10)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                <td><%=pList.get(8)%></td>
                <td><%=pList.get(9)%></td>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
                                      
                                </table>
                                
                              </div>
                           </div>
                              

                
                </div>
                </div>
                <br><br>
               
                    
          
              <div class="col-md-2"></div>

     
</body>
</html>