package org.example.new_manager_product.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.new_manager_product.dto.ProductDTO;
import org.example.new_manager_product.entity.Product;
import org.example.new_manager_product.serivce.CategoryService;
import org.example.new_manager_product.serivce.ICategoryService;
import org.example.new_manager_product.serivce.IProductService;
import org.example.new_manager_product.serivce.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")
public class ProductController extends HttpServlet {
    protected ICategoryService categoryService = new CategoryService();
    protected IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list" -> showList(req, resp);
            case "add" -> showAdd(req, resp);
            case "edit" -> showEdit(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add" -> save(req, resp);
            case "edit" -> edit(req, resp);
            case "delete" -> delete(req, resp);
            case "search" -> search(req, resp);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("search_category", categoryService.getAll());

        int pageIndex = 1; // mặc định trang 1
        int pageSize = 5;  // số bản ghi mỗi trang
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            try {
                pageIndex = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                pageIndex = 1;
            }
        }

        // Lấy danh sách sản phẩm theo trang
        List<ProductDTO> products = productService.getProductsByPage(pageIndex, pageSize);
        int totalRecords = productService.countProducts();
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        req.setAttribute("products", products);
        req.setAttribute("currentPage", pageIndex);
        req.setAttribute("totalPages", totalPages);

        try {
            req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void search(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("search_category", categoryService.getAll());
        String name_category = req.getParameter("keyword1");
        String name_product = req.getParameter("keyword2");
        if (name_category == null) name_category = "";
        if (name_product == null) name_product = "";
        req.setAttribute("products", productService.getProductByProductAndCategory(name_category, name_product));
        try {
            req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id_product"));
        ProductDTO productDTO = productService.getProductById(id);
        req.setAttribute("name_product", productDTO.getName_product());
        req.setAttribute("price", productDTO.getPrice());
        req.setAttribute("id_category", productDTO.getId_category());
        req.setAttribute("name_category", productDTO.getName_category());
        req.setAttribute("category", categoryService.getAll());
        try {
            req.getRequestDispatcher("/views/edit.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("category", categoryService.getAll());
        try {
            req.getRequestDispatcher("/views/add.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String name_product = req.getParameter("name_product");
        double price = Double.parseDouble(req.getParameter("price"));
        int id_category = Integer.parseInt(req.getParameter("id_category"));
        boolean isAdd = productService.add(new Product(name_product, price, id_category));
        try {
            resp.sendRedirect("products?action=list&isAdd= " + isAdd);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id_product = Integer.parseInt(req.getParameter("id"));
        String name_product = req.getParameter("name_product");
        double price = Double.parseDouble(req.getParameter("price"));
        int id_category = Integer.parseInt(req.getParameter("id_category"));
        boolean isEdit = productService.update(new Product(id_product, name_product, price, id_category));
        resp.sendRedirect("/products?action=list&isEdit=" + isEdit);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id_product = Integer.parseInt(req.getParameter("id_product"));
        boolean isDelete = productService.deleteById(id_product);
        resp.sendRedirect("/products?action=list&isDelete=" + isDelete);
    }

}
