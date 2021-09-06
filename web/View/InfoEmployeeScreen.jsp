<%-- 
    Document   : EmployeeInfoScreen
    Created on : Aug 13, 2020, 1:29:54 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Employee Page</title>
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
            <h2>Employee Information</h2>

            <!--Modify input field-->
            <form id="form" action="${pageContext.request.contextPath}\UpdateEmployeeServlet" method="POST">
                <input hidden="" type="text" value="${employee.id}" name="id">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Full name<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="name" value="${employee.name}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Phone number<div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="phone" value="${employee.phone}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Date of birth<div id="tick_null">(*)</div></th>
                        <td><input type="date"  name="birthdate" value="${employee.birthdate}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Sex<div id="tick_null">(*)</div></th>
                        <th>
                            <input type="radio" name="sex" value="M" <c:if test="${employee.sex == 'M'}">checked</c:if>/>Male
                            <input type="radio" name="sex" value="F" <c:if test="${employee.sex == 'F'}">checked</c:if>/>Female
                        </th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><input type="text"  name="address" value="${employee.address}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="text"  name="email" value="${employee.email}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Account<div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="account" value="${employee.account}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Password<div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="password" value="${employee.password}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Department<div id="tick_null">(*)</div></th>
                        <td>
                            <select name="department">
                                <option value="Employee" <c:if test="${employee.department == 'Employee'}">selected</c:if>>Employee</option>
                                <option value="HRM" <c:if test="${employee.department == 'HRM'}">selected</c:if>>HRM</option>
                                <option value="CPO Administration" <c:if test="${employee.department == 'CPO Administration'}">selected</c:if>>CPO Administration</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="cancel" type="button" onclick="location.href = '${pageContext.request.contextPath}/ListEmployeeServlet'"><i class="fas fa-backward"></i>Cancel</button>
                        <button class="update" type="submit"><i class="fas fa-edit"></i>Update</button>
                        <button class="delete" type="button" onclick="delete_btn('${pageContext.request.contextPath}/DeleteEmployeeServlet?id='+${employee.id})"><i class="fas fa-trash"></i>Delete</button>
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
