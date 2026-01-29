package com.hotel.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hotel.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/CheckInServlet")
public class CheckInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String checkin = request.getParameter("checkin");
        String roomStr = request.getParameter("room_no");
        String depositStr = request.getParameter("deposit");

        String message = "";
        boolean success = false;

        try {
            int room_no = Integer.parseInt(roomStr);
            int deposit = Integer.parseInt(depositStr);

            try (Connection conn = DBConnection.getConnection()) {
                if (conn == null) {
                    message = "⚠️ Database connection failed!";
                } else {
                    // Step 1: Check if room exists
                    String checkRoomSql = "SELECT room_no FROM room WHERE room_no = ?";
                    try (PreparedStatement checkStmt = conn.prepareStatement(checkRoomSql)) {
                        checkStmt.setInt(1, room_no);
                        ResultSet rs = checkStmt.executeQuery();

                        if (!rs.next()) {
                            // Step 2: Insert room with full schema
                            String insertRoomSql = "INSERT INTO room (room_no, availability, status, price, bed_type, type) VALUES (?, ?, ?, ?, ?, ?)";
                            try (PreparedStatement insertRoomStmt = conn.prepareStatement(insertRoomSql)) {
                                insertRoomStmt.setInt(1, room_no);
                                insertRoomStmt.setString(2, "Occupied");     // availability
                                insertRoomStmt.setString(3, "Occupied");     // status
                                insertRoomStmt.setInt(4, 2000);              // price
                                insertRoomStmt.setString(5, "Queen");        // bed_type
                                insertRoomStmt.setString(6, "Single");       // type
                                insertRoomStmt.executeUpdate();
                            }
                        } else {
                            // Step 3: Update room status to Occupied
                            String updateRoomSql = "UPDATE room SET status = 'Occupied', availability = 'Occupied' WHERE room_no = ?";
                            try (PreparedStatement updateStmt = conn.prepareStatement(updateRoomSql)) {
                                updateStmt.setInt(1, room_no);
                                updateStmt.executeUpdate();
                            }
                        }
                    }

                    // Step 4: Insert customer
                    String insertCustomerSql = "INSERT INTO customer (name, room_no, checkin, deposit) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement ps = conn.prepareStatement(insertCustomerSql)) {
                        ps.setString(1, name);
                        ps.setInt(2, room_no);
                        ps.setString(3, checkin);
                        ps.setInt(4, deposit);
                        int rows = ps.executeUpdate();
                        if (rows > 0) {
                            success = true;
                            message = "✅ Customer added and room assigned successfully!";
                        } else {
                            message = "❌ Failed to add customer.";
                        }
                    }
                }
            }
        } catch (NumberFormatException e) {
            message = "❌ Invalid number format: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            message = "❌ Error: " + e.getMessage();
        }

        request.setAttribute("message", message);
        request.setAttribute("success", success);
        RequestDispatcher rd = request.getRequestDispatcher("Reception.jsp");
        rd.forward(request, response);
    }
}
