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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author NguyenPC
 */
public class CommentDB {
    
    public static ArrayList<CommentActionForm> getAllComment(){
        ArrayList<CommentActionForm> commentList = new ArrayList<>();
        Connection cn = ConnectDB.getConnect();
        
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_COMMENT_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                CommentActionForm comment = new CommentActionForm();
                comment.setCommentId(rs.getInt("CommentId"));
                comment.setComment(rs.getString("Comment"));
                comment.setAccountId(rs.getString("AccountId"));
                comment.setAccountName(rs.getString("AccountName"));
                comment.setSongId(rs.getInt("SongId"));
                comment.setTimeStam(rs.getDate("TimeStam"));
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
