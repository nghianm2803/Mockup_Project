/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Ticket;
import Model.Trip;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Pi Pi
 */
public class TicketDAO extends DBContext{
    
    public ArrayList<Ticket> getListTicket(String search, String filter) {
        ArrayList<Ticket> listTicket = new ArrayList<>();
        try {
            String sql = "SELECT ticket.ticketId,ticket.bookingTime,ticket.customerName,ticket.licensePlate,ticket.tripId,trip.destination FROM ticket INNER JOIN trip ON ticket.tripId = trip.tripId";
            if (!search.trim().isEmpty()) {
                sql += " WHERE " + filter + " LIKE '%" + search + "%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ticket ticket = new Ticket(rs.getInt("ticketId"), 
                        rs.getString("bookingTime"), 
                        rs.getString("customerName"), 
                        rs.getString("licensePlate"), 
                        rs.getInt("tripId"));
                Trip trip = new Trip();
                trip.setDestination(rs.getString("destination"));
                ticket.setTrip(trip);
                listTicket.add(ticket);
            }
        } catch (Exception e) {
            System.out.println("Get List Ticket Fail: " + e.getMessage());
        }
        return listTicket;
    }
    
    public boolean deleteTicket(int ticketId) {
        try {
            String sql = "DELETE FROM ticket WHERE ticketId= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, ticketId);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Ticket Fail: " + e.getMessage());
            return false;
        }
    }
}
