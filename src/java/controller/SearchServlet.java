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
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.Document;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);

        if (session.getAttribute("account") != null) {
            Category_Document_DAO cd = new Category_Document_DAO();

            List<Category> categoryList = cd.getAllCategory();
            Map<Integer, String> categoryMap = new HashMap<>();
            for (Category category : categoryList) {
                categoryMap.put(category.getId(), category.getName());
            }

            List<Category> list = cd.getAllCategory();
            request.setAttribute("categoryName", categoryMap);
            request.setAttribute("category", list);
            String cid_raw = request.getParameter("cid");
            String fromDate_raw = request.getParameter("fromDate");
            String toDate_raw = request.getParameter("toDate");
            Date fromDate, toDate;
            int cid;
            try {
                cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
                fromDate = ((fromDate_raw == null) || (fromDate_raw.equals("")) ? null : Date.valueOf(fromDate_raw));
                toDate = ((toDate_raw == null) || (toDate_raw.equals("")) ? null : Date.valueOf(toDate_raw));
                List<Document> document = cd.search(cid, fromDate, toDate);
                request.setAttribute("document", document);
                request.getRequestDispatcher("document.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
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
        processRequest(request, response);
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
