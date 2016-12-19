 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root", "vothithanhvi");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>   
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<title>Trang Trưởng Khoa/Trưởng Bộ Môn Sắp Xếp</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="img/logo.PNG" type="image/x-icon" />
<link rel="shortcut icon" href="img/logo.PNG" />
<style>
#s1, #s2, #s3, #s4, #s5, #e1, #e2, #e3, #e4, #e5 {
	height: 35px;
	width: 100px;
}
</style>
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
	<jsp:include page="HeaderTK.jsp"></jsp:include>
	
	
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8"  user="root" password= "vothithanhvi"/>
     
     
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="abc">
					<div class="btn-group" role="group">
						<a href="TK_XemGV.jsp">
							<button type="button" class="btn btn-default">Nhập/Xem
								thông tin</button>
						</a>
					</div>
					<div class="btn-group" role="group">
						<a href="TK_SapXep.jsp">
							<button type="button" class="btn btn-info">Sắp xếp hội
								đồng</button>
						</a>
					</div>
					<div class="btn-group" role="group">
						<a href="TK_TimKiem.jsp">
							<button type="button" class="btn btn-default">Tìm kiếm
								hội đồng</button>
						</a>
					</div>
				</div>
				<br>
			</div>
		</div>
		</div>
		<sql:query dataSource="${data}" var="ChuyenNganh">
   					SELECT MaCN,TenCN from chuyennganh	</sql:query>

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

										var select = $('#ct');
										select.find('option').remove();
										$.each(response, function(key, value) {
											$('<option>').val(key).text(value)
													.appendTo(select);//Chèn nội dung vào thành phần đã có
										});
									});
									$.get('ChuyenNganh_Detai', {
										CN : TenCN
									}, function(response) {

										var select1 = $('#detai1');
										select1.find('option').remove();
										$.each(response, function(key, value) {
											$('<option>').val(key).text(value)
													.appendTo(select1);
										});
									});
									/* var value=$(this).val(); */
									 $('#bangdetai').load('./LoadData.jsp',{data:TenCN }); 
									/*  $('#bangdetai').load('LoadData.jsp ?param='+ value);  */

									/* $.get('./LoadData',{CN: TenCN}); */
									
								});
						$('#ct').change(
								function() {
									$('#gv1').html(''); //Clear
									$('#ct option:not(:selected)').clone()
											.appendTo('#gv1')
								});

						$('#gv1').change(
								function() {
									$('#gv2').html(''); //Clear
									$('#gv1 option:not(:selected)').clone()
											.appendTo('#gv2')
								});

						$('#gv2').change(
								function() {
									$('#gv3').html(''); //Clear
									$('#gv2 option:not(:selected)').clone()
											.appendTo('#gv3')
								});

						$('#gv3').change(
								function() {
									$('#tk').html(''); //Clear
									$('#gv3 option:not(:selected)').clone()
											.appendTo('#tk')
								});

						$('#detai1').change(
								function() {
									$('#detai2').html(''); //Clear
									$('#detai1 option:not(:selected)').clone()
											.appendTo('#detai2')
								});
						$('#detai2').change(
								function() {
									$('#detai3').html(''); //Clear
									$('#detai2 option:not(:selected)').clone()
											.appendTo('#detai3')
								});
						$('#detai3').change(
								function() {
									$('#detai4').html(''); //Clear
									$('#detai3 option:not(:selected)').clone()
											.appendTo('#detai4')
								});
						$('#detai4').change(
								function() {
									$('#detai5').html(''); //Clear
									$('#detai4 option:not(:selected)').clone()
											.appendTo('#detai5')
								});
						$('#chonNgay').change(
								function() {
									var Ngay = this.value;
									$.get('Phong_Ngay', {
										NgayChon : Ngay
									}, function(response) {

										var select = $('#chonPhong');
										select.find('option').remove();
										$.each(response, function(key, value) {
											$('<option>').val(key).text(value)
													.appendTo(select);
										});
									});
								});
						
						$('#chonPhong').change(function() {
							 /*  $('#tgbd').load('./LoadGio.jsp',{data:+ document.getElementById("chonPhong").value }); */
							 $('#tgbd').load('./LoadGio.jsp',{data:this.value });
						});
					});
		</script>
	<div class="containner">
		<form method="get" ng-submit="submitForm()" name="myForm">
			<div class="row">
				<div class="col-md-offset-1 col-md-2 ">
					<select class="form-control" id="chonChuyenNganh"
						name="chonChuyenNganh">
						<option value="-1">Chọn Chuyên Ngành</option>
						<c:forEach var="row" items="${ChuyenNganh.rows}">
							<option value="${row.TenCN }"><c:out
									value="${row.TenCN }"></c:out>
							</option>
						</c:forEach>
					</select>
				</div>
				<sql:query dataSource="${data}" var="ngay">
   					SELECT DISTINCT Ngay  from phong	</sql:query>
				<div class="col-md-2 ">
					<select class="form-control" id="chonNgay" name="chonNgay">
						<option value="-1">Chọn ngày</option>
						<c:forEach var="row" items="${ngay.rows}">
							<option value="${row.Ngay }"><c:out value="${row.Ngay}"></c:out>
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-2 ">
					<select class="form-control" id="chonPhong" name="chonPhong">
						<option value="-1">Chọn phòng</option>
						</option>
					</select>
				</div>
					<div id="tgbd" name="tgbd">Thời Gian</div>
				<%
					Statement st1 = connection.createStatement();
					ResultSet gv = st1.executeQuery("Select *  From  giangvien ");
					Statement st2 = connection.createStatement();
					ResultSet dt2 = st2.executeQuery("Select *  From  detai ");
				%>
			</div>
			<style>
				input {
					height: 25px;
					width: 100px;
					}
			</style>
			<br>
			<div class="row">
				<div class="col-md-10">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Từ giờ</th>
								<th>Đến giờ</th>
								<th>Chủ tịch</th>
								<th>Ủy viên 1</th>
								<th>Ủy viên 2</th>
								<th>Ủy viên 3</th>
								<th>Thư Kí</th>
								<th>Tên Đề Tài</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="cod-md-1">
										<input type="text" id="s1" name="s1" class=" form-control" />
									</div>
								</td>
								<td>
									<div class="cod-md-1">
										<input type="text" id="e1"name="e1" class=" form-control" />
									</div>
								</td>
								<td><select class="form-control" id="ct" name="ct">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>

								<td><select class="form-control" id="gv1" name="gv1">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>

								<td><select class="form-control" id="gv2" name="gv2">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>

								<td><select class="form-control" id="gv3" name="gv3">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>

								<td><select class="form-control" id="tk" name="tk">
										<option value="-1">Chọn Giảng Viên</option>
								</select></td>

								<td><select class="form-control" id="detai1" name="detai1">
										<option value="-1">Chọn Đề Tài</option>
								</select></td>
								</select>
								</td>
							<tr>
								<td><input type="text" id="s2"name="s2"
									class=" form-control input-md" class="cod-md-1" /></td>
								<td><input type="text" id="e1" name="e2"
									class=" form-control input-md" class="cod-md-1" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><select class="form-control" id="detai2" name="detai2">
										<option value="-1">Chọn Đề Tài</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="text" id="s3"name="s3"
									class=" form-control input-md " /></td>
								<td><input type="text" id="e3"name="e3" class=" form-control" /></td>

								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><select class="form-control" id="detai3" name="detai3">
										<option value="-1">Chọn Đề Tài</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="text" id="s4"name="s4"
									class=" form-control input-md" class="cod-md-1" /></td>
								<td><input type="text" id="e4"name="e4"
									class=" form-control input-md" class="cod-md-1" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><select class="form-control" id="detai4" name="detai4">
										<option value="-1">Chọn Đề Tài</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="text" id="s5"name="s5"
									class=" form-control input-md" class="cod-md-1" /></td>
								<td><input type="text" id="e5"name="e5"
									class=" form-control input" class="cod-md-1" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><select class="form-control" id="detai5" name="detai5">
										<option value="-1">Chọn Đề Tài</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-2  col-md-offset- 8" id="bangdetai" name="bangdetai">

				</div>
			<div class="row">
				<div class="col-md-7"></div>
				<div class="col-md-2 ">
					<button type="submit" name="submit" class="btn btn-primary ">Save</button>
				</div>
					<%
						if (request.getParameter("submit") != null) {
							String cn = request.getParameter("chonChuyenNganh");
							String ngay = request.getParameter("chonNgay");
							String phong = request.getParameter("chonPhong");

							String a1 = request.getParameter("s1");
							String b1 = request.getParameter("e1");
							String a2 = request.getParameter("s2");
							String b2 = request.getParameter("e2");
							String a3 = request.getParameter("s3");
							String b3 = request.getParameter("e3");
							String a4 = request.getParameter("s4");
							String b4 = request.getParameter("e4");
							String a5 = request.getParameter("s5");
							String b5 = request.getParameter("e5");

							SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
							
							String ct = request.getParameter("ct");
							String gv1 = request.getParameter("gv1");
							String gv2 = request.getParameter("gv2");
							String gv3 = request.getParameter("gv3");
							String tk = request.getParameter("tk");

							String dt1 = request.getParameter("detai1");
							String dtai2 = request.getParameter("detai2");
							String dt3 = request.getParameter("detai3");
							String dt4 = request.getParameter("detai4");
							String dt5 = request.getParameter("detai5");
							
							
								Class.forName("com.mysql.jdbc.Driver");
								Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8", "root",
										"vothithanhvi");
								Statement st = connection1.createStatement();
								PreparedStatement a;
								PreparedStatement b;
								PreparedStatement c;
								PreparedStatement d;
								PreparedStatement e;
								if (!request.getParameter("s1").isEmpty() && !request.getParameter("e1").isEmpty()) {
									Date a11 = null;
									Date b11 = null;
									a11 = sdf.parse(a1);
									b11 = sdf.parse(b1);
									Time  s1 = new Time(a11.getTime());
									Time  ee1 = new Time(b11.getTime());
									try{
									int i1 = st.executeUpdate(
											"insert into tthoidong (DiaDiem,Ngay,StartTime,EndTime,ChuTich,UyVien1,UyVien2,UyVien3,ThuKy,TenDeTai)  values('"+phong+" ',' "+ngay+"','"+s1+"','"+ee1+"',' "+ct+" ','"+gv1+"' ,'"+gv2+"',' "+gv3+" ','"+ tk +"','"+ dt1+"')");
								}
							 catch (Exception e1) {
									System.out.print("lỗi 1 là :"+e1);
									e1.printStackTrace();
								}
								}
								if (!request.getParameter("s2").isEmpty() && !request.getParameter("e2").isEmpty()) {
									Date c11 = null;
									Date d11 = null;
									c11 = sdf.parse(a2);
									d11 = sdf.parse(b2);
									Time  s2 = new Time(c11.getTime());
									Time  ee2 = new Time(d11.getTime());
									try{
										int i2 = st.executeUpdate(
											"insert into tthoidong (DiaDiem,Ngay,StartTime,EndTime,ChuTich,UyVien1,UyVien2,UyVien3,ThuKy,TenDeTai)  values(' "
													+ phong + " ',' " + ngay + " ','"+s2+"','"+ee2+"',' " + ct + " ',' "
													+ gv1 + " ' ,' " + gv2 + " ',' " + gv3 + " ',' " + tk + " ',' " + dtai2
													+ " ')");
								}catch (Exception e2) {
									System.out.print("lỗi 2 là :"+e2);
									e2.printStackTrace();
								}
								}
								if (!request.getParameter("s3").isEmpty() && !request.getParameter("e3").isEmpty()) {
									Date e11 = null;
									Date f11 = null;
									e11 = sdf.parse(a3);
									f11 = sdf.parse(b3);
									Time  s3 = new Time(e11.getTime());
									Time  ee3 = new Time(f11.getTime());
									try{
										int i3 = st.executeUpdate(
									
											"insert into tthoidong (DiaDiem,Ngay,StartTime,EndTime,ChuTich,UyVien1,UyVien2,UyVien3,ThuKy,TenDeTai)  values(' "
													+ phong + " ',' " + ngay + " ','"+s3+"','"+ee3+"',' " + ct + " ',' "
													+ gv1 + " ' ,' " + gv2 + " ',' " + gv3 + " ',' " + tk + " ',' " + dt3 + " ')");
									}
									catch(Exception e3){
									System.out.print("lỗi 3 là :"+e3);
									e3.printStackTrace();
								}
									
								}
								if (!request.getParameter("s4").isEmpty() && !request.getParameter("e4").isEmpty()) {
									Date g11 = null;
									Date h11 = null;
									g11 = sdf.parse(a4);
									h11 = sdf.parse(b4);
									Time  s4 = new Time(g11.getTime());
									Time  ee4 = new Time(h11.getTime());
									try{int i4 = st.executeUpdate(
											"insert into tthoidong (DiaDiem,Ngay,StartTime,EndTime,ChuTich,UyVien1,UyVien2,UyVien3,ThuKy,TenDeTai)  values(' "
													+ phong + " ',' " + ngay + " ','"+s4+"','"+ee4+"',' " + ct + " ',' "
													+ gv1 + " ' ,' " + gv2 + " ',' " + gv3 + " ',' " + tk + " ',' " + dt4 + " ')");
								}catch (Exception e4) {
									System.out.print("lỗi 4 là :"+e4);
									e4.printStackTrace();
								}
								}
								if (!request.getParameter("s5").isEmpty() && !request.getParameter("e5").isEmpty()) {
									Date i11 = null;
									Date k11 = null;
									i11 = sdf.parse(a5);
									k11 = sdf.parse(b5);
									Time  s5 = new Time(i11.getTime());
									Time  ee5 = new Time(k11.getTime());
									
									try{
										int i5 = st.executeUpdate(
											"insert into tthoidong (DiaDiem,Ngay,StartTime,EndTime,ChuTich,UyVien1,UyVien2,UyVien3,ThuKy,TenDeTai)  values(' "
													+ phong + " ',' " + ngay + " ','"+s5+"','"+ee5+"',' " + ct + " ',' "
													+ gv1 + " ' ,' " + gv2 + " ',' " + gv3 + " ',' " + tk + " ',' " + dt5 + " ')");
								
									
								} catch (Exception eee5) {
									System.out.print("lỗi 5 là :"+eee5);
									eee5.printStackTrace();
								}
								}
								out.print("Save Success");
						}
					%>

				</div>
		</form>
	</div>
</body>
</html>