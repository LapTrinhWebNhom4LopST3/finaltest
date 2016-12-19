<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8"
                           user="root"  password="vothithanhvi"/>
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM user
            WHERE id='${param.id}'
        </sql:update>
        <c:if test="${count>=1}">
                          <%  RequestDispatcher view = request.getRequestDispatcher("/ADprofile.jsp");
                 view.forward(request, response);%> 
                 
                     
        </c:if>
    </body>
</html>