/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    // check co tai khoan chua
    public User check(String email, String password) {
        String sql = "select * from Users\n"
                + "where email = ?\n"
                + "and  password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User a = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getString("name"),
                        rs.getString("gender"), rs.getString("dob"), rs.getString("phone"), rs.getString("address"), rs.getInt("isAdmin"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkEmailExist(String email) {
        String sql = "select * from Users where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // add a new user
    public void createUser(User u) {
        String sql = "insert into Users values(?, ?, ?, ?, null,?,?,'0')";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getEmail());
            st.setString(2, u.getPassword());
            st.setString(3, u.getName());
            st.setString(4, u.getGender());
            st.setString(5, u.getPhone());
            st.setString(6, u.getAddress());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public int getIdUserByEmail(String email) {
        String sql = "select * from Users where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            int t = 0;
            while (rs.next()) {
                t = t + rs.getInt(1);
            }
            return t;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    //
    public User checkAdmin(String email, String p) {
        User u = check(email, p);
        if (u == null) {
            return null;
        }
        String sql = "select * from User_permision where id_user= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getInt("id_per") != 3) {
                    return u;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getAll() {
        List<User> products = new ArrayList<>();
        String sql = "select * from Users where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User p = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        if (products.isEmpty()) {
            return null;
        } else {
            return products;
        }
    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();

    }
}
