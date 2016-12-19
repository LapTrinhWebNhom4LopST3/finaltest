<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                
  <div class="col-md-6 col-md-offset-3  ">
    <div class="row">
      <div class="panel panel-primary">
                <div class="panel-heading">Thông Tin Tài Khoản</div>
                  <div class="panel-body">
                  <h3 class="form-signin-heading" style="text-align: center;">Thông tin tài khoản</h3><br>
                    <div class="row" >
                      <div class="col-md-7 col-md-offset-3">
                          	<table class="table table-hover" name="dsgv">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>

						<%
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
						String user=(String)session.getAttribute("userid");
							Statement stmt = conn.createStatement();
							String sql = "Select  * from user  where uname='"+user+"' ";
							ResultSet rs1 = stmt.executeQuery(sql);
							System.out.println(user);
							 System.out.println(sql);
							while (rs1.next()) {
						%>
						<tr>
						<td>Tên người dùng: </td>
							<td><%=rs1.getString("uname")%></td>
							</tr>
							<tr>
							<td>Email</td>
							<td><%=rs1.getString("email")%></td>
							</tr>
							<tr>
							<td>Ngày đăng kí:</td>
							<td><%=rs1.getString("ngaydk")%></td>
							</tr>
							<tr>
							<td>Loại người dùng:</td>
							<td><%=rs1.getString("role")%></td>

						</tr>
						<%
							}
						%>



					</thead>
								
					</tr>

					
				</table>

                      </div>
                     
                          
                        </div>

                   </div>
                    <br>
                <div class="row">
                  <div class="col-md-3 col-md-offset-1">
                         <a href="GV_DoiMatKhau.jsp" type="submit"><button class="btn btn-info"> Đổi mật khẩu</button></a>

                  </div>
                  <div class="col-md-3 col-md-offset-1">
                           <a href="GV_SuaTTTK.jsp" type="submit"><button class="btn btn-info" > Cập Nhật</button></a>


                  </div>
                  <div class="col-md-3 col-md-offset-1">
                           <a href="SV.jsp" type="submit"><button class="btn btn-info">Trở về</button></a>

                  </div>

                </div>
               
                <br>
              </div>
          </div>
        </div>
  
</body>
</html>