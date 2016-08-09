package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 27, 2012
 * Time: 1:48:21 AM
 */
@Entity
@Table(catalog = "bi", name = "o4_calculado")
public class O4Calculado {
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

    private double netOperatingResult;

    @Basic
    @Column(name = "net_operating_result")
    public double getNetOperatingResult() {
        return netOperatingResult;
    }

    public void setNetOperatingResult(double netOperatingResult) {
        this.netOperatingResult = netOperatingResult;
    }

    private double operatingMarging;

    @Basic
    @Column(name = "operating_marging")
    public double getOperatingMarging() {
        return operatingMarging;
    }

    public void setOperatingMarging(double operatingMarging) {
        this.operatingMarging = operatingMarging;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        O4Calculado that = (O4Calculado) o;

        if (id != that.id) return false;
        if (Double.compare(that.netOperatingResult, netOperatingResult) != 0) return false;
        if (Double.compare(that.operatingMarging, operatingMarging) != 0) return false;
        if (Double.compare(that.totalRevenue, totalRevenue) != 0) return false;
        if (year != that.year) return false;
        if (institution != null ? !institution.equals(that.institution) : that.institution != null) return false;

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
        temp = netOperatingResult != +0.0d ? Double.doubleToLongBits(netOperatingResult) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = operatingMarging != +0.0d ? Double.doubleToLongBits(operatingMarging) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
