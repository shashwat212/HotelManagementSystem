package com.hotel.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hotel.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/ManagerInfoServlet")
public class ManagerInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String selectedManager = request.getParameter("manager");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String experience = request.getParameter("experience");

        String infoName = null, infoDept = null, infoExp = null;

        try (Connection conn = DBConnection.getConnection()) {

            // Add manager
            if ("add".equals(action) && name != null && department != null && experience != null) {
                String insertSql = "INSERT INTO manager (name, department, experience) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(insertSql)) {
                    stmt.setString(1, name);
                    stmt.setString(2, department);
                    stmt.setString(3, experience);
                    stmt.executeUpdate();
                }
            }

            // Lookup manager info
            if ("view".equals(action) && selectedManager != null && !selectedManager.isEmpty()) {
                String infoSql = "SELECT department, experience FROM manager WHERE name = ?";
                try (PreparedStatement stmt = conn.prepareStatement(infoSql)) {
                    stmt.setString(1, selectedManager);
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        infoName = selectedManager;
                        infoDept = rs.getString("department");
                        infoExp = rs.getString("experience");
                    }
                }
            }

            // Load manager list
            List<String> managers = new ArrayList<>();
            String listSql = "SELECT name FROM manager";
            try (PreparedStatement stmt = conn.prepareStatement(listSql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    managers.add(rs.getString("name"));
                }
            }

            request.setAttribute("managers", managers);
            request.setAttribute("infoName", infoName);
            request.setAttribute("infoDept", infoDept);
            request.setAttribute("infoExp", infoExp);

            RequestDispatcher rd = request.getRequestDispatcher("ManagerInfo.jsp");
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
