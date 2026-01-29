<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pickup Service</title>
    <style>
        body {
            background: url("https://luxurypulse.com/img/pictures/62f6ed81e492bf9e80.jpeg") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            font-family: 'Segoe UI';
        }
        .overlay {
            background: rgba(0,0,0,0.6);
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
        }
        .container {
            position: relative;
            z-index: 1;
            width: 400px;
            margin: 100px auto;
            background: rgba(255,255,255,0.15);
            padding: 30px;
            border-radius: 12px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
        }
        button {
            width: 100%;
            background: #17a2b8;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background: #117a8b;
        }
        .message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h2>Pickup Service Request</h2>
        <form action="PickUpServlet" method="post">
            <input type="text" name="customer_name" placeholder="Customer Name" required>
            <input type="text" name="car_type" placeholder="Car Type" required>
            <input type="text" name="pickup_time" placeholder="Pickup Time" required>
            <button type="submit">Confirm Pickup</button>
        </form>

        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");

            if ("true".equals(success)) {
        %>
            <div class="message" style="color: lightgreen;">Your comfort begins the moment you confirmed your booking!</div>
        <%
            } else if ("true".equals(error)) {
        %>
            <div class="message" style="color: red;">Error saving pickup request. Please try again.</div>
        <%
            }
        %>
    </div>
</body>
</html>
