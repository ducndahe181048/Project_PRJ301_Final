/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 *
 * @author admin
 */
@WebServlet(name="DownloadServlet", urlPatterns={"/download"})
public class DownloadServlet extends HttpServlet {
    
    public static int BUFFER_SIZE = 1024 * 100;
    public static final String UPLOAD_DIR = "resources";
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet DownloadServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fileName = request.getParameter("path");
        String applicationPath = getServletContext().getRealPath("");
//        String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
        String filePath = applicationPath + File.separator + fileName;
        
        File file = new File(filePath);
        if(file.exists()) {
            String mimeType = "application/octet-stream";
            response.setContentType(mimeType);
            
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; fileName=\"%s\"", file.getName());
            response.setHeader(headerKey, headerValue);
            
            try {
                OutputStream os = response.getOutputStream();
                FileInputStream fis = new FileInputStream(file);
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                while((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            } catch(IOException e) {
                System.out.println(e);
            }
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
