<%-- 
    Document   : SideBarItem
    Created on : Aug 27, 2020, 1:51:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="sidebar">
            <!--Employee manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-employee')" class="employee">
                <i class="fas fa-chart-bar"></i>
                Employee manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-employee">
                <a href="${pageContext.request.contextPath}/ListEmployeeServlet"><i class="fas fa-list-ul"></i>Employee List</a>
                <a href="${pageContext.request.contextPath}/AddEmployeeServlet"><i class="fas fa-plus"></i>Add Employee</a>
            </div>
            </div>
            
            <!--Car manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-carmanager')" class="carmanager">
                <i class="fas fa-car-alt"></i>
                Car manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-carmanager">
                <a href="${pageContext.request.contextPath}/ListCarServlet"><i class="fas fa-list-ul"></i>Car List</a>
                <a href="${pageContext.request.contextPath}/AddCarServlet"><i class="fas fa-plus"></i>Add Car</a>
            </div>
            </div>

            <!--Booking office manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-bookingmanager')" class="bookingmanager">
                <i class="fas fa-cart-plus"></i>
                Booking office manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-bookingmanager">
                <a href="${pageContext.request.contextPath}/ListBookingOfficeServlet"><i class="fas fa-list-ul"></i>Booking office list</a>
                <a href="${pageContext.request.contextPath}/AddBookingOfficeServlet"><i class="fas fa-plus"></i>Add Booking offline</a>
            </div>
            </div>

            <!--Park lot manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-parkingmanager')" class="parkingmanager">
                <i class="fas fa-map-marker-alt"></i>
                Park lot manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-parkingmanager">
                <a href="${pageContext.request.contextPath}/ListParkinglotServlet"><i class="fas fa-list-ul"></i>Parking lot list</a>
                <a href="${pageContext.request.contextPath}/AddParkinglotServlet"><i class="fas fa-plus"></i>Add Parking lot</a>
            </div>
            </div>
            
            <!--Trip manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-tripmanager')" class="tripmanager">
                <i class="fas fa-plane"></i>
                Trip manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-tripmanager">
                <a href="${pageContext.request.contextPath}/ListTripServlet"><i class="fas fa-list-ul"></i>Trip List</a>
                <a href="${pageContext.request.contextPath}/AddTripServlet"><i class="fas fa-plus"></i>Add Trip</a>
            </div>
            </div>

            <!--Ticket manager-->
            <div class="border_boxing">
            <button onclick="sideBarDropdown('dropdown-ticketmanager')" class="ticketmanager">
                <i class="fas fa-ticket-alt"></i>
                Ticket manager
                <i id="arrow" class='fas fa-angle-left'></i>
            </button>
            <div class="dropdown-ticketmanager">
                <a href="${pageContext.request.contextPath}/ListTicketServlet"><i class="fas fa-list-ul"></i>Ticket List</a>
            </div>
            </div>
        </div>
    </body>
</html>
