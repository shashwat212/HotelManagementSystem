<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reception Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI';
            background-color: #f5f5f5;
            padding: 40px;
        }
        .message {
            background: #e0ffe0;
            border: 1px solid #28a745;
            padding: 20px;
            border-radius: 8px;
            color: #155724;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p><%= message %></p>
        <%
            } else {
        %>
            <p>Welcome to the reception dashboard.</p>
        <%
            }
        %>
    </div>
</body>
</html>
