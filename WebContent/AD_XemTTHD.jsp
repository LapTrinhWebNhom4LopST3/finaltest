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
   <title>Trang Admin Xem Thông Tin Hội Đồng</title>
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
    <jsp:include page= "HeaderAD.jsp"></jsp:include>
    <sql:setDataSource var ="con" driver ="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8" user="root" password="vothithanhvi"/>
  <sql:query var="tthd" sql="select * from tthoidong" dataSource="${con}"/>
  <div class="container">
                     <div class="row"> 
                    
                     
                       <div class="panel-heading" style="color: #FF0000"><h3>Thông Tin Hội Đồng</h3></div>
                              <div class="panel-body">
                                  <table class="table table-bordered "  id="Thông tin hội đồng">
                                      <thead>
                                       <tr>
                                       <th>STT</th>
                                        <th>Địa Điểm</th>
                                        <th>Từ giờ</th>
                                        <th>Đến giờ</th>
                                        <th>Chủ tịch</th>
                                        <th>Ủy viên 1</th>
                                        <th>Ủy viên 2</th>
                                        <th>Ủy viên 3</th>
                                        <th>Thư Kí</th>
                                        <th>Mã đề tài</th>
                                    </tr>
                               <c:forEach var="rows" items="${tthd.rows}">
                                <tr>
	                             <td>${rows.STT }</td>
	                             <td> ${rows.DiaDiem}</td>
	                             <td> ${rows.StartTime}</td>
	                             <td> ${rows.EndTime }</td>
	                             <td> ${rows.ChuTich }</td>
	                             <td> ${rows.UyVien1 }</td>
	                              <td> ${rows.UyVien2 }</td>
	                               <td> ${rows.UyVien3}</td>
	                                <td> ${rows.ThuKy }</td>
	                                 <td> ${rows.TenDeTai }</td>
	                       </tr>
                         </thead>
                           </c:forEach>
            <tbody>
              <tr>

            </tbody>
          </table>
        </div>
</div>
</body>
</html>