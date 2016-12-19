<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>   
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<div class="generic-container">
	
			
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>

					<%
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
						String data = request.getParameter("data");
						Statement stmt = conn.createStatement();
						String sql = "Select  * from phong  where TenPhong='" + data + "' ";
						ResultSet rs1 = stmt.executeQuery(sql);
						System.out.println(data);
						System.out.println(sql);
						while (rs1.next()) {
					%>
						<h4>Từ giờ  : <%=rs1.getString("StartTime")%> 	&nbsp;	 &nbsp;&nbsp;	Đến giờ  : <%=rs1.getString("EndTime")%></h4>
					<%
						}
					%>
				</thead>							
				</table>
			</div>
		</div>
	
</body>
</body>
</html>