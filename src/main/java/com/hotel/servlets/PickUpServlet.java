package com.hotel.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hotel.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PickUpServlet")
public class PickUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customer_name");
        String carType = request.getParameter("car_type");
        String pickupTime = request.getParameter("pickup_time");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO pickup (customer_name, car_type, pickup_time) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, customerName);
            stmt.setString(2, carType);
            stmt.setString(3, pickupTime);
            stmt.executeUpdate();

            response.sendRedirect("PickUp.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("PickUp.jsp?error=true");
        }
    }
}
