/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.CommentActionForm;
import com.j2ee.BeanForm.SongActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author NguyenPC
 */
public class CommentDB {
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
    public static ArrayList<CommentActionForm> getAllComment(int songId){
        ArrayList<CommentActionForm> commentList = new ArrayList<>();
        Connection cn = ConnectDB.getConnect();
        
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_COMMENT_GETAll (?) }");
            cs.setInt("SongId", songId);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                CommentActionForm comment = new CommentActionForm();
                comment.setCommentId(rs.getInt("CommentId"));
                comment.setComment(rs.getString("Comment"));
                comment.setAccountId(rs.getString("AccountId"));
                comment.setAccountName(rs.getString("AccountName"));
                comment.setSongId(rs.getInt("SongId"));
                //comment.setTimeStam(rs.getDate("TimeStam"));
                commentList.add(comment);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return commentList;
    }
}
