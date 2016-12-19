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
   <title>Trang Sinh Viên</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="img/logo.PNG" type="image/x-icon" />
    <link rel="shortcut icon" href="img/logo.PNG"/>

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
<jsp:include page= "HeaderSV.jsp"></jsp:include>
<sql:setDataSource var ="con" driver ="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8" user="root" password="vothithanhvi"/>
 <sql:query var="ttkl" sql="select * from detai" dataSource="${con}"/>
  <sql:query var="tthd" sql="select * from tthoidong" dataSource="${con}"/>
 <div class="container">
   <div class="row">
      <div class="col-md-12">
         <!-- <div class="panel panel-default"> -->
         <div class="panel panel-primary">
            <div class="panel-heading">Thông Tin Khóa Luận</div>
              <div class="panel-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
               
                  
                      <th>Tên  Sinh Viên</th>
                      <th>Mã Số Sinh Viên
                      </th>
                        <th>Tên Đề Tài</th>
                      <th>Giáo Viên Hướng Dẫn</th>  
                      <th>Chuyên Ngành</th>
                      <c:forEach var="rows" items="${ttkl.rows}">
                   <tr>
	                           
	                            
	                             <td> ${rows.TenSV }</td>
	                              <td> ${rows.MSSV }</td>
	                             
	                             <td> ${rows.TenDeTai}</td>
	                             <td> ${rows.GVHD }</td>
	                             <td> ${rows.ChuyenNganh }</td>
	                             
	                       </tr>
                         </thead>
                           </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
        </div> 
<!-- thong tin hoi dong -->
<div class="container"> 
  <div class="col-md-12">
       <!--  <div class="panel panel-default"> -->
       <div class="panel panel-primary">
            <div class="panel-heading">Thông Tin Hội Đồng</div>
                <div class="panel-body">
                    <table class="table table-bordered">
                          <thead>
                             <tr>
                             			   <th>Địa Điểm</th>
                             			   <th>Ngày</th>
                                        <th>Từ giờ</th>
                                        <th>Đến giờ</th>
                                        <th>Chủ tịch</th>
                                        <th>Ủy viên 1</th>
                                        <th>Ủy viên 2</th>
                                        <th>Ủy viên 3</th>
                                        <th>Thư Kí</th>
                                 
                                  </tr>
                               <c:forEach var="rows" items="${tthd.rows}">
                                <tr>
	                         
	                             
	                            <td> ${rows.DiaDiem}</td>
	                             <td> ${rows.Ngay}</td>
	                             <td> ${rows.StartTime}</td>
	                             <td> ${rows.EndTime }</td>
	                             <td> ${rows.ChuTich }</td>
	                             <td> ${rows.UyVien1 }</td>
	                              <td> ${rows.UyVien2 }</td>
	                               <td> ${rows.UyVien3}</td>
	                                <td> ${rows.ThuKy }</td>
	                              
	                       </tr>
                         </thead>
                           </c:forEach>
                    </table>
                </div>
        </div>
  </div>
</div>

    </div>
    </div>
</body>
</html>