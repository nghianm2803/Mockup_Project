<%-- 
    Document   : ListEmployeeScreen
    Created on : Aug 12, 2020, 11:03:04 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee Page</title>
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
            <!--Employee Logo and Title-->
            <div class="top">
                <i class="fa fa-users"></i>
                <p>Employee</p>
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
            <h2>Employee List</h2>
            <form action="${pageContext.request.contextPath}\ListEmployeeServlet" method="POST">
                <div class="search-container">
                    <div class="groupsearch">
                        <button class="btnsearch" type="button" disabled><i class="fa fa-search"></i></button><input class="searchbar" type="text" placeholder="User Search" name="search" value="${search}">
                    </div>
                    <div class="groupfilterby">
                        <button class="btnfilterby" type="button" disabled=><i class="fas fa-filter">Filter By</i></button><select class="selectfilter" name="filter">
                            <option value="employeeName" <c:if test="${filter == 'employeeName'}">selected</c:if>>Name</option>
                            <option value="employeeAddress" <c:if test="${filter == 'employeeAddress'}">selected</c:if>>Address</option>
                            <option value="department" <c:if test="${filter == 'department'}">selected</c:if>>Department</option>
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
                            <th>Name</th>
                            <th>Date of birth</th>
                            <th>Address</th>
                            <th>Phone number</th>
                            <th>Department</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${employeeList}" var="e">
                            <tr>
                                <td>${e.id}</td>
                                <td><a href="${pageContext.request.contextPath}/InfoEmployeeServlet?id=${e.id}">${e.name}</a></td>
                                <td>${e.birthdate}</td>
                                <td>${e.address}</td>
                                <td>${e.phone}</td>
                                <td>${e.department}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
