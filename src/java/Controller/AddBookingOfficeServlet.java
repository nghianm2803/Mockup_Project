/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookingDAO;
import DAO.TripDAO;
import Model.Bookingoffice;
import Model.Trip;
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
public class AddBookingOfficeServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBookingOfficeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookingOfficeServlet at " + request.getContextPath() + "</h1>");
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
        TripDAO tripDAO = new TripDAO();
        ArrayList<Trip> listTrip = tripDAO.getListTrip("");
        request.setAttribute("listTrip", listTrip);
        request.getRequestDispatcher("/View/AddBookingScreen.jsp").forward(request, response);
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
        String endContractDeadline = request.getParameter("endContractDeadline");
        String officeName = request.getParameter("officeName");
        String officePhone = request.getParameter("officePhone");
        String officePlace = request.getParameter("officePlace");
        int officePrice = Integer.parseInt(request.getParameter("officePrice"));
        String startContractDeadline = request.getParameter("startContractDeadline");
        int tripId = Integer.parseInt(request.getParameter("tripId"));
        Bookingoffice bookingoffice = new Bookingoffice(0, endContractDeadline, officeName, officePhone, officePlace, officePrice, startContractDeadline, tripId);
        BookingDAO bookingDAO = new BookingDAO();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<script type=\"text/javascript\">");
            if (bookingDAO.addBookingOffice(bookingoffice)) {
                out.println("alert('Add Successful');");
                out.println("location='/Mock/ListBookingOfficeServlet';");
            } else {
                out.println("alert('Add Fail');");
                out.println("location='/Mock/AddBookingOfficeServlet';");
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
