<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Management Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: url("https://images.unsplash.com/photo-1554995207-c18c203602cb?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            height: 100vh;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        header {
            position: relative;
            z-index: 2;
            background: rgba(0, 0, 0, 0.7);
            text-align: center;
            padding: 20px;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.4);
        }

        nav {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: center;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        nav a {
            color: #fff;
            padding: 14px 20px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        nav a:hover {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
        }

        iframe {
            position: relative;
            z-index: 2;
            width: 100%;
            height: 80vh;
            border: none;
            background: rgba(255, 255, 255, 0.8);
        }

        footer {
            position: relative;
            z-index: 2;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            color: #ccc;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <header>Hotel Dashboard</header>

    <nav>
        <a href="CheckIn.jsp" target="content">Check In</a>
        <a href="SearchRoom.jsp" target="content">Search Room</a>
        <a href="Department.jsp" target="content">Departments</a>
        <a href="ManagerInfo.jsp" target="content">Managers</a>
        <a href="Employee.jsp" target="content">Employees</a>
        <a href="CheckOut.jsp" target="content">Check Out</a>
        <a href="PickUp.jsp" target="content">Pickup Service</a>
    </nav>

    <iframe name="content" src="Welcome.jsp"></iframe>

    <footer>© 2025 Hotel Management System — Designed by Shashwat Gupta, Tanishq Kaushik, Jahaan Gauri and Yug Gothwal</footer>
</body>
</html>
