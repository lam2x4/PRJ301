/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import model.Category;
import model.User;

/**
 *
 * @author ADMIN
 */
public class adminDAO extends DBContext{
    public static void main(String[] args) {
        adminDAO a = new adminDAO();
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String[] h = date.split("-");
        int t=0;
        try{
            t = Integer.parseInt(h[1]);
        }catch(Exception e){
            System.out.println(e);
        }
        System.out.println(t);
    }
    
    public int getNumberOrder(){
        String sql="select count(*) from [Order] where date= ?";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1 , date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
     public int getAllOrder(){
        String sql="select count(*) from [Order] ";
        
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public int getDailyTotalMoney(){
        String sql ="select sum(o.totalmoney)\n" +
                "from [Order] o where date = ?";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1 , date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public int getMonthlyTotalMoney(){
        String sql ="select sum(o.totalmoney) from [Order] o where MONTH(date) = ?";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String[] h = date.split("-");
        int t=0;
        try{
            t = Integer.parseInt(h[1]);
        }catch(Exception e){
            System.out.println(e);
        }
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1 , t);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public void updateProfile(User u){
        String sql = "update Users\n" +
"set name =?, gender = ?, dob= ?, phone =?, address=?\n" +
"where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getName());
            st.setString(2, u.getGender());
            st.setString(3, u.getDob());
            st.setString(4, u.getPhone());
            st.setString(5, u.getAddress());
            st.setInt(6, u.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void insertCate(String name){
        String sql = "insert into Category values(?)";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateCate(Category c){
        String sql ="update Category set name= ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setInt(2, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteCate(int id){
        String sql = "delete from Category where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    // Product
    
    public void deleteProduct(int id){
        String sql = "delete from Product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateProduct(int id, String name,int categoryId,int brandId,String image,int price,int quantity,String releaseDate){
        String sql="update Product\n" +
"set name =?, categoryId =?, brandId=?, image =?, price=?, quantity=?, releaseDate=?\n" +
"where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, categoryId);
            st.setInt(3, brandId);
            st.setString(4, image);
            st.setInt(5, price);
            st.setInt(6, quantity);
            st.setString(7, releaseDate);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
