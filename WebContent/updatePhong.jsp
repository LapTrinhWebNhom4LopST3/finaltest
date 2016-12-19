<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>   
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Trưởng Khoa Câp Nhật Phòng</title>
<style>
select{
height: 25px;
width: 250px
}
body {
    background-image: url("img/bkg3.jpg");
    font-family: "Time new roman";
	background-color: #E2E2DC
}
</style>
</head>
<body>
<div class="container">
<div class="well well-lg">
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8"
                           user="root"  password="vothithanhvi"/>
                           
                           
           <sql:query dataSource="${dbsource}" var="result1">
            SELECT * from phong where idphong=?;
            <sql:param value="${param.idphong}" />
        </sql:query>
        
	<% response.setContentType("text/html;charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
			Connection conn;
			Statement stmt;
			ResultSet rs, rs1;
			String query1,query2;
			int idgv,idcn;
			%>
	<form action="" method="get">

	<table class="table table-hover" align="center" width="50%">
	 <c:forEach var="row" items="${result1.rows}">
	<tr align="center">
			<th align="center" bgcolor="indigo" style="color: white" colspan="6"><h1 style="text-align: center">Cập nhật phòng</h1>
		</tr>
	<tr align="right">
	<td>
	<input type="hidden" value="${param.idphong}" name="idphong"/>
	<input type="hidden" value="${row1.TenPhong}" name="phong"/>
	<input  type="hidden" name="ngay"  value="${row.Ngay}"></td>
	</tr>
	<tr align="right">
	
	<td>Từ giờ :</td>
		<td><input class="form-control" value="${row.StartTime}" name="st" type="text" placeholder="hh:mm"></td>
		</tr>
		<tr align="right">
	<td>Tới ::</td>

		<td><input class="form-control"  value="${row.EndTime}" name="et" type="text" placeholder="hh:mm"></td>
	
	</tr>
	<tr align="center">
<th><a href="TK_XemPhong.jsp"><h1>Xem kết quả</h1></a></th>
	
			<td><button type="submit" name="sm" class="btn btn-primary" >Save</button>
			<button type="reset" ng-click="reset()"class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button></td>
	
	<script>
									src = "js/angular.min.js"
									var validationApp = angular.module(
											'validationApp', []);
									validationApp
											.controller(
													'mainController',
													function($scope) {
														$scope.submitform = function() {
															if ($scope.myForm.$valid) {
																alert('May Report finished.');
															}
															$scope.reset = function() {
															
																$scope.ngay = "";
																$scope.st= "";
																$scope.et = "";
															}
															$scope.reset();
														};
													});
								</script>
		  </c:forEach>
	</table>
	
	</form>
	
<%
								if (request.getParameter("sm") != null) {
									request.setCharacterEncoding("UTF-8");
									response.setCharacterEncoding("UTF-8");
										String a =  request.getParameter("phong");
										String b = request.getParameter("ngay");
										String c = request.getParameter("st");
										String d = request.getParameter("et");
									String e1=request.getParameter("idphong");
										System.out.println(a);
										System.out.println(b);
										System.out.println(c);
										System.out.println(d);
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
											Statement st = connection.createStatement();
											String qr=	"update phong set StartTime='"+c+"',EndTime='"+d+"' where idphong='"+e1+"' ";
											System.out.println(qr);
												int i=st.executeUpdate(qr);
												
												%>
												<script>
												alert('Data update success !!!')</script>
												<%
										} catch (Exception e) {
											out.print(e);
											e.printStackTrace();
										}
									} 
								%>
		</div>
		</div>
</body>
</html>