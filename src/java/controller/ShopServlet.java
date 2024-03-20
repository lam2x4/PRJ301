/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "shop", urlPatterns = {"/shop"})

public class ShopServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");     
        String[] categoryId_raw = request.getParameterValues("categoryIdm");
        String[] brandId_raw = request.getParameterValues("brandIdm");

        int[] categoryId = convertInt(categoryId_raw);
        int[] brandId = convertInt(brandId_raw);

        DAO d = new DAO();
        //list.get(0).getImages().get(0).getImage()
        // category
        List<Category> listCategory = d.getAllCategory();
        request.setAttribute("dataCategory", listCategory);

        boolean[] cateId = new boolean[listCategory.size()];
        for (int i = 0; i < cateId.length; i++) {
            if (ischeck(listCategory.get(i).getId(), categoryId)) {
                cateId[i] = true;
            } else {
                cateId[i] = false;
            }
        }
        request.setAttribute("categoryId", cateId);
        //brand
        List<Brand> listBrand = d.getAllBrand();
        request.setAttribute("dataBrand", listBrand);

        boolean[] braId = new boolean[listBrand.size()];
        for (int i = 0; i < braId.length; i++) {
            if (ischeck(listBrand.get(i).getId(), brandId)) {
                braId[i] = true;
            } else {
                braId[i] = false;
            }
        }
        request.setAttribute("brandId", braId);

        //price
        String[] listPrice = {"1", "2", "3", "4", "5"};
        String[] price = request.getParameterValues("price");
        boolean[] priceTick = {false, false, false, false, false};
        if (price != null) {
            for (int i = 0; i < priceTick.length; i++) {
                for (String price1 : price) {
                    if (listPrice[i].equals(price1)) {
                        priceTick[i] = true;
                    }
                }
            }
            request.setAttribute("priceTick", priceTick);
        }

        //lọc bên phải
        String filterRight = (String) request.getParameter("filterRight");
        if (filterRight == null) {
            filterRight = "Default";
        }

        request.setAttribute("filterRight", filterRight);

        String keyword =  request.getParameter("searchProduct");
        List<Product> dataProduct = d.getAllProduct(categoryId, brandId, price, keyword, filterRight);

        int sizeList = 0;
        if (dataProduct != null) {
            sizeList = dataProduct.size();
        }

        request.setAttribute("sizeList", sizeList);

        //lọc bên phải
        // xử lý page
        int page, numberpage = 12;
        int size = sizeList;
        int num = (size % 12 == 0 ? (size / 12) : ((size / 12) + 1)); //so trang
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);
        List<Product> list1 = d.getListProductByPage(dataProduct, start, end);

// current link ---------------------------
        String uri = request.getRequestURI();
        if (request.getQueryString() != null) {
            uri += "?" + request.getQueryString() + "&";
        } else {
            uri += "?";
        }
        if (uri.contains("IdP")) {
            int index = uri.indexOf("IdP");
            uri = uri.substring(0, index);
        }
        if (uri.contains("page")) {
            int index = uri.indexOf("page");
            uri = uri.substring(0, index);
        }
        if (uri.contains("filterRight")) {
            int index = uri.indexOf("filterRight");
            uri = uri.substring(0, index);
        }

        request.setAttribute("url1", uri);

        // shop cart------------------------------------
        List<Product> listAll = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String idPro = request.getParameter("IdP");
        if (idPro != null) {
            if (txt.isEmpty()) {
                txt = idPro + ":" + 1;
            } else {
                txt = txt + "/" + idPro + ":" + 1;
            }
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60);
        response.addCookie(c);
        Cart cart = new Cart(txt, listAll);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("sizeCart", n);
        
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("data", list1);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    private int[] convertInt(String[] groupId_raw) {
        int[] groupId = null;
        if (groupId_raw != null) {
            groupId = new int[groupId_raw.length];
            for (int i = 0; i < groupId.length; i++) {
                groupId[i] = Integer.parseInt(groupId_raw[i]);
            }
        }
        return groupId;
    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
