package org.example.calculator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "calculatorController", value = "/calculators")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("action");
        System.out.println(text);
        req.getRequestDispatcher("/calculator.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String operation = req.getParameter("chon");
        try {
            int num1 = Integer.parseInt(req.getParameter("num1"));
            int num2 = Integer.parseInt(req.getParameter("num2"));
            int ket_qua = 0;
            switch (operation) {
                case "cong":
                    ket_qua = num1 + num2;
                    break;
                case "tru":
                    ket_qua = num1 - num2;
                    break;
                case "nhan":
                    ket_qua = num1 * num2;
                    break;
                case "chia":
                    ket_qua = num1 / num2;
                    break;
            }
            req.setAttribute("ket_qua",ket_qua);
            req.getRequestDispatcher("/calculator.jsp").forward(req, resp);
        }catch (Exception e){
            req.setAttribute("error",e.getMessage());
            req.getRequestDispatcher("/calculator.jsp").forward(req, resp);
        }


    }
}
