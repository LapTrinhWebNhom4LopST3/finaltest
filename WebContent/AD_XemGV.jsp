<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="img/logo.PNG" type="image/x-icon" />
<link rel="shortcut icon" href="img/logo.PNG" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
body {
	padding-top: 30px;
}
</style>

 <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                    
                }
            }
        </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="app.js"></script>
<style>
img {
	width: 100%;
	height: auto;
}
</style>
<style>
body {
	background-image: url("img/bkg3.jpg");
}
</style>
</head>
<body>
	<jsp:include page="HeaderAD.jsp"></jsp:include>
	<nav class="navbar navbar col-md-offset-0">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<a href="ADprofile.jsp" class="btn btn-success btn-lg"> <span
			class="glyphicon glyphicon-hand-left"></span> Trở về
		</a>
		<div class="btn-group btn-group-justified" role="group"
			aria-label="abc">
			<div class="btn-group" role="group">
				<a href="AD_XemGV.jsp"><button type="button"
						class="btn btn-info ">Thông tin giảng viên</button></a>
			</div>
			<div class="btn-group" role="group">
				<a href="AD_XemTTDT.jsp"><button type="button"
						class="btn btn-default">Thông tin đề tài</button></a>
			</div>
			<div class="btn-group" role="group">
				<a href="AD_XemPhong.jsp"><button type="button"
						class="btn btn-default">Thông tin phòng</button></a>
			</div>
		</div>
		<br> <br> <br>

		<html ng-app="myApp">
<head>
<title>Xem thông tin giảng viên</title>
<style>
body {
	font-family: "Time new roman";
	background-color: #E2E2DC
}
</style>
<style>
.IDname.ng-valid {
	background-color: lightgreen;
}

.IDname.ng-dirty.ng-invalid-required {
	background-color: red;
}

.IDname.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.work.ng-valid {
	background-color: lightgreen;
}

.work.ng-dirty.ng-invalid-required {
	background-color: red;
}

.work.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.IDSV.ng-valid {
	background-color: lightgreen;
}

.IDSV.ng-dirty.ng-invalid-required {
	background-color: red;
}

.IDSV.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.NameSV.ng-valid {
	background-color: lightgreen;
}

.NameSV.ng-dirty.ng-invalid-required {
	background-color: red;
}

.NameSV.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="app.css">
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8"
                           user="root"  password="vothithanhvi"/>
 <sql:query dataSource="${dbsource}" var="result">
            SELECT * from giangvien ;
        </sql:query>
	<div class="generic-container">
		
		 <div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Danh sách giảng viên </span>
			</div>
			
			<div class="tablecontainer">
				<table class="table table-hover" name="dsgv">
					<thead>
						<tr>
							
						
							<th>Mã Giảng Viên</th>
							<th>Tên Giảng Viên</th>
							<th>Chuyên ngành</th>
							<th><a href="AD_NhapGV.jsp"><button type="submit" class="btn btn-success custom-width">Thêm Giảng Viên</button></a></th>
						</tr>
						    <c:forEach var="row" items="${result.rows}">
                    <tr>
                       
                        <td><c:out value="${row.MaGV}"/></td>
                        <td><c:out value="${row.TenGV}"/></td>
                        <td><c:out value="${row.ChuyenNganh}"/></td>
                        
                        <td><a href="updateGV_AD.jsp?maGV=<c:out value="${row.MaGV}"/>"><button type="submit" class="btn btn-success">Update</button></a>
                        <a href="javascript:confirmGo('Sure to delete this record?','xoaGV.jsp?maGV=<c:out value="${row.MaGV}"/>')"><button type="submit" class="btn btn-success custom-width" scr="TK_XemGV.jsp">Delete</button></a></td>
                         
                    </tr>
                </c:forEach>
					</thead>
								
					</tr>

					
				</table>
			</div>
		</div>
	</div>
</body>
		</html>