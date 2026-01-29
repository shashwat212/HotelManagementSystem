package com.hotel.test;

import java.sql.Connection;
import com.hotel.util.DBConnection;

public class TestDB {

    public static void main(String[] args) {
        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            System.out.println("🎉 Connection successful!");
        } else {
            System.out.println("⚠️ Connection failed!");
        }
    }
}
