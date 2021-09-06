/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class Ticket {
    private int ticketId;
    private String bookingTime;
    private String customerName;
    private String licensePlate;
    private int tripId;
    private Trip trip;

    public Ticket() {
    }

    public Ticket(int ticketId, String bookingTime, String customerName, String licensePlate, int tripId) {
        this.ticketId = ticketId;
        this.bookingTime = bookingTime;
        this.customerName = customerName;
        this.licensePlate = licensePlate;
        this.tripId = tripId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }
    
    
}
