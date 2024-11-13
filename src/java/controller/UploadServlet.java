/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Category_Document_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import model.Category;
import model.Document;

/**
 *
 * @author admin
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/upload"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
public class UploadServlet extends HttpServlet {

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
            out.println("<title>Servlet UploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
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

        Category_Document_DAO cd = new Category_Document_DAO();
        List<Category> list = cd.getAllCategory();
        request.setAttribute("listCategory", list);
        request.getRequestDispatcher("addDocument.jsp").forward(request, response);
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
        response.setContentType("text/plain;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String cid_raw = request.getParameter("categoryName");
            int cid = Integer.parseInt(cid_raw);
            
            HttpSession session = request.getSession();
            String uploadBy = (String) session.getAttribute("displayname");

            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
//            String uploadPath = "D:/Java/Project_PRJ301_Final/web" + File.separator + folderName;
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePath = request.getPart("path");
            String fileName = filePath.getSubmittedFileName();
            String path = folderName + File.separator + fileName;
            InputStream is = filePath.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

            Category_Document_DAO cd = new Category_Document_DAO();
            Document d = cd.getDocumentById(id);

            if (d == null) {
                Document dNew = new Document(id, name, path, uploadBy, cid);
                cd.insertDocument(dNew);
                request.getRequestDispatcher("document").forward(request, response);
            } else {
                request.setAttribute("error", "ID " + id + " existed!");
                doGet(request, response);
            }
            
            request.getRequestDispatcher("document").forward(request, response);
        } catch(IOException | ServletException e) {
            System.out.println(e);
        }
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
