<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Room</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            width: 500px;
            margin: 100px auto;
            text-align: center;
            background: rgba(0,0,0,0.6); /* Darker container for contrast */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.5);
        }

        h2 {
            margin-bottom: 20px;
            color: #fff;
        }

        form {
            margin-bottom: 30px;
        }

        select, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
            font-size: 16px;
        }

        select {
            background: rgba(255,255,255,0.2);
            color: #fff;
        }

        button {
            background: #007bff;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .results ul {
            list-style: none;
            padding: 0;
        }

        .results li {
            background: rgba(255,255,255,0.1);
            margin: 5px 0;
            padding: 10px;
            border-radius: 8px;
            color: #fff;
        }

        .results h3, .results p {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Room</h2>
        <form action="SearchRoomServlet" method="post">
            <select name="bed_type">
                <option value="Single">Single Bed</option>
                <option value="Double">Double Bed</option>
            </select>
            <button type="submit">Search</button>
        </form>

        <div class="results">
            <%
                Object roomObj = request.getAttribute("rooms");
                List<?> rooms = null;
                if (roomObj instanceof List<?>) {
                    rooms = (List<?>) roomObj;
                }
                String bedType = (String) request.getAttribute("bedType");

                if (rooms != null && !rooms.isEmpty()) {
            %>
                <h3>Available <%= bedType %> Rooms:</h3>
                <ul>
                    <% for (Object obj : rooms) {
                        Room room = (Room) obj;
                        String status = room.isCheckedIn() ? "Occupied" : "Available";
                    %>
                        <li>Room <%= room.getNumber() %> — ₹<%= room.getPrice() %> — <%= status %></li>
                    <% } %>
                </ul>
            <%
                } else if (bedType != null) {
            %>
                <p>No <%= bedType %> rooms available.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
