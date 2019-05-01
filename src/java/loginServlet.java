/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author POOJA
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */  
        String uname="",passwd="";
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
        String DB_URL = "jdbc:mysql://localhost:3306/hawkdb";
    		
	       // System.out.println("Done");
   //  Database credentials
        String USER = "root";
        String PASS = "";
        String passwx="";
        String lgtype="";
        uname=request.getParameter("sinemail");
        passwd=request.getParameter("sinpasswd");
        Cookie ck = new Cookie("userid",uname);
        response.addCookie(ck);
        Connection conn = null;
        PreparedStatement stmt = null;
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(DB_URL, USER, PASS);
         stmt = conn.prepareStatement("SELECT * FROM infodb WHERE cardid=?");
         stmt.setString(1, uname);
         ResultSet rs=null;
         rs=stmt.executeQuery();
         while(rs.next())
         {
             passwx=rs.getString("uid");
         }
         if(passwx.equals(passwd))
         {
             response.sendRedirect("home.jsp");
             
         }
         else
         {
             out.println("<script> alert('Incorrect username or password. Try Again'); </script>");
             response.sendRedirect("index.jsp");
         }
        } catch(ClassNotFoundException | SQLException e)
        {
            out.println("<html>"
                    + "<head><title>Login Error</title></head>"
                    + "<body>Login Failed</body>"
                    + "</html>"+e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
