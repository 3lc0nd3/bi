package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 29, 2012
 * Time: 3:00:31 AM
 */
@Entity
@Table(catalog = "bi", name = "i3_calculado")
public class I3Calculado {
    private int id;
    private int year;
    private double totalRevenue;
    private double totalExpenses;
    private double netOperatingResult;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    @Basic
    @Column(name = "year")
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }


    @Basic
    @Column(name = "total_revenue")
    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }


    @Basic
    @Column(name = "total_expenses")
    public double getTotalExpenses() {
        return totalExpenses;
    }

    public void setTotalExpenses(double totalExpenses) {
        this.totalExpenses = totalExpenses;
    }


    @Basic
    @Column(name = "net_operating_result")
    public double getNetOperatingResult() {
        return netOperatingResult;
    }

    public void setNetOperatingResult(double netOperatingResult) {
        this.netOperatingResult = netOperatingResult;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I3Calculado that = (I3Calculado) o;

        if (id != that.id) return false;
        if (Double.compare(that.netOperatingResult, netOperatingResult) != 0) return false;
        if (Double.compare(that.totalExpenses, totalExpenses) != 0) return false;
        if (Double.compare(that.totalRevenue, totalRevenue) != 0) return false;
        if (year != that.year) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + year;
        temp = totalRevenue != +0.0d ? Double.doubleToLongBits(totalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = totalExpenses != +0.0d ? Double.doubleToLongBits(totalExpenses) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = netOperatingResult != +0.0d ? Double.doubleToLongBits(netOperatingResult) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
