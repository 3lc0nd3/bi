package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 29, 2012
 * Time: 2:14:40 AM
 */
@Entity
@Table(catalog = "bi", name = "i7")
public class I7 {
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

    private double totalAcademicStaffCosts;

    @Basic
    @Column(name = "total_academic_staff_costs")
    public double getTotalAcademicStaffCosts() {
        return totalAcademicStaffCosts;
    }

    public void setTotalAcademicStaffCosts(double totalAcademicStaffCosts) {
        this.totalAcademicStaffCosts = totalAcademicStaffCosts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I7 i7 = (I7) o;

        if (id != i7.id) return false;
        if (Double.compare(i7.totalAcademicStaffCosts, totalAcademicStaffCosts) != 0) return false;
        if (Double.compare(i7.totalRevenue, totalRevenue) != 0) return false;
        if (year != i7.year) return false;
        if (institution != null ? !institution.equals(i7.institution) : i7.institution != null) return false;

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
        temp = totalAcademicStaffCosts != +0.0d ? Double.doubleToLongBits(totalAcademicStaffCosts) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
