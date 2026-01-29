package com.hotel.model;

public class Room {
    private String number;
    private String bedType;
    private int price;
    private boolean isCheckedIn;

    public Room(String number, String bedType, int price, boolean isCheckedIn) {
        this.number = number;
        this.bedType = bedType;
        this.price = price;
        this.isCheckedIn = isCheckedIn;
    }

    public String getNumber() { return number; }
    public String getBedType() { return bedType; }
    public int getPrice() { return price; }
    public boolean isCheckedIn() { return isCheckedIn; }
}
