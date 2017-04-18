/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

/**
 *
 * @author tranminhtuan
 */

import java.sql.*;

public class TABLE_DEMO_Bridge {
    public static boolean checkLogin(String id, String password) throws Exception
    {
		return true;
        // Connection con = DriverManager.getConnection(
                // "jdbc:sqlserver://localhost/J2EE_PROJECT", "sa", "123456789");
        
        // try {
            // try {
                // Statement st = con.createStatement();
                // ResultSet result = st.executeQuery(
                // "SELECT COUNT(*) AS VALID FROM TABLE_DEMO WHERE ACCOUNT = '" + id + "' AND PASSWORD = '" + password + "';");
                // if (result.getInt("VALID") == 1)
                // {
                    // System.out.println("Login successful.");
                    // return true;
                // }
                // else
                // {
                    // return false;
                // }
            // }
            // catch (SQLException ex)
            // {
                // System.out.println("SQL query is invalid, exception: " + ex);
            // }
            // con.close();
        // }
        // catch (Exception e)
        // {
            // e.printStackTrace();
            // throw e;
        // }
        // return false;
    }
}
