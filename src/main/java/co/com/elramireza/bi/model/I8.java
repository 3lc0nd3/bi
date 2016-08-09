package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 30, 2012
 * Time: 4:30:48 PM
 */
@Entity
@Table(catalog = "bi", name = "i8")
public class I8 {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int year;

    @Basic
    @Column(name = "year")
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    private double netOperatingResult;

    @Basic
    @Column(name = "net_operating_result")
    public double getNetOperatingResult() {
        return netOperatingResult;
    }

    public void setNetOperatingResult(double netOperatingResult) {
        this.netOperatingResult = netOperatingResult;
    }

    private double totalRevenue;

    @Basic
    @Column(name = "total_revenue")
    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    private double totalStaffCosts;

    @Basic
    @Column(name = "total_staff_costs")
    public double getTotalStaffCosts() {
        return totalStaffCosts;
    }

    public void setTotalStaffCosts(double totalStaffCosts) {
        this.totalStaffCosts = totalStaffCosts;
    }

    private double internationalRevenue;

    @Basic
    @Column(name = "international_revenue")
    public double getInternationalRevenue() {
        return internationalRevenue;
    }

    public void setInternationalRevenue(double internationalRevenue) {
        this.internationalRevenue = internationalRevenue;
    }

    private double sectorInternationalEvenue;

    @Basic
    @Column(name = "sector_international_evenue")
    public double getSectorInternationalEvenue() {
        return sectorInternationalEvenue;
    }

    public void setSectorInternationalEvenue(double sectorInternationalEvenue) {
        this.sectorInternationalEvenue = sectorInternationalEvenue;
    }

    private double currentAssets;

    @Basic
    @Column(name = "current_assets")
    public double getCurrentAssets() {
        return currentAssets;
    }

    public void setCurrentAssets(double currentAssets) {
        this.currentAssets = currentAssets;
    }

    private double currentLiabilities;

    @Basic
    @Column(name = "current_liabilities")
    public double getCurrentLiabilities() {
        return currentLiabilities;
    }

    public void setCurrentLiabilities(double currentLiabilities) {
        this.currentLiabilities = currentLiabilities;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I8 i8 = (I8) o;

        if (Double.compare(i8.currentAssets, currentAssets) != 0) return false;
        if (Double.compare(i8.currentLiabilities, currentLiabilities) != 0) return false;
        if (id != i8.id) return false;
        if (Double.compare(i8.internationalRevenue, internationalRevenue) != 0) return false;
        if (Double.compare(i8.netOperatingResult, netOperatingResult) != 0) return false;
        if (Double.compare(i8.sectorInternationalEvenue, sectorInternationalEvenue) != 0) return false;
        if (Double.compare(i8.totalRevenue, totalRevenue) != 0) return false;
        if (Double.compare(i8.totalStaffCosts, totalStaffCosts) != 0) return false;
        if (year != i8.year) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + year;
        temp = netOperatingResult != +0.0d ? Double.doubleToLongBits(netOperatingResult) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = totalRevenue != +0.0d ? Double.doubleToLongBits(totalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = totalStaffCosts != +0.0d ? Double.doubleToLongBits(totalStaffCosts) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = internationalRevenue != +0.0d ? Double.doubleToLongBits(internationalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = sectorInternationalEvenue != +0.0d ? Double.doubleToLongBits(sectorInternationalEvenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = currentAssets != +0.0d ? Double.doubleToLongBits(currentAssets) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = currentLiabilities != +0.0d ? Double.doubleToLongBits(currentLiabilities) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
