<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .overlay {
            background: rgba(0,0,0,0.6);
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }
        .container {
            position: relative;
            z-index: 2;
            width: 500px;
            margin: 100px auto;
            background: rgba(255,255,255,0.15);
            padding: 30px;
            border-radius: 12px;
            backdrop-filter: blur(10px);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
        }
        button {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover { background: #218838; }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h2>Add Customer</h2>
        <form action="CheckInServlet" method="post">
            <input type="text" name="name" placeholder="Customer Name" required>
            <input type="text" name="room_no" placeholder="Room Number" required>
            <input type="text" name="checkin" placeholder="Check-in Date" required>
            <input type="text" name="deposit" placeholder="Deposit Amount" required>
            <button type="submit">Add Customer</button>
        </form>
    </div>
</body>
</html>
