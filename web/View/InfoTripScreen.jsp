<%-- 
    Document   : InfoTripList
    Created on : 14-Aug-2020, 17:24:20
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Trip Page</title>
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
            <h2>Trip Information</h2>

            <!--Modify input field-->
            <form id="form" action="${pageContext.request.contextPath}\UpdateTripServlet" method="POST">
                <input hidden="" type="text" value="${trip.tripId}" name="tripId">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Destination<div id="tick_null">(*)</div></th>
                    <td><input type="text" name="destination" value="${trip.destination}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Departure time<div id="tick_null">(*)</div></th>
                    <td><input type="text" name="departureTime" value="${trip.departureTime}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Driver<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="driver" value="${trip.driver}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Car type<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="carType" value="${trip.carType}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Maximum car ticket number<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="maximumOnlineTicketNumber" value="${trip.maximumOnlineTicketNumber}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Departure date<div id="tick_null">(*)</div></th>
                    <td><input id="departureDate" type="date"  name="departureDate" value="${trip.departureDate}"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="cancel" type="button" onclick="location.href = '${pageContext.request.contextPath}/ListTripServlet'"><i class="fas fa-backward"></i>Cancel</button>
                        <button class="update" type="submit"><i class="fas fa-edit"></i>Update</button>
                        <button class="delete" type="button" onclick="delete_btn('${pageContext.request.contextPath}/DeleteTripServlet?tripId='+${trip.tripId})"><i class="fas fa-trash"></i>Delete</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
