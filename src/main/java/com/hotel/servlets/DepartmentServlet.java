package com.hotel.servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

import com.hotel.util.DBConnection;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String department = request.getParameter("department");
        String budget = null;

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT budget FROM departments WHERE name = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, department);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    budget = rs.getString("budget");
                }
            }

            request.setAttribute("department", department);
            request.setAttribute("budget", budget);

            RequestDispatcher rd = request.getRequestDispatcher("Department.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
