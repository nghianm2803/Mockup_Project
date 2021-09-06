/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Parkinglot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Pi Pi
 */
public class ParkinglotDAO extends DBContext {

    public boolean addParkinglot(Parkinglot parkinglot) {
        try {
            String sql = "INSERT INTO parkinglot VALUES(?,?,?,?,'Blank')";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, parkinglot.getParkArea());
            ps.setString(2, parkinglot.getParkName());
            ps.setString(3, parkinglot.getParkPlace());
            ps.setInt(4, parkinglot.getParkPrice());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Add Parkinglot Fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Parkinglot> getParkinglotList(String search, String filter) {
        ArrayList<Parkinglot> listParkinglot = new ArrayList<>();
        try {
            String sql = "SELECT * FROM parkinglot";
            if (!search.trim().isEmpty()) {
                sql += " WHERE " + filter + " LIKE '%" + search + "%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Parkinglot parkinglot = new Parkinglot(rs.getInt("parkId"),
                        rs.getInt("parkArea"),
                        rs.getString("parkName"),
                        rs.getString("parkPlace"),
                        rs.getInt("parkPrice"),
                        rs.getString("parkStatus"));
                listParkinglot.add(parkinglot);
            }
        } catch (Exception e) {
            System.out.println("Get List Parkinglot Fail: " + e.getMessage());
        }
        return listParkinglot;
    }

    public Parkinglot getParkinglotInfo(int parkId) {
        Parkinglot parkinglot = new Parkinglot();
        try {
            String sql = "SELECT * FROM parkinglot WHERE parkId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, parkId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                parkinglot.setParkId(rs.getInt("parkId"));
                parkinglot.setParkArea(rs.getInt("parkArea"));
                parkinglot.setParkName(rs.getString("parkName"));
                parkinglot.setParkPlace(rs.getString("parkPlace"));
                parkinglot.setParkPrice(rs.getInt("parkPrice"));
                parkinglot.setParkStatus(rs.getString("parkStatus"));
            }
        } catch (Exception e) {
            System.out.println("Get Parkinglot Info Fail: " + e.getMessage());
        }
        return parkinglot;
    }

    public boolean updateParkinglot(Parkinglot parkinglot) {
        try {
            String sql = "UPDATE parkinglot SET parkArea= ? ,parkName= ? ,parkPlace= ? ,parkPrice= ? "
                    + "WHERE parkId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, parkinglot.getParkArea());
            ps.setString(2, parkinglot.getParkName());
            ps.setString(3, parkinglot.getParkPlace());
            ps.setInt(4, parkinglot.getParkPrice());
            ps.setInt(5, parkinglot.getParkId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Update Parkinglot Fail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteParkinglot(int parkId) {
        try {
            String sql = "DELETE FROM parkinglot WHERE parkId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, parkId);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Parkinglot Fail: " + e.getMessage());
            return false;
        }
    }

    public String numberOfParkingCar(int parkId) {
        String number = "";
        try {
            String sql = "select count(c.parkId)\n"
                    + "from dbo.parkinglot p, dbo.car c\n"
                    + "where p.parkId = c.parkId\n"
                    + "and p.parkId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, parkId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Get NumberofCar Fail: " + e.getMessage());
        }
        return number;
    }
}
