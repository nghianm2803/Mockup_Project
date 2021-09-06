<%-- 
    Document   : TripListScreen
    Created on : 14-Aug-2020, 14:35:26
    Author     : Computer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Trip Page</title>
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
                <i class="fas fa-plane"></i>
                <p>Trip</p>
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
            <h2>Trip List</h2>
            <form action="${pageContext.request.contextPath}\ListTripServlet" method="POST">
                <div class="search-container">
                    <div class="groupsearch">
                        <button class="btnsearch" type="button" disabled><i class="fa fa-search"></i></button><input class="searchbar" type="text" placeholder="User Search" name="search" value="${search}">
                    </div>
                    <button id="search" type="submit">Search</button>
                </div>
            </form>

            <!--Table List of Trip-->
            <div class="tablesearch">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Destination</th>
                            <th>Departure time</th>
                            <th>Driver</th>
                            <th>Car type</th>
                            <th>Booked ticket number</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listTrip}" var="t">
                            <tr>
                                <td>${t.tripId}</td>
                                <td>${t.destination}</td>
                                <td>${t.departureTime}</td>
                                <td>${t.driver}</td>
                                <td>${t.carType}</td>
                                <td>${t.bookedTicketNumber}</td>
                                <td><a href="${pageContext.request.contextPath}/InfoTripServlet?tripId=${t.tripId}"><i class="fas fa-edit"></i>Update</a>
                                    <a href="${pageContext.request.contextPath}/DeleteTripServlet?tripId=${t.tripId}" onclick="return confirm_del()"><i class="fas fa-trash-alt"></i>Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
