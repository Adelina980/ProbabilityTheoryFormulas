package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate/urn_model_all_marked_items")
public class urn_model_all_marked_items extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Double formula = (Double) request.getSession().getAttribute("formula");
        request.setAttribute("formula",formula);
        getServletContext().getRequestDispatcher("/WEB-INF/views/mainPage.jsp").forward(request, response);
    }
}