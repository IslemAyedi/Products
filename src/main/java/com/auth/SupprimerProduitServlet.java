package com.auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SupprimerProduitServlet")
public class SupprimerProduitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProduitDAO produitDAO = new ProduitDAO();
        produitDAO.supprimerProduit(id);

        response.sendRedirect("index.jsp"); // Recharge la page
    }
}
