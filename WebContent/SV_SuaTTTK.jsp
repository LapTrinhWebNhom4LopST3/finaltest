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
        <title>SV_Sửa Thông Tin Tài Khoản</title> 
    
   <style>
#main{margin-left:20px; margin-right:20px;}
#main form input[type=text], #main form input[type=email], #main form input[type=password]{width: 100%;display: inline}
</style>
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="img/logo.PNG" type="image/x-icon" />
    <link rel="shortcut icon" href="img/logo.PNG"/>
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
    background-image: url("img/bkg3.jpg");
}
</style>
</head>
<body>
<jsp:include page= "HeaderSV.jsp"></jsp:include>

 <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading"><h style=color:red>Sửa thông tin tài khoản</h></div>
                    <div class="panel-body">
                      <div class="container">
                           <div class="form-group">
                               
                            <form class="form-horizontal" name="form" >  
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
                                                 <label for="name" class="col-xs-2 control-label required"><h style=color:blue>Tên tài khoản:</h></label>
                                                 <div class="col-md-3">
                                             
			                                             <input name="name" type="text" class="form-control" placeholder="Tên tài khoản"   value="<%=rs1.getString("uname")%>">
			                                               
			                                             <input type="hidden" class="form-control" name="id"  value="<%=rs1.getString("id")%>">
                                                  
                                             
                                                </div>
                                         </div>  
                                         <div class="form-group">
                                               <label for="email" class="col-xs-2 control-label required"><h style=color:blue>Email:</h></label>
                                                <div class="col-md-3">
                                                <input name="email" type="email" value="<%=rs1.getString("email")%>" class="form-control" placeholder="Email"  >
                                                 <input  type="hidden" name="pass"value="<%=rs1.getString("pass")%>" class="form-control" placeholder="Email"  >
                                                 <input  type="hidden" name="ngaydk" value="<%=rs1.getString("ngaydk")%>" class="form-control" placeholder="Email"  >
                                                 <input type="hidden" name="role" value="<%=rs1.getString("role")%>" placeholder="Email"  >
                                                
                                            </div>
                                        </div>
                                          
                                       <div class="form-group">
                                               <div class="col-md-2 col-md-offset-3">
                                              <div class="col-md-3" style="text-align: left;">
                                                  <button type="submit" name="dongy" class="btn btn-primary" >Đồng ý</button>
                                              </div>
                                              </div>
                                             <div class="col-md-2 col-md-offset" style="text-align: rignt;">
                               <a href="SV_ThongTinTaiKhoan.jsp"> <button type="submit" class="btn btn-primary" >Hủy</button></a>
                                              </div>
                                         </div>
                                         	<%
							}
						%>
                            
                                  </form>
                                               <%
								if (request.getParameter("dongy")!= null) {
									
									String id=request.getParameter("id");
										String a =  request.getParameter("name");
										String b = request.getParameter("email");
										
										String c = request.getParameter("pass");
										String d = request.getParameter("ngaydk");
										String f = request.getParameter("role");
			
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
											Statement st = connection.createStatement();
											String qr=	"update user set  uname='"+a+"', email='"+b+"', pass='"+c+"', ngaydk='"+d+"', role='"+f+"' where id='"+id+"' ";
											System.out.println(qr);
												int i=st.executeUpdate(qr);
												
												out.println("<script type=\"text/javascript\">");  
								               	 out.println("alert('Update thành công');"); 
								               	out.println("</script>"); 
								               	 RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
								                 view.forward(request, response);
								               	 
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