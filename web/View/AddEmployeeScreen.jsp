<%-- 
    Document   : AddEmployeeScreen
    Created on : Aug 12, 2020, 11:02:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/PublicStyle.css"/>
        
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
            <h2>Add Employee</h2>

            <!--Input field-->
            <form id="form" action="${pageContext.request.contextPath}\AddEmployeeServlet" method="POST">
                <table name="table" class="tableadd">
                    <tr>
                        <th>Full name<div id="tick_null">(*)</div></th>
                        <td><input type="text" name="name" placeholder="Enter full name"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Phone number<div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="phone" placeholder="Enter phone number"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Date of birth<div id="tick_null">(*)</div></th>
                        <td><input type="date"  name="birthdate"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Sex<div id="tick_null">(*)</div></th>
                        <th>
                            <input type="radio" name="sex" value="M" checked/>Male
                            <input type="radio" name="sex" value="F" />Female
                        </th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><input type="text"  name="address" placeholder="Enter address"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="text"  name="email" placeholder="Enter email"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Account<div id="tick_null">(*)</div></th>
                        <td><input type="text"  name="account" placeholder="Enter account"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Password<div id="tick_null">(*)</div></th>
                        <td><input type="password"  name="password" placeholder="Enter password"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Department<div id="tick_null">(*)</div></th>
                        <td>
                            <select name="department">
                                <option value="Employee">Employee</option>
                                <option value="HRM">HRM</option>
                                <option value="CPO Administration">CPO Administration</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <button class="back" type="button" ><i class="fas fa-backward"></i>Back</button>
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
