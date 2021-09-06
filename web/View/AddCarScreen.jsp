<%-- 
    Document   : AddCarScreen
    Created on : 18-Aug-2020, 09:50:29
    Author     : Computer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Car Page</title>
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
            <!--Car Logo and Title-->
            <div class="top">
                <i class="fas fa-car-alt"></i>
                <p>Car</p>
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
            <h2>Add Car</h2>

            <!--Input field-->
            <form id="form" action="${pageContext.request.contextPath}\AddCarServlet" method="POST">
                <table name="table" class="tableadd">
                    <tr>
                        <th>License plate <div id="tick_null">(*)</div></th>
                    <td><input type="text" name="licensePlate" placeholder="Enter license plate"></td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Car type</th>
                        <td><input type="text"  name="carType_car" placeholder="Enter car type"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Car color</th>
                        <td><input type="text"  name="carColor" placeholder="Enter car color"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Company <div id="tick_null">(*)</div></th>
                    <td>
                        <select name="company">
                            <option value="Phuong Trang">Phương Trang</option>
                            <option value="Dong Ly">Đông Lý</option>
                            <option value="Hai Nam">Hải Nam</option>
                        </select>
                    </td>
                    <td></td>
                    </tr>
                    <tr>
                        <th>Parking lot <div id="tick_null">(*)</div></th>
                    <td>
                        <select name="parkId">
                            <c:forEach items="${listParkinglot}" var="p">
                                <option value="${p.parkId}">${p.parkName}</option>
                            </c:forEach>
                        </select>
                    </td>
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
