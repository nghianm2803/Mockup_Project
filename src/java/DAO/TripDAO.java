/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Trip;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Pi Pi
 */
public class TripDAO extends DBContext {

    public boolean addTrip(Trip trip) {
        try {
            String sql = "INSERT INTO trip VALUES(0,?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, trip.getCarType());
            ps.setString(2, trip.getDepartureDate());
            ps.setString(3, trip.getDepartureTime());
            ps.setString(4, trip.getDestination());
            ps.setString(5, trip.getDriver());
            ps.setInt(6, trip.getMaximumOnlineTicketNumber());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Add Trip Fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Trip> getListTrip(String search) {
        ArrayList<Trip> listTrip = new ArrayList<>();
        try {
            String sql = "SELECT * FROM trip";
            if (!search.trim().isEmpty()) {
                sql += " WHERE destination LIKE '%" + search + "%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip(rs.getInt("tripId"),
                        rs.getInt("bookedTicketNumber"),
                        rs.getString("carType"),
                        rs.getString("departureDate"),
                        rs.getString("departureTime").substring(0, 8),
                        rs.getString("destination"),
                        rs.getString("driver"),
                        rs.getInt("maximumOnlineTicketNumber"));
                listTrip.add(trip);
            }
        } catch (Exception e) {
            System.out.println("Get List Trip Fail: " + e.getMessage());
        }
        return listTrip;
    }

    public Trip getTripInfo(int tripId) {
        Trip trip = new Trip();
        try {
            String sql = "SELECT * FROM trip WHERE tripId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, tripId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                trip.setTripId(rs.getInt("tripId"));
                trip.setBookedTicketNumber(rs.getInt("bookedTicketNumber"));
                trip.setCarType(rs.getString("carType"));
                trip.setDepartureDate(rs.getString("departureDate"));
                trip.setDepartureTime(rs.getString("departureTime").substring(0, 8));
                trip.setDestination(rs.getString("destination"));
                trip.setDriver(rs.getString("driver"));
                trip.setMaximumOnlineTicketNumber(rs.getInt("maximumOnlineTicketNumber"));
            }
        } catch (Exception e) {
            System.out.println("Get Trip Info Fail: " + e.getMessage());
        }
        return trip;
    }

    public boolean updateTrip(Trip trip) {
        try {
            String sql = "UPDATE trip SET carType= ? ,departureDate= ? ,departureTime= ? ,destination= ? ,driver= ? ,maximumOnlineTicketNumber= ? "
                    + "WHERE tripId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, trip.getCarType());
            ps.setString(2, trip.getDepartureDate());
            ps.setString(3, trip.getDepartureTime());
            ps.setString(4, trip.getDestination());
            ps.setString(5, trip.getDriver());
            ps.setInt(6, trip.getMaximumOnlineTicketNumber());
            ps.setInt(7, trip.getTripId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Update Trip Fail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteTrip(int tripId) {
        try {
            String sql = "DELETE FROM trip WHERE tripId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, tripId);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Trip Fail: " + e.getMessage());
            return false;
        }
    }

    public String numberOfBookingTrip(int tripId) {
        String number = "";
        try {
            String sql = "select count(b.tripId)\n"
                    + "from dbo.trip t, dbo.bookingoffice b\n"
                    + "where t.tripId = b.tripId\n"
                    + "and t.tripId=?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, tripId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Get NumberofBooking Fail: " + e.getMessage());
        }
        return number;
    }

    public String numberOfTicketTrip(int tripId) {
        String number = "";
        try {
            String sql = "select count(c.tripId) as countTrip\n"
                    + "from trip t, ticket c\n"
                    + "where t.tripId = c.tripId\n"
                    + "and t.tripId = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, tripId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Get NumberofTicketBooked Fail: " + e.getMessage());
        }
        return number;
    }
}
