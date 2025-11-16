package org.example.manager_user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.manager_user.entity.User;
import org.example.manager_user.service.CountryService;
import org.example.manager_user.service.ICountryService;
import org.example.manager_user.service.IUserService;
import org.example.manager_user.service.UserService;

import java.io.IOException;

@WebServlet(name = "UserController", value = "/users")
public class UserController extends HttpServlet {
    private IUserService userService = new UserService();
    private ICountryService countryService = new CountryService();

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("countrys", countryService.getAll());
        req.setAttribute("users", userService.getAll());
    }

    private void showUpdate(int id, HttpServletRequest req, HttpServletResponse resp) {

        User user = userService.getUserById(id);
        if (user == null) {
            return;
        }
        System.out.println(user.getId());
        req.setAttribute("name", user.getName());
        req.setAttribute("id_country", user.getId_country());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                showList(req, resp);
                break;
            case "edit":
                showList(req, resp);
                int id = Integer.parseInt(req.getParameter("id"));
                showUpdate(id, req, resp);
                break;
            case "delete":
                int id_delete = Integer.parseInt(req.getParameter("id"));
                userService.delete(id_delete);
                resp.sendRedirect(req.getContextPath() + "/users?action=list");
                return; // kết thúc xử lý
        }
        req.getRequestDispatcher("/views/user/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                String name = req.getParameter("name");
                int id_country = Integer.parseInt(req.getParameter("country"));
                User user = new User(name, id_country);
                System.out.println(userService.add(user));
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                String name_update = req.getParameter("name");
                int id_country_update = Integer.parseInt(req.getParameter("country"));
                User user1 = new User(id, name_update, id_country_update);
                userService.update(user1);
                break;
        }
        resp.sendRedirect("/users?action=list");

    }
}
