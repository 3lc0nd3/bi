package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 29, 2012
 * Time: 12:00:16 AM
 */
@Entity
@Table(catalog = "bi", name = "i6")
public class I6 {
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

    private String institution;

    @Basic
    @Column(name = "institution")
    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
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

    private double totalStaffCost;

    @Basic
    @Column(name = "total_staff_cost")
    public double getTotalStaffCost() {
        return totalStaffCost;
    }

    public void setTotalStaffCost(double totalStaffCost) {
        this.totalStaffCost = totalStaffCost;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I6 i6 = (I6) o;

        if (id != i6.id) return false;
        if (Double.compare(i6.totalRevenue, totalRevenue) != 0) return false;
        if (Double.compare(i6.totalStaffCost, totalStaffCost) != 0) return false;
        if (year != i6.year) return false;
        if (institution != null ? !institution.equals(i6.institution) : i6.institution != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + year;
        result = 31 * result + (institution != null ? institution.hashCode() : 0);
        temp = totalRevenue != +0.0d ? Double.doubleToLongBits(totalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = totalStaffCost != +0.0d ? Double.doubleToLongBits(totalStaffCost) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
