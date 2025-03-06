package com.megacity.models;

public class User {
    private String name;
    private String nic;
    private String address;
    private String phone;
    private String username;
    private String password;
    private String role;
    private String vehicleType;
    private String vehicleNumber;

    public User(String name, String nic, String address, String phone, String username, String password, String role, String vehicleType, String vehicleNumber) {
        this.name = name;
        this.nic = nic;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.role = role;
        this.vehicleType = vehicleType;
        this.vehicleNumber = vehicleNumber;
    }

    public User() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }
}
