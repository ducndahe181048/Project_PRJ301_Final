/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Category_Document_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.Document;

/**
 *
 * @author admin
 */
@WebServlet(name = "UpdateDocumentServlet", urlPatterns = {"/updateDocument"})
public class UpdateDocumentServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);

        if (session.getAttribute("account") != null) {
            String id = request.getParameter("id");

            Category_Document_DAO cd = new Category_Document_DAO();
            int cid = cd.getCidByDocument(id);
            Document d = cd.getDocumentById(id);

            List<Category> categoryList = cd.getAllCategory();
            Map<Integer, String> categoryMap = new HashMap<>();
            for (Category category : categoryList) {
                if (category.getId() == cid) {
                    categoryMap.put(cid, category.getName());
                }
            }

            request.setAttribute("document", d);
            request.setAttribute("cid", cid);
            request.setAttribute("name", categoryMap);
            request.getRequestDispatcher("updateDocument.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "You must login first!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String path = request.getParameter("path");
        Category_Document_DAO cd = new Category_Document_DAO();

        Document dNew = new Document(id, name, path);
        cd.updateDocument(dNew);

        response.sendRedirect("document");

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
