<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80") 
                        no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            padding: 40px;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background: rgba(0, 0, 0, 0.55);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        form {
            margin-bottom: 40px;
        }

        select, input, button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            transition: 0.3s ease;
        }

        /* Glassy transparent inputs */
        input, select {
            background: rgba(255, 255, 255, 0.12);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(6px);
        }

        input::placeholder {
            color: #eee;
        }

        select option {
            color: #000;
        }

        input:focus, select:focus {
            outline: none;
            border: 1px solid #4e8cff;
            background: rgba(255, 255, 255, 0.2);
        }

        button {
            background: linear-gradient(90deg, #1e3c72, #2a5298);
            color: white;
            cursor: pointer;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        button:hover {
            background: linear-gradient(90deg, #2a5298, #1e3c72);
            transform: scale(1.03);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background: rgba(255,255,255,0.08);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            text-align: center;
            color: #fff;
        }

        th {
            background: rgba(0,0,0,0.5);
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manager Info Lookup</h2>

        <form method="post" action="ManagerInfoServlet">
            <input type="hidden" name="action" value="view" />
            <%
                Object mgrObj = request.getAttribute("managers");
                List<String> managers = new ArrayList<>();
                if (mgrObj instanceof List<?>) {
                    for (Object item : (List<?>) mgrObj) {
                        if (item instanceof String) {
                            managers.add((String) item);
                        }
                    }
                }
            %>
            <select name="manager" required>
                <option value="">-- Select Manager --</option>
                <%
                    for (String mgr : managers) {
                %>
                    <option value="<%= mgr %>"><%= mgr %></option>
                <%
                    }
                %>
            </select>
            <button type="submit">View Info</button>
        </form>

        <%
            String infoName = (String) request.getAttribute("infoName");
            String infoDept = (String) request.getAttribute("infoDept");
            String infoExp = (String) request.getAttribute("infoExp");

            if (infoName != null) {
        %>
        <table>
            <tr><th>Name</th><th>Department</th><th>Experience</th></tr>
            <tr>
                <td><%= infoName %></td>
                <td><%= infoDept %></td>
                <td><%= infoExp %></td>
            </tr>
        </table>
        <%
            }
        %>

        <h2 style="margin-top: 40px;">Add New Manager</h2>
        <form method="post" action="ManagerInfoServlet">
            <input type="hidden" name="action" value="add" />
            <input type="text" name="name" placeholder="Manager Name" required />
            <input type="text" name="department" placeholder="Department" required />
            <input type="text" name="experience" placeholder="Experience (e.g., 5 Years)" required />
            <button type="submit">Add Manager</button>
        </form>
    </div>
</body>
</html>
