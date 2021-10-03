/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abhi.tech.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mahakaal
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getC() {
        try {
            if (con == null) {
                //Driver Class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create a Connection....
                String URL = "jdbc:mysql://localhost:3306/abhi_tech";
                con = DriverManager.getConnection(URL, "root", "7042");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
