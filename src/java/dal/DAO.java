/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Cart;
import model.Category;
import model.Customer;
import model.Image;
import model.Item;
import model.Product;
import model.Size;
import model.User;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    //add customer
    public void insertCustomer(Customer c) {
        String sql = "insert into Customer values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getPhone());
            st.setString(3, c.getAddress());
            st.setString(4, c.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getLastCustomerId() {
        String sql = "select top 1 id from Customer order by id desc";
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

    //order-------------------------------------------
    public void addOrder(Customer c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order trước
            String sql = "insert into [Order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, c.getId());
            st.setInt(3, cart.getTotalMoney());
            st.executeUpdate();

            // lay id cua order vua add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            // add orderDetail
            while (rs.next()) {
                int orderId = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into OrderDetail values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            // cap nhat lai so luong sp
            String sql3 = "update Product set quantity= quantity-? where id =?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // product--------------------------
    public void insertProduct(String name, int categoryId, int brandId, String images, int price, int quantity, String releaseDate) {
        String sql = "insert into Product values(?, ?, ?,?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, categoryId);
            st.setInt(3, brandId);
            st.setString(4, images);
            st.setInt(5, price);
            st.setInt(6, quantity);
            st.setString(7, releaseDate);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> searchProduct(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
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

    

    public Product getProductById(int product_id) {
        String sql = "select * from Product where id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getListProductByPage(List<Product> list, int start, int end) {
        List<Product> products = new ArrayList<>();
        if (list == null) {
            return null;
        }
        for (int i = start; i < end; i++) {
            products.add(list.get(i));
        }
        return products;
    }

    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
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

    public List<Product> getAllProduct(int[] categoryId, int[] brandId, String[] price, String keyword, String filterRight) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product where 1=1";

        if (keyword != null) {
            sql += "and name like N'%" + keyword + "%'";
        }
        if (categoryId != null) {
            sql += " and categoryId in (";
            for (int i = 0; i < categoryId.length; i++) {
                sql += categoryId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += ")";
            }
        }
        if (brandId != null) {
            sql += " and brandId in (";
            for (int i = 0; i < brandId.length; i++) {
                sql += brandId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += ")";
            }
        }
        if (price != null) {
            switch (price[0]) {
                case "1":
                    sql += " and price between 50000 and 150000";
                    break;
                case "2":
                    sql += " and price between 150000 and 500000";
                    break;
                case "3":
                    sql += " and price between 500000 and 1500000";
                    break;
                case "4":
                    sql += " and price between 1500000 and 5000000";
                    break;
                case "5":
                    sql += " and price >5000000";
                    break;
            }
            for (int i = 1; i < price.length; i++) {
                switch (price[i]) {
                    case "1":
                        sql += " or price between 50000 and 150000";
                        break;
                    case "2":
                        sql += " or price between 150000 and 500000";
                        break;
                    case "3":
                        sql += " or price between 500000 and 1500000";
                        break;
                    case "4":
                        sql += " or price between 1500000 and 5000000";
                        break;
                    case "5":
                        sql += " or price >5000000";
                        break;
                }
            }

        }

        try {
            switch (filterRight) {
                case "Low to high":
                    sql += " order by price asc";
                    break;
                case "High to low":
                    sql += " order by price desc";
                    break;
                case "New arrival":
                    sql += " order by releaseDate desc";
                    break;
            }
        } catch (NullPointerException e) {
            System.out.println(filterRight + "------------------------");
            System.out.println(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(filterRight + "-------------------------------------------------------");
            System.out.println(e);
        }
        if (products.isEmpty()) {
            return null;
        } else {
            return products;
        }
    }

    public List<Product> getProductByBrandId(int id) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product where brandId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public List<Product> getProductByCategoryId(int id) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product where categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String category = getCategory(rs.getInt(3));
                String brand = getbrand(rs.getInt(4));
                Product p = new Product(rs.getInt(1), rs.getString(2), category, brand, rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public List<Image> getImageById(int id_product) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from Image where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id_product);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Size> getSizeById(int id_product) {
        List<Size> list = new ArrayList<>();
        String sql = "select * from Size where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id_product);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size i = new Size(rs.getInt(1), rs.getInt(2), rs.getString(3));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> Categories = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                Categories.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Categories;
    }

    public String getCategory(int id) {
        String sql = "select * from Category where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            String t = "";
            while (rs.next()) {
                t = rs.getString(2);
            }
            return t;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Brand> getAllBrand() {
        List<Brand> brands = new ArrayList<>();
        String sql = "select * from Brand";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand c = new Brand(rs.getInt(1), rs.getString(2));
                brands.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brands;
    }

    public String getbrand(int id) {
        String sql = "SELECT * FROM Brand where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            String t = "";
            while (rs.next()) {
                t = rs.getString(2);
            }
            return t;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
