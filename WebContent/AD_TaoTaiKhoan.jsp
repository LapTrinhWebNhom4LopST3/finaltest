<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="http://code.angularjs.org/1.2.6/angular.min.js"></script>
   <link rel="stylesheet" href="css/font-awesome.css">
  <style>
#main{margin-left:20px; margin-right:20px;}
#main form input[type=text], #main form input[type=email], #main form input[type=password]{width: 100%;display: inline}</style>
 
</head>
    <title>Ad_TaoTK</title> 
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="img/logo.PNG" type="image/x-icon" />
    <link rel="shortcut icon" href="img/logo.PNG"/>
<head>
<style>
body {
    background-image: url("img/bkg2.jpg");
}
</style>
<style>
img {
    width: 100%;
    height: auto;
}
</style>
<script>
    var demoApp = angular.module('demoApp',[])
    .controller( "RegisterCtrl",['$scope', function($scope) {
        $scope.success=false;
        $scope.register = function(){
            $scope.success=true;
        }
    }]);
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
  
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
            <div class="panel-heading"><h style=color:red>Tạo Tài Khoản</div>
            <div class="panel-body"> 
            <div class="container">
              <div class="form-group">

          <form class="form-horizontal" >  

            <div class="form-group">
               <label for="name" class="col-xs-2 control-label required"><h style=color:blue>Tên tài khoản:</label>
               <div class="col-md-3">
              <input name="name" type="text" class="form-control" placeholder="Tên tài khoản" >
              
              </div>
           </div>        
          <div class="form-group">
             <label for="password" class="col-xs-2 control-label required"><h style=color:blue>Mật khẩu:</label>
             <div class="col-md-3">
            <input name="pass"  type="password" value="" class="form-control" placeholder="Mật khẩu">
           
            </div>
         </div>
      
          <div class="form-group">
               <label for="email" class="col-xs-2 control-label required"><h style=color:blue>Email:</label>
                <div class="col-md-3">
                <input name="email" type="email" class="form-control" placeholder="Email" >
               
      			 </div>

          </div>
           <div class="form-group">
            <label for="time" class="col-xs-2 control-label"><h style=color:blue>Ngày tham gia:</label>
             <div class="col-md-3">
            <input name="time" type="text"  class="form-control" placeholder="yyyy-mm-dd" >
            </div>
         </div>
        
            <div class="form-group">
				  <div class="col-md-2" style="text-align:right;">          
				     <p><h style=color:red>Loại người dùng:</p><br><br>
				     </div>
				     <div class="col-md-5">
				    <div class="row" style="text-align: left ;">
				     <div class="radio">
				            <div class="radio"><br>
				          <label><input type="radio" name="box"id="box1"value="sv" checked="checked">Sinh viên</label></div>
				             <div class="radio">
				            <label><input type="radio" name="box" id="box2"value="gv" >Giảng viên</label></div>
				          <div class="radio">
				          <label><input type="radio" name="box" id="box3"value="tk-tbm">Trưởng khoa/Trưởng bộ môn</label></div>
				          <div class="radio">
				          <label><input type="radio" name="box"id="box4"value="ad">Admin</label></div>
				      </div>                      
				    </div>
				  </div>
				<div class="form-group">
				         <div class="col-md-5 col-md-offset-4">
				        <div class="col-md-2" style="text-align: left;">
				              <button type="submit"  name="submit" class="btn btn-primary" >Đồng ý</button>
				        	</div>
				        	  <div class="col-md-2 col-md-offset-1" style="text-align: center;">
				            <a href="ADprofile.jsp"><button  class="btn btn-primary" ><h style=color:white>Hủy</i></button></a>
				        </div>
				        </div>
				       </div>

     
        </div>
   </form>
   <%	if (request.getParameter("submit") != null) {
										
										String a =  request.getParameter("name");
										String b = request.getParameter("pass");
										String c = request.getParameter("email");
										String d = request.getParameter("time");
										String rl= request.getParameter("box");
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
											Statement st = connection.createStatement();
											 if(rl.equals("sv")){
											int i1 = st.executeUpdate(
													"insert into user (uname,pass,email,ngaydk,role)  values('"+a+"','"+b+"','"+c+"','"+d+"','sv')");
											%>
											<script>
											alert('Tạo tài khoản mới thành công')</script>
											<%
											 } 
											 if(rl.equals("tk-tbm")){
													int i1 = st.executeUpdate(
															"insert into user (uname,pass,email,ngaydk,role)  values('"+a+"','"+b+"','"+c+"','"+d+"','tk-tbm')");
													%>
													<script>
													alert('Tạo tài khoản mới thành công')</script>
													<%
											} 
											 if(rl.equals("gv")){
													int i1 = st.executeUpdate(
															"insert into user (uname,pass,email,ngaydk,role)  values('"+a+"','"+b+"','"+c+"','"+d+"','gv')");
													%>
													<script>
													alert('Tạo tài khoản mới thành công')</script>
													<%
											} 
											 if(rl.equals("ad")){
													int i1 = st.executeUpdate(
															"insert into user (uname,pass,email,ngaydk,role)  values('"+a+"','"+b+"','"+c+"','"+d+"','ad')");
													%>
													<script>
													alert('Tạo tài khoản mới thành công')</script>
													<%
											} 
										} catch (Exception e) {
											out.print(e);
											e.printStackTrace();
										}
									}
								%>

</div>
  
       </div>
  </div>
</div>
	</div>
	</div>					
</body>
</html>