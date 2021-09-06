<%-- 
    Document   : ListParkinglotScreen
    Created on : Aug 18, 2020, 9:39:33 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Parking Lot Page</title>
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

            <!--Search Field -->
            <h2>Parking lot list</h2>
            <form action="${pageContext.request.contextPath}\ListParkinglotServlet" method="POST">
                <div class="search-container">
                    <div class="groupsearch">
                        <button class="btnsearch" type="button" disabled><i class="fa fa-search"></i></button><input class="searchbar" type="text" placeholder="Parking lot Search" name="search" value="${search}">
                    </div>
                    <div class="groupfilterby">
                        <button class="btnfilterby" type="button" disabled=><i class="fas fa-filter">Filter By</i></button><select class="selectfilter" name="filter">
                            <option value="parkPlace" <c:if test="${filter == 'parkPlace'}">selected</c:if>>Place</option>
                            <option value="parkName" <c:if test="${filter == 'parkName'}">selected</c:if>>Name</option>
                            </select>
                        </div>
                        <button id="search" type="submit">Search</button>
                    </div>
                </form>

                <!--Table List of Parking lot-->
                <div class="tablesearch">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Parking lot</th>
                                <th>Place</th>
                                <th>Area</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listParkinglot}" var="p">
                            <tr>
                                <td>${p.parkId}</td>
                                <td>${p.parkName}</td>
                                <td>${p.parkPlace}</td>
                                <td>${p.parkArea}</td>
                                <td>${p.parkPrice}</td>
                                <td>${p.parkStatus}</td>
                                <td><a href="${pageContext.request.contextPath}/InfoParkinglotServlet?parkId=${p.parkId}"><i class="fas fa-edit"></i>Edit</a>
                                    <a href="${pageContext.request.contextPath}/DeleteParkinglotServlet?parkId=${p.parkId}" onclick="return confirm_del()"><i class="fas fa-trash-alt"></i>Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
