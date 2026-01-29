<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Department Budget Lookup</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .overlay {
            background: rgba(0,0,0,0.6);
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: 0;
        }
        .container {
            position: relative;
            z-index: 1;
            max-width: 600px;
            margin: 100px auto;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
        }
        form {
            text-align: center;
        }
        select, button {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
            margin: 10px;
        }
        button {
            background: linear-gradient(90deg, #1e3c72, #2a5298);
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: linear-gradient(90deg, #2a5298, #1e3c72);
        }
        .result {
            margin-top: 30px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <h2>Department Budget Lookup</h2>

        <form method="post" action="DepartmentServlet">
            <select name="department">
                <option value="">-- Select Department --</option>
                <option value="Housekeeping">Housekeeping</option>
                <option value="Front Desk">Front Desk</option>
                <option value="Kitchen">Kitchen</option>
                <option value="Maintenance">Maintenance</option>
            </select>
            <button type="submit">Check Budget</button>
        </form>

        <%
            String dept = (String) request.getAttribute("department");
            String budget = (String) request.getAttribute("budget");
            if (dept != null && budget != null) {
        %>
            <div class="result">
                <%= dept %> Department Budget: <%= budget %>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
