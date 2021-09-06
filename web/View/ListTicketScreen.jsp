<%-- 
    Document   : ListTicketScreen
    Created on : Aug 18, 2020, 3:23:07 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Ticket Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/PublicStyle.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https:////cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/Javascript/Jquery.js" charset="UTF-8" type="text/javascript"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <!--Header of the page-->
        <div class="header">
            <!--Trip Logo and Title-->
            <div class="top">
                <i class="fas fa-ticket-alt"></i>
                <p>Ticket</p>
            </div>

            <!--Account info-->
            <div class="topnav-right">
                <!--Display welcome user-->
                <p>Welcome</p>
                ...
                <!--Logout button-->
                <a href="#login"><i class="fas fa-sign-out-alt"></i>
                    Logout</a>
            </div>
        </div>

        <!--Side bar of the page-->
        <jsp:include page = "SideBarItem.jsp"/> 

        <!--Content of the page-->
        <div class="main">

            <!--Search Field -->
            <h2>Ticket list</h2>
            <form action="${pageContext.request.contextPath}\ListTicketServlet" method="POST">
                <div class="search-container">
                    <div class="groupsearch">
                        <button class="btnsearch" type="button" disabled><i class="fa fa-search"></i></button><input class="searchbar" type="text" placeholder="Ticket Search" name="search" value="${search}">
                    </div>
                    <div class="groupfilterby">
                        <button class="btnfilterby" type="button" disabled=><i class="fas fa-filter">Filter By</i></button><select class="selectfilter" name="filter">
                            <option value="licensePlate" <c:if test="${filter == 'licensePlate'}">selected</c:if>>License Plate</option>
                            <option value="destination" <c:if test="${filter == 'destination'}">selected</c:if>>Trip</option>
                        </select>
                    </div>
                    <button id="search" type="submit">Search</button>
                </div>
            </form>

            <!--Table List of Ticket-->
            <div class="tablesearch">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Trip</th>
                            <th>License plate</th>
                            <th>Customer</th>
                            <th>Booking time</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listTicket}" var="t">
                            <tr>
                                <td>${t.ticketId}</td>
                                <td>${t.trip.destination}</td>
                                <td>${t.licensePlate}</td>
                                <td>${t.customerName}</td>
                                <td>${t.bookingTime}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/DeleteTicketServlet?ticketId=${t.ticketId}" onclick="return confirm_del()"><i class="fas fa-trash-alt"></i>Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
