<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>   
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8"
                           user="root"  password="vothithanhvi"/>
	<div class="generic-container">
		
		 <div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Danh Sách Đề Tài</span>
			</div>
			
			<div class="tablecontainer">
				<table class="table table-hover" name="dsgv">
					<thead>
						<tr>
							<th>Tên đề tài</th>
							<th>GVHD</th>
						</tr>

						<%
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
							String data= request.getParameter("data");
							Statement stmt = conn.createStatement();
							String sql = "Select  * from detai  where ChuyenNganh='"+data+"' ";
							ResultSet rs1 = stmt.executeQuery(sql);
							System.out.println(data);
							 System.out.println(sql);
							while (rs1.next()) {
						%>
						<tr>
							<td><%=rs1.getString("TenDeTai")%></td>
							<td><%=rs1.getString("GVHD")%></td>

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
</body>
</html>