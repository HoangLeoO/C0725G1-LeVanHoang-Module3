package org.example.manager_prodcut.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.manager_prodcut.entity.Product;
import org.example.manager_prodcut.service.IProductService;
import org.example.manager_prodcut.service.ProductService;

import java.io.IOException;

@WebServlet(name = "ProductController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    private static final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                req.setAttribute("products", productService.getAll());
                req.getRequestDispatcher("views/product/list.jsp").forward(req, resp);
                break;
            case "add":
                req.getRequestDispatcher("views/product/add.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("product", productService.getProductById(id));
                req.getRequestDispatcher("views/product/edit.jsp").forward(req, resp);
                break;
            case "delete":
                int id_delete = Integer.parseInt(req.getParameter("id"));
                productService.deleteProduct(id_delete);
                resp.sendRedirect("/products?action=list");
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(req, resp);
                break;
            case "edit":
                edit(req, resp);
                break;
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        Product product = new Product(id, name, price);
        productService.addProduct(product);
        try {
            resp.sendRedirect("/products?action=add");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        Product product = new Product(id, name, price);
        productService.updateProduct(product);
        try {
            resp.sendRedirect("/products?action=edit&id=" + id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
