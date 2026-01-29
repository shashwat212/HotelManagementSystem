package com.hotel.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SearchRoomServlet")
public class SearchRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bedType = request.getParameter("bed_type");

        List<Room> rooms = new ArrayList<>();

        // Dummy data — replace with DB logic later
        if ("Single".equals(bedType)) {
            rooms.add(new Room("101", "Single", 1500, false));
            rooms.add(new Room("102", "Single", 1500, true));
        } else if ("Double".equals(bedType)) {
            rooms.add(new Room("201", "Double", 2500, false));
            rooms.add(new Room("202", "Double", 2500, true));
        }

        request.setAttribute("bedType", bedType);
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("SearchRoom.jsp").forward(request, response);
    }
}
