# Hotel Management System (Java Servlet + JSP + MySQL)

A complete Hotel Management System built using **Java Servlets**, **JSP**, **JDBC**, and **MySQL**, developed in **Eclipse IDE**.  
This project manages booking, check-in, check-out, room management, employee management, and transaction history.

---

## Features

### Authentication
- Secure login system for admins/managers  
- Session handling  

### Hotel Operations
- Room booking  
- Check-in & Check-out  
- Department management  
- Employee management  

### Additional Modules
- Pickup service  
- Search room availability  
- Manager information  
- Transaction history  

---

## Tech Stack

- **Backend:** Java Servlets, JSP  
- **Database:** MySQL  
- **Server:** Apache Tomcat  
- **IDE:** Eclipse  
- **JDBC:** Database connectivity  
- **Frontend:** HTML, CSS, JavaScript  

---

## Project Structure

```
HotelManagementSystem
├── src
│   └── main
│       ├── java
│       │   └── com.hotel.servlets
│       │   └── com.hotel.model
│       │   └── com.hotel.util
│       └── resources
├── webapp
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── CheckIn.jsp
│   ├── CheckOut.jsp
│   ├── Reception.jsp
│   └── other JSP files
├── .project
├── .classpath
└── README.md
```

---

## Database Configuration

Update your database credentials in:

```
src/main/java/com/hotel/util/DBConnection.java
```

---

## How to Run

1. Clone the repository  
   ```bash
   git clone https://github.com/shashwat212/HotelManagementSystem.git
   ```
2. Import into **Eclipse** as a *Dynamic Web Project*  
3. Configure **Tomcat Server**  
4. Create MySQL database and tables  
5. Run the project on Tomcat  
6. Open in browser:  
   ```
   http://localhost:8080/HotelManagementSystem/login.jsp
   ```

---

## Author

**Shashwat Gupta**  
- Student at Amity University, Noida  
- Developer and innovator with expertise in Java, AI/ML, and web applications  
