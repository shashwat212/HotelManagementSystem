<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Out</title>
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
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
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
        }
        button {
            width: 100%;
            background: #dc3545;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background: #b02a37;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h2>Customer Check-Out</h2>
        <form action="CheckOutServlet" method="post">
            <input type="text" name="room_number" placeholder="Room Number" required>
            <button type="submit">Check Out</button>
        </form>

        <div class="message">
            <%
                String success = request.getParameter("success");
                String error = request.getParameter("error");
                if ("true".equals(success)) {
            %>
                <p style="color: lightgreen;">✅ Checkout successful!</p>
            <%
                } else if ("true".equals(error)) {
            %>
                <p style="color: red;">❌ Checkout failed. Please try again.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
