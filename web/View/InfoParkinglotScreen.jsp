<%-- 
    Document   : InfoParkinglotScreen
    Created on : Aug 18, 2020, 9:18:57 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Parking Lot Page</title>
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
                <i class="fas fa-map-marker-alt"></i>
                <p>Parking lot</p>
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
            <h2>Parking lot Information</h2>

            <!--Input field-->
            <form id="form" action="${pageContext.request.contextPath}\UpdateParkinglotServlet" method="POST">
                <input hidden="" type="text" value="${parkinglot.parkId}" name="parkId">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Parking name<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="parkName" value="${parkinglot.parkName}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Place <div id="tick_null">(*)</div></th>
                        <td>
                            <select name="parkPlace">
                                <option value="East" <c:if test="${parkinglot.parkPlace == 'East'}">selected</c:if>>East</option>
                                <option value="West" <c:if test="${parkinglot.parkPlace == 'West'}">selected</c:if>>West</option>
                                <option value="South" <c:if test="${parkinglot.parkPlace == 'South'}">selected</c:if>>South</option>
                                <option value="North" <c:if test="${parkinglot.parkPlace == 'North'}">selected</c:if>>North</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Area <div id="tick_null">(*)</div></th>
                        <td><input type="text" name="parkArea" value="${parkinglot.parkArea}"></td>
                        <td><b>(m2)</b></td>
                    </tr>
                    <tr>
                        <th>Price <div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="parkPrice" value="${parkinglot.parkPrice}"></td>
                        <td><b>(VNĐ)</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="cancel" type="button" onclick="location.href = '${pageContext.request.contextPath}/ListParkinglotServlet'"><i class="fas fa-backward"></i>Cancel</button>
                        <button class="update" type="submit"><i class="fas fa-edit"></i>Update</button>
                        <button class="delete" type="button" onclick="delete_btn('${pageContext.request.contextPath}/DeleteParkinglotServlet?parkId='+${parkinglot.parkId})"><i class="fas fa-trash"></i>Delete</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
