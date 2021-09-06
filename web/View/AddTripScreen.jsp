<%-- 
    Document   : AddTripScreen
    Created on : 14-Aug-2020, 08:11:44
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Trip Page</title>
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
            <h2>Add Trip</h2>

            <!--Input field-->
            <form id="form" action="${pageContext.request.contextPath}\AddTripServlet" method="POST">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Destination<div id="tick_null">(*)</div></th>
                    <td><input type="text" name="destination" placeholder="Enter destination"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Departure time<div id="tick_null">(*)</div></th>
                    <td><input type="text" name="departureTime" placeholder="--:-- --"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Driver<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="driver" placeholder="Enter driver"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Car type<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="carType" placeholder="Enter car type"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Maximum car ticket number<div id="tick_null">(*)</div></th>
                    <td><input type="text"  name="maximumOnlineTicketNumber" placeholder="0"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Departure date<div id="tick_null">(*)</div></th>
                    <td><input id="departureDate" type="date"  name="departureDate"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="reset" type="button" onclick="resetfunction()"><i class="fas fa-undo"></i>Reset</button>
                        <button class="add" type="submit"><i class="fas fa-plus"></i>Add</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
