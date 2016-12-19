package getdata.servlet;
import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/SearchTK"})
public class SearchTK extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
         response.setCharacterEncoding("UTF-8");
         request.setCharacterEncoding("UTF-8");
    
        PrintWriter out = response.getWriter();
        
        Connection conn = null;
       
 
        Statement st;
        try {
	        	 Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8",
	                    "root", "vothithanhvi");
            System.out.println("Connected!");
            String chon=request.getParameter("timtheo");
           
           if(chon.equals("tgv")){
            	 String pid = request.getParameter("noidungtim");
            	 ArrayList al = null;
                 ArrayList pid_list = new ArrayList();
                
                 String query = "select * FROM tthoidong  where ChuTich='" + pid + "' or UyVien1='" + pid + "' or UyVien2='" + pid + "'"
                 		+ " or UyVien3='" + pid + "' or ThuKy='" + pid + "' ";
      
                 System.out.println("query " + query);
                 st = conn.createStatement();
                 ResultSet rs = st.executeQuery(query);
      
                 while (rs.next()) {
                     al = new ArrayList();
                  
                     al.add(rs.getString(1));
                     al.add(rs.getString(2));
                     al.add(rs.getString(3));
                     al.add(rs.getString(4));
                     al.add(rs.getString(5));
                     al.add(rs.getString(6));
                     al.add(rs.getString(7));
                     al.add(rs.getString(8));
                     al.add(rs.getString(9));
                     al.add(rs.getString(10));
                     al.add(rs.getString(11));

                     System.out.println("al :: " + al);
                     pid_list.add(al);
                 }
      
                 request.setAttribute("piList", pid_list);
                 RequestDispatcher view = request.getRequestDispatcher("/TK_TimKiem.jsp");
                 view.forward(request, response);
                 conn.close();
                 System.out.println("Disconnected!");
            	}
         
         
         
           else if(chon.equals("dd")){
        	   String pid = request.getParameter("noidungtim");
          	 ArrayList al = null;
               ArrayList pid_list = new ArrayList();
               String query = "select * FROM tthoidong  where DiaDiem='"+ pid +"'";
    
               System.out.println("query " + query);
               st = conn.createStatement();
               ResultSet rs = st.executeQuery(query);
    
               while (rs.next()) {
                   al = new ArrayList();
    
//                   out.println(rs.getString(1));
//                   out.println(rs.getString(2));
//                   out.println(rs.getString(3));
//                   out.println(rs.getString(4));
                  
                   al.add(rs.getString(1));
                   al.add(rs.getString(2));
                   al.add(rs.getString(3));
                   al.add(rs.getString(4));
                   al.add(rs.getString(5));
                   al.add(rs.getString(6));
                   al.add(rs.getString(7));
                   al.add(rs.getString(8));
                   al.add(rs.getString(9));
                   al.add(rs.getString(10));
                   al.add(rs.getString(11));
                   System.out.println("al :: " + al);
                   pid_list.add(al);
               }
    
               request.setAttribute("piList", pid_list);
               RequestDispatcher view = request.getRequestDispatcher("/TK_TimKiem.jsp");
               view.forward(request, response);
               conn.close();
               System.out.println("Disconnected!");
           }
           else if(chon.equals("td")){
        	   
        	   String pid = request.getParameter("noidungtim");
        	   SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
        	    Date time = null;
        	    String time1=null;
        	    try {
        	        time = sdf.parse(pid);
        	         time1=sdf.format(time);
        	    } catch (Exception e) {
        	    	response.setContentType("text/html");  
               	 out.println("<script type=\"text/javascript\">");  
               	 out.println("alert('Vui lòng kiểm tra lại thời gian thời gian');");  
               	 out.println("</script>"); 
        	    }
        	  // Date time=
            	 ArrayList al = null;
                 ArrayList pid_list = new ArrayList();
                 String query = "select * FROM tthoidong where StartTime<='"+ time1 +"'and EndTime>='"+time1+"'";
      
                 System.out.println("query " + query);
                 st = conn.createStatement();
                 ResultSet rs = st.executeQuery(query);
      
                 while (rs.next()) {
                     al = new ArrayList();
      
//                     out.println(rs.getString(1));
//                     out.println(rs.getString(2));
//                     out.println(rs.getString(3));
//                     out.println(rs.getString(4));
                    
                     al.add(rs.getString(1));
                     al.add(rs.getString(2));
                     al.add(rs.getString(3));
                     al.add(rs.getString(4));
                     al.add(rs.getString(5));
                     al.add(rs.getString(6));
                     al.add(rs.getString(7));
                     al.add(rs.getString(8));
                     al.add(rs.getString(9));
                     al.add(rs.getString(10));
                     al.add(rs.getString(11));
                     System.out.println("al :: " + al);
                     pid_list.add(al);
                 }
      
                 request.setAttribute("piList", pid_list);
                 RequestDispatcher view = request.getRequestDispatcher("/TK_TimKiem.jsp");
                 view.forward(request, response);
                 conn.close();
                 System.out.println("Disconnected!");
          
           }
 
           }
         catch (Exception e) {
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('vui lòng kiểm tra lại 1 ');");
			out.println("</script>");
	      }
    }
 
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
