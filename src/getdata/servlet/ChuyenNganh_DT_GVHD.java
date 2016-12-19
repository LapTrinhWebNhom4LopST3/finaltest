package getdata.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;


/**
 * Servlet implementation class ChuyenNganh_DT_GVHD
 */
@WebServlet("/ChuyenNganh_DT_GVHD")
public class ChuyenNganh_DT_GVHD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    static final String DB_URL = "jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8";
	    static final String USER = "root";
	    static final String PASS = "vothithanhvi";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChuyenNganh_DT_GVHD() {
        super();
        // TODO Auto-generated constructor stub
    }
    public class DT_GVHD
    {
    	private String TenDT;
    	private String GVHD;
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
        Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Database..");
			stmt = conn.createStatement();
			String TenCN = request.getParameter("CN");
			String sql = "select MaGV,TenGV from giangvien  where  ChuyenNganh =   '" + TenCN +"' ";
			ResultSet rs = stmt.executeQuery(sql);
			ArrayList  al=null;
			ArrayList pid_List =new ArrayList();
				while (rs.next()) {
					al=new ArrayList();
					al.add(rs.getString(1));
					al.add(rs.getString(2));
					pid_List.add(al);
				}
				request.setAttribute("piList", pid_List);
	            RequestDispatcher view = request.getRequestDispatcher("/TK_SapXep.jsp");
	            view.forward(request, response);
	            conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
