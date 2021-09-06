/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class EmployeeDAO extends DBContext {

    public boolean addEmployee(Employee employee) {
        try {
            String sql = "INSERT INTO employee VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, employee.getAccount());
            ps.setString(2, employee.getDepartment());
            ps.setString(3, employee.getAddress());
            ps.setString(4, employee.getBirthdate());
            ps.setString(5, employee.getEmail());
            ps.setString(6, employee.getName());
            ps.setString(7, employee.getPhone());
            ps.setString(8, employee.getPassword());
            ps.setString(9, employee.getSex());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Add Employee Fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Employee> getListEmployee(String search, String filter) {
        ArrayList<Employee> listEmployee = new ArrayList<>();
        try {
            String sql = "SELECT * FROM employee";
            if (!search.trim().isEmpty()) {
                sql += " WHERE "+filter+" LIKE '%"+search+"%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt("employeeId"),
                        rs.getString("account"),
                        rs.getString("department"),
                        rs.getString("employeeAddress"),
                        rs.getString("employeeBirthdate"),
                        rs.getString("employeeEmail"),
                        rs.getString("employeeName"),
                        rs.getString("employeePhone"),
                        rs.getString("password"),
                        rs.getString("sex"));
                listEmployee.add(employee);
            }
        } catch (Exception e) {
            System.out.println("Get List Employee Fail: " + e.getMessage());
        }
        return listEmployee;
    }

    public Employee getEmployeeInfo(int employeeId) {
        Employee employee = new Employee();
        try {
            String sql = "SELECT * FROM employee WHERE employeeId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, employeeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                employee.setId(rs.getInt("employeeId"));
                employee.setAccount(rs.getString("account"));
                employee.setDepartment(rs.getString("department"));
                employee.setAddress(rs.getString("employeeAddress"));
                employee.setBirthdate(rs.getString("employeeBirthdate"));
                employee.setEmail(rs.getString("employeeEmail"));
                employee.setName(rs.getString("employeeName"));
                employee.setPhone(rs.getString("employeePhone"));
                employee.setPassword(rs.getString("password"));
                employee.setSex(rs.getString("sex"));
            }
        } catch (Exception e) {
            System.out.println("Get Employee Info Fail: " + e.getMessage());
        }
        return employee;
    }

    public boolean updateEmployee(Employee employee) {
        try {
            String sql = "UPDATE employee SET account= ? ,department= ? ,employeeAddress= ? ,employeeBirthdate= ? ,employeeEmail= ? ,employeeName= ? ,employeePhone= ? ,password= ? ,sex= ? "
                    + "WHERE employeeId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, employee.getAccount());
            ps.setString(2, employee.getDepartment());
            ps.setString(3, employee.getAddress());
            ps.setString(4, employee.getBirthdate());
            ps.setString(5, employee.getEmail());
            ps.setString(6, employee.getName());
            ps.setString(7, employee.getPhone());
            ps.setString(8, employee.getPassword());
            ps.setString(9, employee.getSex());
            ps.setInt(10, employee.getId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Update Employee Fail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteEmployee(int employeeId) {
        try {
            String sql = "DELETE FROM employee WHERE employeeId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, employeeId);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Employee Fail: " + e.getMessage());
            return false;
        }
    }
}
