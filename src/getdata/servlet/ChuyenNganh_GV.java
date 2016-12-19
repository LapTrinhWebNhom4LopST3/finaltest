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

import com.google.gson.Gson;


/**
 * Servlet implementation class ChuyenNganh_GV
 */
@WebServlet("/ChuyenNganh_GV")
public class ChuyenNganh_GV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    static final String DB_URL = "jdbc:mysql://localhost:3306/do_an?useUnicode=true&characterEncoding=utf-8";
	    static final String USER = "root";
	    static final String PASS = "vothithanhvi";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChuyenNganh_GV() {
        super();
        // TODO Auto-generated constructor stub
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
			Map<String, String> map = new LinkedHashMap<String, String>();
			String sql = "select MaGV,TenGV from giangvien  where  ChuyenNganh =   '" + TenCN +"' ";
			ResultSet rs = stmt.executeQuery(sql);
			int t=0;
			while (rs.next()) {
					map.put(rs.getString("TenGV"), rs.getString("TenGV"));
					t++;
				}
			if(t==0) map.put("-1", "Chọn Giảng Viên");
				String json = null;

				json = new Gson().toJson(map);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
