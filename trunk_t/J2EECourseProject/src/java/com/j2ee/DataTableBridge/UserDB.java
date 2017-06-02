/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.SongActionForm;
import com.j2ee.BeanForm.UserActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ngoct
 */
public class UserDB {
    public static ArrayList<UserActionForm> getAllUser() throws Exception{
        ArrayList<UserActionForm> userList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String accountid = rs.getString("AccountId");
                String password = rs.getString("Password");
                String name = rs.getString("AccountName");
                UserActionForm user = new UserActionForm();
                user.setAccountID(accountid);
                user.setPassword(password);
                userList.add(user);
            }
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return userList;
    }
    
    public static int checkLogin(String accountId, String password){
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_VALIDATE(?, ?) }");
            cs.setString("AccountId", accountId);
            cs.setString("Password", password);
            ResultSet rs = cs.executeQuery();
            rs.next();
            Integer id = rs.getInt(1);
            return id;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            ConnectDB.Close();
        }
        return -1;
    }
    
    public static boolean signUp(String accountId, String password, String accountName, String name, String addressLine1, String addressLine2, String addressZip, String addressCountry, String cardNumber, String cvvCode, String expiration) {
        ArrayList<SongActionForm> songList = new ArrayList();
        String d[] = expiration.split("-");
        int year = Integer.parseInt("1"+d[0]);
        int month = Integer.parseInt(d[1]);
        Date date = new Date(year, month - 1, 1);
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_INSERT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
            cs.setString("AccountId", accountId);
            cs.setString("Password", password);
            cs.setString("AccountName", accountName);
            cs.setBoolean("Admin", false);
            cs.setInt("Status", 0);
            cs.setBoolean("DeleteFlag", false);
            cs.setString("AccountHolder", name);
            cs.setString("AddressLine1", addressLine1);
            cs.setString("AddressLine2", addressLine2);
            cs.setString("AddressZip", addressZip);
            cs.setString("AddressCountry", addressCountry);
            cs.setString("CardNumber", cardNumber);
            cs.setString("CvvCode", cvvCode);
            cs.setDate("ExpirationDate", date);
            int rs = cs.executeUpdate();
            if(rs == 1){
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static UserActionForm getById(String accountId) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_GETBYID(?) }");
            cs.setString("AccountId", accountId);
            ResultSet rs = cs.executeQuery();
            rs.next();
            String accountid = rs.getString("AccountId");
            String name = rs.getString("AccountName");
            UserActionForm user = new UserActionForm();
            user.setAccountID(accountid);
            user.setName(name);
            return user;
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
    }
}
