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
       <script src="js/angular.min.js"></script>
        <title>GV_DoiMatKhau</title> 
    
   <style>
#main{margin-left:20px; margin-right:20px;}
#main form input[type=text], #main form input[type=email], #main form input[type=password]{width: 100%;display: inline}
</style>
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
<jsp:include page= "HeaderGV.jsp"></jsp:include>
 <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="panel panel-default">
            <div class="panel-heading"><h style=color:red>Đổi mật khẩu</h></div>
            <div class="panel-body">
              <div class="container">
               <div class="form-group">
                   
                  <form class="form-horizontal" >  
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
               	      <div class="form-group">
                           <label class="col-xs-2 control-label "><h style=color:blue>Mật khẩu cũ:</h></label>
                           <div class="col-md-3">
                          <input name="passcu"  type="password"  class="form-control" placeholder="Mật khẩu cũ" >
                          
                          </div>
                       </div>
                       <div class="form-group">
                           <label for="password1" class="col-xs-2 control-label required"><h style=color:blue >Mật khẩu mới:</h></label>
                           <div class="col-md-3">
                          <input name="pass1"  type="password"  class="form-control" placeholder="Mật khẩu mới" >
                         
                          </div>
                       </div>
                       <div class="form-group">
                           <label  class="col-xs-2 control-label required"><h style=color:blue>Nhập lại mật khẩu mới:</h></label>
                           <div class="col-md-3">
                          <input name="pass2"  type="password"  class="form-control" placeholder="Nhập lại mật khẩu mới" >
                            <input name="uname"  type="hidden" value="<%=rs1.getString("uname")%>" class="form-control" placeholder="Nhập lại mật khẩu mới" >
                           	<input type="hidden" class="form-control" name="id"  value="<%=rs1.getString("id")%>">
							<input type="hidden" name="email" value="<%=rs1.getString("email")%>" placeholder="mail"  >
                            <input  type="hidden" name="ngaydk" value="<%=rs1.getString("ngaydk")%>" class="form-control" placeholder="Email"  >
                            <input type="hidden" name="role" value="<%=rs1.getString("role")%>" placeholder="role"  >
                          
                          </div>
                       </div>
                     <div class="form-group">
                             <div class="col-md-2 col-md-offset-3">
                            <div class="col-md-3" style="text-align: left;">
                                <button type="submit" name="dongy" class="btn btn-primary" >Đồng ý</button>
                            </div>
                            </div>
                           <div class="col-md-2 col-md-offset" style="text-align: rignt;">
                               <a href="GV_ThongTinTaiKhoan.jsp"> <button type="submit" class="btn btn-primary" >Hủy</button></a>
                            </div>
            
                           </div>
                                              	<%
							}
						%>
                      
            </form>
          <%
								if (request.getParameter("dongy")!= null) {
									
									String id=request.getParameter("id");
									String passcu=request.getParameter("passcu");
										String a =  request.getParameter("uname");
										String b = request.getParameter("email");
										
										String passmoi1 = request.getParameter("pass1");
										String passmoi2 = request.getParameter("pass2");
										String d = request.getParameter("ngaydk");
										String f = request.getParameter("role");
										String passdb=(String)session.getAttribute("pass");
							               	 
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
											Statement st = connection.createStatement();
											System.out.println(passmoi1);
											System.out.println(passmoi2);
											if(passmoi1.equals(passmoi2)&& passcu.equals(passdb) ){
												String qr=	"update user set  uname='"+a+"', email='"+b+"', pass='"+passmoi2+"', ngaydk='"+d+"', role='"+f+"' where id='"+id+"' ";
												System.out.println(qr);
													int i=st.executeUpdate(qr);
												
													out.println("<script type=\"text/javascript\">");  
									               	 out.println("alert('Update thành công');"); 
									               	out.println("</script>"); 
									               	 RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
									                 view.forward(request, response);
											
													}
													else{
														response.setContentType("text/html");  
										               	 out.println("<script type=\"text/javascript\">");  
										               	 out.println("alert('Vui lòng kiểm tra lại.');");  
										               	 out.println("</script>"); 
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