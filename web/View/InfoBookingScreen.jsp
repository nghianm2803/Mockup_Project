<%-- 
    Document   : InfoBookingScreen
    Created on : 17-Aug-2020, 16:51:25
    Author     : Computer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Booking Office Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/PublicStyle.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/Javascript/Jquery.js" charset="UTF-8" type="text/javascript"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <!--Header of the page-->
        <div class="header">
            <!--Booking Logo and Title-->
            <div class="top">
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
            <h2>Info Booking Office</h2>

            <!--Input field-->
            <form id="form" action="${pageContext.request.contextPath}\UpdateBookingOfficeServlet" method="POST">
                <input hidden="" type="text" value="${bookingoffice.officeId}" name="officeId">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Booking office name<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="officeName" value="${bookingoffice.officeName}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Trip<div id="tick_null">(*)</div></th>
                        <td>
                            <select name="tripId">
                                <c:forEach items="${listTrip}" var="t">
                                    <option value="${t.tripId}" <c:if test="${bookingoffice.tripId == t.tripId}">selected</c:if>>${t.destination}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Phone number<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="officePhone" value="${bookingoffice.officePhone}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Place<div id="tick_null">(*)</div></th>
                        <th>
                            <select name="officePlace">
                                <option value="Counter 1" <c:if test="${bookingoffice.officePlace == 'Counter 1'}">selected</c:if>>Counter 1</option>
                                <option value="Counter 2" <c:if test="${bookingoffice.officePlace == 'Counter 2'}">selected</c:if>>Counter 2</option>
                                <option value="Counter 3" <c:if test="${bookingoffice.officePlace == 'Counter 3'}">selected</c:if>>Counter 3</option>
                                </select>
                            </th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Price<div id="tick_null">(*)</div></th>
                            <td><input type="text" name="officePrice" value="${bookingoffice.officePrice}"></td>
                        <td><b>(VND)</b></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Contract deadline<div id="tick_null">(*)</div></th>
                        <td>
                            <div class="groupdate">
                                <button class="btndate" type="button" disabled>From date</button><input id="startDate" type="date" name="startContractDeadline" value="${bookingoffice.startContractDeadline}">
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td><div class="groupdate">
                                <button class="btndate" type="button" disabled>To date</button><input id="endDate" type="date" name="endContractDeadline" value="${bookingoffice.endContractDeadline}">
                            </div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="cancel" type="button" onclick="location.href = '${pageContext.request.contextPath}/ListBookingOfficeServlet'"><i class="fas fa-backward"></i>Cancel</button>
                        <button class="update" type="submit"><i class="fas fa-edit"></i>Update</button>
                        <button class="delete" type="button" onclick="delete_btn('${pageContext.request.contextPath}/DeleteBookingOfficeServlet?officeId=' +${bookingoffice.officeId})"><i class="fas fa-trash"></i>Delete</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
