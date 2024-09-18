package com.Pharmacy.medicine;
public class Medicine {
    private int medicineId;
    private String name;
    private double price;
    private String category;
    private boolean availability;

    // Constructor, getters, and setters
    public Medicine(int medicineId, String name, double price, String category, boolean availability) {
        this.medicineId = medicineId;
        this.name = name;
        this.price = price;
        this.category = category;
        this.availability = availability;
    }

    // Getters and setters
    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
}