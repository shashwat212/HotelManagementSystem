<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Info Lookup</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
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

        .info-table {
            margin: 30px auto;
            width: 100%;
            border-collapse: collapse;
            background: rgba(255,255,255,0.15);
            border-radius: 12px;
            overflow: hidden;
        }

        .info-table th, .info-table td {
            padding: 12px;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            text-align: center;
        }

        .info-table th {
            background: rgba(0,0,0,0.5);
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <h2>Employee Info Lookup</h2>

        <form method="post" action="Employee.jsp">
            <select name="employee">
                <option value="">-- Select Employee --</option>
                <option value="Vikas Mehta">Vikas Mehta</option>
                <option value="Suman Rao">Suman Rao</option>
            </select>
            <button type="submit">View Info</button>
        </form>

        <%
            String employee = request.getParameter("employee");
            if (employee != null && !employee.isEmpty()) {
                String id = "";
                String job = "";
                String salary = "";

                switch (employee) {
                    case "Vikas Mehta":
                        id = "1";
                        job = "Chef";
                        salary = "25000";
                        break;
                    case "Suman Rao":
                        id = "2";
                        job = "Cleaner";
                        salary = "12000";
                        break;
                    default:
                        id = "Unknown";
                        job = "Unknown";
                        salary = "Unknown";
                }
        %>
            <table class="info-table">
                <tr><th>ID</th><th>Name</th><th>Job</th><th>Salary</th></tr>
                <tr>
                    <td><%= id %></td>
                    <td><%= employee %></td>
                    <td><%= job %></td>
                    <td><%= salary %></td>
                </tr>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>
