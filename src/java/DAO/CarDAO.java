/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Car;
import Model.Parkinglot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Pi Pi
 */
public class CarDAO extends DBContext {

    public boolean addCar(Car car) {
        try {
            String sql = "INSERT INTO car VALUES(?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, car.getLicensePlate());
            ps.setString(2, car.getCarColor());
            ps.setString(3, car.getCarType());
            ps.setString(4, car.getCompany());
            ps.setInt(5, car.getParkId());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Add Car Fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Car> getListCar(String search, String filter) {
        ArrayList<Car> listCar = new ArrayList<>();
        try {
            String sql = "SELECT c.licensePlate,c.carColor,c.carType,c.company,c.parkId,p.parkName FROM car c INNER JOIN parkinglot p ON c.parkId = p.parkId";
            if (!search.trim().isEmpty()) {
                sql += " WHERE " + filter + " LIKE '%" + search + "%'";
            }
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car car = new Car();
                car.setLicensePlate(rs.getString("licensePlate"));
                car.setCarColor(rs.getString("carColor"));
                car.setCarType(rs.getString("carType"));
                car.setCompany(rs.getString("company"));
                car.setParkId(rs.getInt("parkId"));
                Parkinglot p = new Parkinglot();
                p.setParkName(rs.getString("parkName"));
                car.setParkinglot(p);
                listCar.add(car);
            }
        } catch (Exception e) {
            System.out.println("Get List Car Fail: " + e.getMessage());
        }
        return listCar;
    }

    public Car getCarInfo(String licensePlate) {
        Car car = new Car();
        try {
            String sql = "SELECT * FROM car WHERE licensePlate = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, licensePlate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car.setLicensePlate(rs.getString("licensePlate"));
                car.setCarColor(rs.getString("carColor"));
                car.setCarType(rs.getString("carType"));
                car.setCompany(rs.getString("company"));
                car.setParkId(rs.getInt("parkId"));
            }
        } catch (Exception e) {
            System.out.println("Get Car Info Fail: " + e.getMessage());
        }
        return car;
    }

    public boolean updateCar(Car car) {
        try {
            String sql = "UPDATE car SET carColor= ? ,carType= ? ,company= ? ,parkId= ? "
                    + "WHERE licensePlate= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, car.getCarColor());
            ps.setString(2, car.getCarType());
            ps.setString(3, car.getCompany());
            ps.setInt(4, car.getParkId());
            ps.setString(5, car.getLicensePlate());
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Update Car Fail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteCar(String licensePlate) {
        try {
            String sql = "DELETE FROM car WHERE licensePlate= ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, licensePlate);
            int flag = ps.executeUpdate();
            if (flag >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Delete Car Fail: " + e.getMessage());
            return false;
        }
    }

    public String numberOfTicketBooked(String licensePlate) {
        String number = "";
        try {
            String sql = "select count(t.licensePlate)\n"
                    + "from dbo.car c, dbo.ticket t\n"
                    + "where c.licensePlate = t.licensePlate\n"
                    + "and c.licensePlate = ?;";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, licensePlate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Get numberOfTicket Fail: " + e.getMessage());
        }
        return number;
    }
}
