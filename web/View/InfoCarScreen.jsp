<%-- 
    Document   : InforCarScreen
    Created on : 18-Aug-2020, 10:36:11
    Author     : Computer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Car Page</title>
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
            <h2>Car List</h2>


            <!--Modify input field-->
            <form id="form" action="${pageContext.request.contextPath}\UpdateCarServlet" method="POST">
                <input hidden="" type="text" value="${car.licensePlate}" name="licensePlate">
                <table name="table" class="tableadd">
                    <tr>
                        <th>License plate<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="licensePlate" value="${car.licensePlate}" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Car type</th>
                        <td><input type="text"  name="carType_car" value="${car.carType}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Car color</th>
                        <td><input type="text"  name="carColor" value="${car.carColor}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Company<div id="tick_null">(*)</div></th>
                        <td>
                            <select name="company">
                                <option value="Phuong Trang" <c:if test="${car.company == 'Phuong Trang'}">selected</c:if>>Phương Trang</option>
                                <option value="Dong Ly" <c:if test="${car.company == 'Dong Ly'}">selected</c:if>>Đông Lý</option>
                                <option value="Hai Nam" <c:if test="${car.company == 'Hai Nam'}">selected</c:if>>Hải Nam</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Parking lot<div id="tick_null">(*)</div></th>
                            <td>
                                <select name="parkId">
                                <c:forEach items="${listParkinglot}" var="p">
                                    <option value="${p.parkId}" <c:if test="${p.parkId == car.parkId}">selected</c:if>>${p.parkName}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="cancel" type="button" onclick="location.href = '${pageContext.request.contextPath}/ListCarServlet'"><i class="fas fa-backward"></i>Cancel</button>
                        <button class="update" type="submit"><i class="fas fa-edit"></i>Update</button>
                        <button class="delete" type="button" onclick="delete_btn('${pageContext.request.contextPath}/DeleteCarServlet?licensePlate='+'${car.licensePlate}')"><i class="fas fa-trash"></i>Delete</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
