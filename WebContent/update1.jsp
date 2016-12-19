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
<title>TK_Nhập đề tài</title>
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
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from detai;
        </sql:query>
           <sql:query dataSource="${dbsource}" var="result1">
            SELECT * from detai where idDT=?;
            <sql:param value="${param.idDT}" />
        </sql:query>
        <sql:query dataSource="${dbsource}" var="chuyennganh">
            SELECT * from chuyennganh;
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
			<th align="center" bgcolor="indigo" style="color: white" colspan="6"><h1 style="text-align: center">Thêm đề tài</h1>
		</tr>
		

	
	<tr align="right">
	<SCRIPT type="text/javascript">
			$(document).ready(
					function() {
						$('#chonChuyenNganh').change(
								function() {
									var TenCN = this.value;
									//alert(TenCN);
									$.get('ChuyenNganh_GV', {
										CN : TenCN
									}, function(response) {

										var select = $('#gv');
										select.find('option').remove();
										$.each(response, function(key, value) {
											$('<option>').val(key).text(value)
													.appendTo(select);
										});
									});
								});
					});
									</SCRIPT>
	<td>Chuyên ngành</td>
<td>
	<select class="form-control" id="chonChuyenNganh"	name="chonChuyenNganh">
						<option value="-1">Chọn Chuyên Ngành</option>
						<c:forEach var="row1" items="${chuyennganh.rows}">
							<option value="${row1.TenCN }"><c:out
									value="${row1.TenCN }"></c:out>
							</option>
						</c:forEach>
					</select>
	</td>
	</tr>
	<tr align="right">
	<td>Giảng viên hướng dẫn</td>
	<td><select class="form-control" id="gv" name="gv">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>
	<tr align="right">
	<td style="width:20%">Tên đề tài</td>
	<td>
	<input type="hidden" value="${param.idDT}" name="idDT"/>
	<input class="form-control" name="tendt"  value="${row.TenDeTai}" type="text" placeholder="Nhập tên đề tài"></td>
	</tr>
	<tr align="right">
	
	<td>Mã số sinh viên:</td>
		<td><input class="form-control" value="${row.MSSV}" name="mssv" type="text" placeholder="Nhập mã số sinh viên"></td>
		</tr>
		<tr align="right">
	<td>Tên sinh viên:</td>

		<td><input class="form-control"  value="${row.TenSV}" name="tensv" type="text" placeholder="Nhập tên sinh viên"></td>
	
	</tr>
	<tr align="center">
<th><a href="TK_XemTTDeTai.jsp"><h1>Xem kết quả</h1></a></th>
	
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
															
																$scope.tendt = "";
																$scope.tengv = "";
																$scope.cn = "";
																$scope.mssv = "";
																$scope.tensv = "";
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
										int id=Integer.parseInt(request.getParameter("idDT"));
										String a =  request.getParameter("tendt");
										String b = request.getParameter("gv");
										String c = request.getParameter("chonChuyenNganh");
										String d = request.getParameter("mssv");
										String e1 = request.getParameter("tensv");
										System.out.println(id);
										System.out.println(a);
										System.out.println(b);
										System.out.println(c);
										System.out.println(d);
										System.out.println(e1);
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection connection = DriverManager.getConnection("jdbc:mysql://node1246-nhom4ltw.kilatiron.com:3306/do_an", "root", "vothithanhvi");
											Statement st = connection.createStatement();
											String qr=	"update detai set  TenDeTai='"+a+"', GVHD='"+b+"', ChuyenNganh='"+c+"',MSSV='"+d+"',TenSV='"+e1+"'  where idDT="+id+" ";
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