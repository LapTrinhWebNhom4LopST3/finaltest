<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery-3.1.0.min.js"></script>    
    <script src="js/bootstrap.min.js"></script>    
   <title>Trang Admin</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="img/logo.PNG" type="image/x-icon" />
    <link rel="shortcut icon" href="img/logo.PNG"/>
 <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                    
                }
            }
        </script>
  <style>
img {
    width: 100%;
    height: auto;
}
body {
    background-image: url("img/bkg2.jpg");
}
</style>
</head>
<body>
    <jsp:include page= "HeaderAD.jsp"></jsp:include>
    <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8?useUnicode=true&characterEncoding=UTF-8"
                           user="root"  password="vothithanhvi"/>
 <sql:query dataSource="${dbsource}" var="result">
            SELECT * from user ;
        </sql:query>
    <div class="item col-md-3 col-sm-3 col-xs-6">
            <a href="#" class="list-group-item active"><span>Dành cho Admin</span></a>
                <a href="AD_TaoTaiKhoan.jsp" ><h class="list-group-item" style="color:blue">Thêm tài khoản</h></a>
                <a href="AD_XemTTHD.jsp" ><h class="list-group-item" style="color:blue">Xem thông tin hội đồng</a>
                <a href="AD_XemTTDT.jsp" ><h class="list-group-item" style="color:blue">Nhập thông tin</h></a>                         
                    <a href="index.jsp" ><h class="list-group-item" style="color:blue">Đăng xuất</h> </a>         
         </div>
          
           <div class="col-md-9">
             <div class="panel panel-primary">
             
                   <!-- <div id="panel1" style="border:1px solid black;height:500px;overflow:scroll"> --> 
                       <div class="panel-heading" style="color: while"><h3>Danh sách tài khoản</h3></div>
                                        <div class="row">
                             <div class=" col-md-12"> 
                      <table class="table table-bordered">
                          <thead>
                              <tr>
                                
                                <th>Tên tài khoản</th>
                                <th>Loại tài khoản</th>
                                <th>Email</th>
                                <th>Ngày tham gia</th>
                            
                             
                              </tr>
                   
                      
                    
                              <c:forEach var="row" items="${result.rows}">
                    <tr>
                       
                        <td><c:out value="${row.uname}"/></td>
                        <td><c:out value="${row.role}"/></td>
                        <td><c:out value="${row.email}"/></td>
                        <td><c:out value="${row.ngaydk}"/></td>
                     
                        
                        <td> <a href="javascript:confirmGo('Sure to delete this record?','deleteTaiK.jsp?id=<c:out value="${row.id}"/>')"><button type="submit" class="btn btn-success custom-width" scr="ADprofile.jsp">Delete</button></a></td>
                         
                    </tr>
                </c:forEach>
                       
                             </thead>
                        
                         
                    </table>
                    </div>
                  </div>
                

<br><br><br><br><br><br><br><br><br><br>
 <footer>
      <div class="container">
        <div class="footer-info text-center">
          <br>
          <br>
          <br>
          <br>
          <footer><h style="color:white"> .............Lập Trình Web..........</footer>         
        </div>
      </div>
    </footer>
</body>
</html>