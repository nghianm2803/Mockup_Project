/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CarDAO;
import DAO.ParkinglotDAO;
import Model.Car;
import Model.Parkinglot;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pi Pi
 */
public class AddCarServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCarServlet at " + request.getContextPath() + "</h1>");
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
        ParkinglotDAO parkinglotDAO = new ParkinglotDAO();
        ArrayList<Parkinglot> listParkinglot = parkinglotDAO.getParkinglotList("", "");
        request.setAttribute("listParkinglot", listParkinglot);
        request.getRequestDispatcher("/View/AddCarScreen.jsp").forward(request, response);
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
        String licensePlate = request.getParameter("licensePlate");
        String carColor = request.getParameter("carColor");
        String carType = request.getParameter("carType_car");
        String company = request.getParameter("company");
        int parkId = Integer.parseInt(request.getParameter("parkId"));
        Car car = new Car(licensePlate, carColor, carType, company, parkId);
        CarDAO carDAO = new CarDAO();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<script type=\"text/javascript\">");
            if (carDAO.addCar(car)) {
                out.println("alert('Add Successful');");
                out.println("location='/Mock/ListCarServlet';");
            } else {
                out.println("alert('Add Fail: Cannot add duplicate LicensePlate "+licensePlate+"');");
                out.println("location='/Mock/AddCarServlet';");
            }
            out.println("</script>");
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
