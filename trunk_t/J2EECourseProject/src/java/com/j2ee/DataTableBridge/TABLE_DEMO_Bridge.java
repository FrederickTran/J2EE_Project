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

import com.j2ee.BeanForm.UserActionform;
import java.sql.*;
import java.util.List;

public class TABLE_DEMO_Bridge {
    public static boolean checkLogin(String id, String password) throws Exception
    {
        if(id == null || id.equals("") || password == null || password.equals("")){
            return false;
        }
	List<UserActionform> userList = ConnectDB.getAllUser();
        for (int i = 0; i < userList.size(); i++) {
            if(id.equals(userList.get(i).getAccountID()) && password.equals(userList.get(i).getPassword())){
                return true;
            }
        }
        return false;
    }
}
