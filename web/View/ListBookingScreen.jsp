<%-- 
    Document   : ListBookingScreen
    Created on : 17-Aug-2020, 15:25:39
    Author     : Computer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Booking Page</title>
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
            <!--Booking Logo and Title-->
            <div class="top_booking">
                <i class="fas fa-cart-plus"></i>
                <p>Booking office</p>
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
            <h2>Booking office List</h2>
            <form action="${pageContext.request.contextPath}\ListBookingOfficeServlet" method="POST">
                <div class="search-container">
                    <div class="groupsearch">
                        <button class="btnsearch" type="button" disabled><i class="fa fa-search"></i></button><input class="searchbar" type="text" placeholder="User Search" name="search" value="${search}">
                    </div>
                    <div class="groupfilterby">
                        <button class="btnfilterby" type="button" disabled=><i class="fas fa-filter">Filter By</i></button><select class="selectfilter" name="filter">
                            <option value="officeName" <c:if test="${filter == 'officeName'}">selected</c:if>>Name</option>
                            <option value="destination" <c:if test="${filter == 'destination'}">selected</c:if>>Trip</option>
                        </select>
                    </div>
                    <button id="search" type="submit">Search</button>
                </div>
            </form>

            <!--Table List of Employee-->
            <div class="tablesearch">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Booking office</th>
                            <th>Trip</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listBookingOffice}" var="bo">
                            <tr>
                                <td>${bo.officeId}</td>
                                <td>${bo.officeName}</td>
                                <td>${bo.trip.destination}</td>
                                <td><a href="${pageContext.request.contextPath}/InfoBookingOfficeServlet?officeId=${bo.officeId}"><i class="fas fa-eye"></i>View</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
