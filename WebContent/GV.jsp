<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery-3.1.0.min.js"></script>    
    <script src="js/bootstrap.min.js"></script>    
   <title>Trang Giảng Viên</title>
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
      <script src="js/bootstrap.min.js"></script>
 
  </script>
  <script>
        $(document).ready(function(){
            $("#flip").click(function(){
                $("#panel").slideToggle("slow");
            });
        });
    </script>
    <script>
        $(document).ready(function(){
            $("#flip1").click(function(){
                $("#panel1").slideToggle("slow");
            });
        });
    </script>
    <script>
        $(document).ready(function(){
            $("#flip2").click(function(){
                $("#panel2").slideToggle("slow");
            });
        });
    </script>
    
    <style>
#panel, #flip {
    padding: 5px;
    text-align: center;

    background-color: #F0FFFF;
    border: solid 2px #000000;

}

#panel {
    padding: 50px;
    display: show;
}
</style>
<style>
#panel1, #flip1 {
    padding: 5px;
    text-align: center;
    background-color: #F0FFFF;
    border: solid 2px #000000;

}

#panel1 {
    padding: 50px;
    display: show;
}
</style>
<style>
#panel2, #flip2 {
    padding: 5px;
    text-align: center;
    background-color: #F0FFFF;
    border: solid 2px #000000;
}

#panel2 {
    padding: 50px;
    display: show;
}
</style>
    <style>
  body{
    padding -top :70px;
    padding-bottom:70px;  
  
  }
   #table,#th,#td {
  border : 3px solid black;
  border-collapse: collapse;

}
 
</style>
</head>
<body>
<jsp:include page= "HeaderGV.jsp"></jsp:include>
<sql:setDataSource var ="con" driver ="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8?useUnicode=true&characterEncoding=UTF-8" user="root" password="vothithanhvi"/>
 <sql:query var="dt" sql="select * from detai" dataSource="${con}"/>
  <sql:query var="tthd" sql="select * from tthoidong" dataSource="${con}"/>
   <div class="container">
  <div class="well well-lg">
     
            <div class="row">
                     <div id="flip1"> <h4>Tìm kiếm hội đồng</h4></div>
                      <div id="panel1" style="border:1px solid black;height:500px;overflow:scroll">
                       <div class="panel-heading" style="color: #FF0000"><h3>Thông Tin Hội Đồng</h3></div>
                       <div class="panel-body">
                  <form method="post" name="frm" action="Search">
                            <div class="row">
                 <div class=" col-md-offset-3 col-md-2"> 
                         <label class=>Tìm theo </label>
                    </div>
                    <div class="col-md-2" >
                        <select class="form-control " name="timtheo" onchange="onCBChange(this);">
                            <option value="tgv" name="timtheo">Tên GV</option>
                            <option value="dd" name="timtheo">Địa điểm</option>
                            <option value="td" name="timtheo">Thời gian</option>
                        </select>
                    </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="noidungtim" id="noidungtim" >
                  </div>
                   <div>
                     <button type="submit" id="btnTim" value="Search"> Tìm kiếm </button>
                  </div>
            </div>
            </form>
            
            <br>
            <br>
               <div class="well well-lg">               
                                  <table class="table table-bordered "  id="tthd">
                                      <thead>
                                       <tr>
                                        <th>STT</th>
                                        <th>Địa Điểm</th>
                                        <th>Từ giờ</th>
                                        <th>Đến giờ</th>
                                        <th>Chủ tịch</th>
                                        <th>Ủy viên 1</th>
                                        <th>Ủy viên 2</th>
                                        <th>Ủy viên 3</th>
                                        <th>Thư Kí</th>
                                        <th>Tên đề tài</th>
                                        <th>Ngày</th>
                                  </tr>
                                      </thead>
                                      <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                <td><%=pList.get(8)%></td>
                <td><%=pList.get(9)%></td>
                <td><%=pList.get(10)%></td>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
                                      
                                </table>
                                
                              </div>
                           </div>
                              

                
                </div>
                </div>
                <br><br>
               
                     <div class="row"> 
                     <div id="flip2"> <h4>Xem thông tin hội đồng</h4> </div>
                      <div id="panel2" style="border:1px solid black;height:500px;overflow:scroll">
                       <div class="panel-heading" style="color: #FF0000"><h3>Thông Tin Hội Đồng</h3></div>
                              <div class="panel-body">
                               <div class="well well-lg">
                                  <table class="table table-bordered "  id="Thông tin hội đồng">
                                      <thead>
                                       <tr>
                                       <th>STT</th>
                                        <th>Địa Điểm</th>
                                        <th>Ngày</th>
                                        <th>Từ giờ</th>
                                        <th>Đến giờ</th>
                                        <th>Chủ tịch</th>
                                        <th>Ủy viên 1</th>
                                        <th>Ủy viên 2</th>
                                        <th>Ủy viên 3</th>
                                        <th>Thư Kí</th>
                                        <th>Tên đề tài</th>
                                    </tr>
                               <c:forEach var="rows" items="${tthd.rows}">
                                <tr>
	                             <td>${rows.STT }</td>
	                             <td> ${rows.DiaDiem}</td>
	                             <td> ${rows.Ngay}</td>
	                             <td> ${rows.StartTime}</td>
	                             <td> ${rows.EndTime }</td>
	                             <td> ${rows.ChuTich }</td>
	                             <td> ${rows.UyVien1 }</td>
	                              <td> ${rows.UyVien2 }</td>
	                               <td> ${rows.UyVien3}</td>
	                                <td> ${rows.ThuKy }</td>
	                                
	                                 <td> ${rows.TenDeTai }</td>
	                                 
	                       </tr>
                         </thead>
                           </c:forEach>
                                </table>
                                  </div>
                              </div>
                         
                </div>
                </div>
                 <br>
              <br>
              
                <div class="row">
           
               	<div id="flip"><h4>Xem thông tin khóa luận</h4></div>
                <div id="panel" style="border:1px solid black;height:500px;overflow:scroll">
              
                        <div class="panel-heading" style="color: #FF0000"><h3>Thông Tin Đề Tài</h3></div>
                        <div class="panel-body">
                         <div class="well well-lg">
                            <table class="table table-bordered " id="Thông tin đề tài">
                                  <thead>
                                     <tr>
                        
                            
                              <th>Tên đề tài</th>
                              <th>GVHD</th>
                              <th>Chuyên ngành</th>
                               <th>MSSV</th>
                               <th>Họ tên sinh viên</th>
                             
                              <c:forEach var="rows" items="${dt.rows}">
                                <tr>
	                        
	                             
	                             <td> ${rows.TenDeTai}</td>
	                             <td> ${rows.GVHD }</td>
	                             <td> ${rows.ChuyenNganh }</td>
	                             <td> ${rows.MSSV }</td>
	                             <td> ${rows.TenSV }</td>
	                       </tr>
                         </thead>
                           </c:forEach>
                             </table>
                             </div>
                      </div>
                </div>
               
                         <br>
      
                </div>
    </div>
    </div>
</body>
</html>