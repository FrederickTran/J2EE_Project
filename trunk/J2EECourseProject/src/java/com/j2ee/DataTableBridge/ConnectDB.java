/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.SongActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.j2ee.BeanForm.sampleActionform;
import java.sql.Date;



/**
 *
 * @author ngoct
 */
public class ConnectDB {
    private static Connection cn;
    public static Connection getConnect(){
        try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
            }
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=MusicWebsite";
            String user = "sa";
            String pass = "123456";
            try {
                cn = DriverManager.getConnection(url, user, pass);
            } catch (SQLException ex) {
                Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        return cn;
    }
    
    public static void Close(){
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static boolean comment(String comment, String accountId,String songId) {
        
        Date date =new Date(System.currentTimeMillis());
        
        Connection cn = ConnectDB.getConnect();
        
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_COMMENT_INSERT(?, ?, ?, ?) }");
            cs.setString("Comment", comment);
            cs.setString("AccountId", accountId);
            cs.setString("SongId", songId);
            cs.setDate("TimeStam", date);
            
            int rs = cs.executeUpdate();
            if(rs == 1){
                return true;
            }
        } 
        catch (SQLException ex) {
            return false;
        }
        finally{
            ConnectDB.Close();
        }
        
        return false;
    }
}