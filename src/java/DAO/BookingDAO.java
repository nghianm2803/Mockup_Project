/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Bookingoffice;
import Model.Trip;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Pi Pi
 */
public class BookingDAO extends DBContext {

    public boolean addBookingOffice(Bookingoffice bo) {
        try {
            String sql = "INSERT INTO bookingoffice VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, bo.getEndContractDeadline());
            ps.setString(2, bo.getOfficeName());
            ps.setString(3, bo.getOfficePhone());
            ps.setString(4, bo.getOfficePlace());
            ps.setInt(5, bo.getOfficePrice());
            ps.setString(6, bo.getStartContractDeadline());
            ps.setInt(7, bo.getTripId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Add Booking Office Fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Bookingoffice> getListBookingOffice(String search, String filter) {
        ArrayList<Bookingoffice> listBooking = new ArrayList<>();
        try {
            String sql = "SELECT b.officeId,b.officeName,t.destination FROM bookingoffice b INNER JOIN trip t ON b.tripId = t.tripId";
            if (!search.trim().isEmpty()) {
                sql += " WHERE " + filter + " LIKE '%" + search + "%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bookingoffice bo = new Bookingoffice();
                bo.setOfficeId(rs.getInt("officeId"));
                bo.setOfficeName(rs.getString("officeName"));
                Trip trip = new Trip();
                trip.setDestination(rs.getString("destination"));
                bo.setTrip(trip);
                listBooking.add(bo);
            }
        } catch (Exception e) {
            System.out.println("Get List Booking Office Fail: " + e.getMessage());
        }
        return listBooking;
    }

    public Bookingoffice getBookingOfficeInfo(int officeId) {
        Bookingoffice bo = new Bookingoffice();
        try {
            String sql = "SELECT * FROM bookingoffice WHERE officeId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, officeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bo.setOfficeId(rs.getInt("officeId"));
                bo.setEndContractDeadline(rs.getString("endContractDeadline"));
                bo.setOfficeName(rs.getString("officeName"));
                bo.setOfficePhone(rs.getString("officePhone"));
                bo.setOfficePlace(rs.getString("officePlace"));
                bo.setOfficePrice(rs.getInt("officePrice"));
                bo.setStartContractDeadline(rs.getString("startContractDeadline"));
                bo.setTripId(rs.getInt("tripId"));
            }
        } catch (Exception e) {
            System.out.println("Get Booking Office Info Fail: " + e.getMessage());
        }
        return bo;
    }

    public boolean updateBookingOffice(Bookingoffice bo) {
        try {
            String sql = "UPDATE bookingoffice SET endContractDeadline= ? ,officeName= ? ,officePhone= ? ,officePlace= ? ,officePrice= ? ,startContractDeadline= ? ,tripId= ? "
                    + "WHERE officeId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, bo.getEndContractDeadline());
            ps.setString(2, bo.getOfficeName());
            ps.setString(3, bo.getOfficePhone());
            ps.setString(4, bo.getOfficePlace());
            ps.setInt(5, bo.getOfficePrice());
            ps.setString(6, bo.getStartContractDeadline());
            ps.setInt(7, bo.getTripId());
            ps.setInt(8, bo.getOfficeId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Update Booking Office Fail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteBookingOffice(int officeId) {
        try {
            String sql = "DELETE FROM bookingoffice WHERE officeId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, officeId);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Booking Office Fail: " + e.getMessage());
            return false;
        }
    }
}
