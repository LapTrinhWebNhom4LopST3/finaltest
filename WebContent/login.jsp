<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="java.sql.*" %>
<%
   
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    String qn= request.getParameter("box");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8",
            "root", "vothithanhvi");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where uname='" + userid + "' and pass='" + pwd + "'and role='"+ qn +"'");
    if (rs.next()) {
    	
        session.setAttribute("userid", userid);
        session.setAttribute("pass", pwd);
        if(qn.equals("sv")){
     	  /*  RequestDispatcher rd=request.getRequestDispatcher("SV.jsp");  
	            rd.forward(request,response);  */
        	response.sendRedirect("SV.jsp");
        } else if(qn.equals("gv")){
     	  /*  RequestDispatcher rd=request.getRequestDispatcher("GV.jsp");  
	            rd.forward(request,response);  */
        	response.sendRedirect("GV.jsp");
        }else if(qn.equals("tk-tbm")){
     	/* RequestDispatcher rd=request.getRequestDispatcher("TK_SapXep.jsp");  
	            rd.forward(request,response);  */
        	response.sendRedirect("TK_SapXep.jsp");
	            
        }else{
	            response.sendRedirect("ADprofile.jsp");
        }
       
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    

    }
%>
