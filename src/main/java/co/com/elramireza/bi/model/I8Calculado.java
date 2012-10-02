package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 30, 2012
 * Time: 3:03:28 PM
 */
@Entity
@Table(catalog = "bi", name = "i8_calculado")
public class I8Calculado {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int aYear;

    @Basic
    @Column(name = "a_year")
    public int getAYear() {
        return aYear;
    }

    public void setAYear(int aYear) {
        this.aYear = aYear;
    }

    private double bOperatingMargin;

    @Basic
    @Column(name = "b_operating_margin")
    public double getBOperatingMargin() {
        return bOperatingMargin;
    }

    public void setBOperatingMargin(double bOperatingMargin) {
        this.bOperatingMargin = bOperatingMargin;
    }

    private double cNetOperatingResult;

    @Basic
    @Column(name = "c_net_operating_result")
    public double getCNetOperatingResult() {
        return cNetOperatingResult;
    }

    public void setCNetOperatingResult(double cNetOperatingResult) {
        this.cNetOperatingResult = cNetOperatingResult;
    }

    private double dTotalRevenue;

    @Basic
    @Column(name = "d_total_revenue")
    public double getDTotalRevenue() {
        return dTotalRevenue;
    }

    public void setDTotalRevenue(double dTotalRevenue) {
        this.dTotalRevenue = dTotalRevenue;
    }

    private double eRevenueEarnedPerStaffDollar;

    @Basic
    @Column(name = "e_revenue_earned_per_staff_dollar")
    public double getERevenueEarnedPerStaffDollar() {
        return eRevenueEarnedPerStaffDollar;
    }

    public void setERevenueEarnedPerStaffDollar(double eRevenueEarnedPerStaffDollar) {
        this.eRevenueEarnedPerStaffDollar = eRevenueEarnedPerStaffDollar;
    }

    private double fTotalStaffCosts;

    @Basic
    @Column(name = "f_total_staff_costs")
    public double getFTotalStaffCosts() {
        return fTotalStaffCosts;
    }

    public void setFTotalStaffCosts(double fTotalStaffCosts) {
        this.fTotalStaffCosts = fTotalStaffCosts;
    }

    private double gInternationalRevenueOfAPercOfTotalRevenue;

    @Basic
    @Column(name = "g_international_revenue_of_a_perc_of_total_revenue")
    public double getGInternationalRevenueOfAPercOfTotalRevenue() {
        return gInternationalRevenueOfAPercOfTotalRevenue;
    }

    public void setGInternationalRevenueOfAPercOfTotalRevenue(double gInternationalRevenueOfAPercOfTotalRevenue) {
        this.gInternationalRevenueOfAPercOfTotalRevenue = gInternationalRevenueOfAPercOfTotalRevenue;
    }

    private double hInternationalRevenue;

    @Basic
    @Column(name = "h_international_revenue")
    public double getHInternationalRevenue() {
        return hInternationalRevenue;
    }

    public void setHInternationalRevenue(double hInternationalRevenue) {
        this.hInternationalRevenue = hInternationalRevenue;
    }

    private double iPerOfMarketShareOfInternationalRevenue;

    @Basic
    @Column(name = "i_per_of_market_share_of_international_revenue")
    public double getIPerOfMarketShareOfInternationalRevenue() {
        return iPerOfMarketShareOfInternationalRevenue;
    }

    public void setIPerOfMarketShareOfInternationalRevenue(double iPerOfMarketShareOfInternationalRevenue) {
        this.iPerOfMarketShareOfInternationalRevenue = iPerOfMarketShareOfInternationalRevenue;
    }

    private double jSectorInternationalEvenue;

    @Basic
    @Column(name = "j_sector_international_evenue")
    public double getJSectorInternationalEvenue() {
        return jSectorInternationalEvenue;
    }

    public void setJSectorInternationalEvenue(double jSectorInternationalEvenue) {
        this.jSectorInternationalEvenue = jSectorInternationalEvenue;
    }

    private double kLiquidityRation;

    @Basic
    @Column(name = "k_liquidity_ration")
    public double getKLiquidityRation() {
        return kLiquidityRation;
    }

    public void setKLiquidityRation(double kLiquidityRation) {
        this.kLiquidityRation = kLiquidityRation;
    }

    private double lCurrentAssets;

    @Basic
    @Column(name = "l_current_assets")
    public double getLCurrentAssets() {
        return lCurrentAssets;
    }

    public void setLCurrentAssets(double lCurrentAssets) {
        this.lCurrentAssets = lCurrentAssets;
    }

    private double mCurrentLiabilities;

    @Basic
    @Column(name = "m_current_liabilities")
    public double getMCurrentLiabilities() {
        return mCurrentLiabilities;
    }

    public void setMCurrentLiabilities(double mCurrentLiabilities) {
        this.mCurrentLiabilities = mCurrentLiabilities;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I8Calculado that = (I8Calculado) o;

        if (aYear != that.aYear) return false;
        if (Double.compare(that.bOperatingMargin, bOperatingMargin) != 0) return false;
        if (Double.compare(that.cNetOperatingResult, cNetOperatingResult) != 0) return false;
        if (Double.compare(that.dTotalRevenue, dTotalRevenue) != 0) return false;
        if (Double.compare(that.eRevenueEarnedPerStaffDollar, eRevenueEarnedPerStaffDollar) != 0) return false;
        if (Double.compare(that.fTotalStaffCosts, fTotalStaffCosts) != 0) return false;
        if (Double.compare(that.gInternationalRevenueOfAPercOfTotalRevenue, gInternationalRevenueOfAPercOfTotalRevenue) != 0)
            return false;
        if (Double.compare(that.hInternationalRevenue, hInternationalRevenue) != 0) return false;
        if (Double.compare(that.iPerOfMarketShareOfInternationalRevenue, iPerOfMarketShareOfInternationalRevenue) != 0)
            return false;
        if (id != that.id) return false;
        if (Double.compare(that.jSectorInternationalEvenue, jSectorInternationalEvenue) != 0) return false;
        if (Double.compare(that.kLiquidityRation, kLiquidityRation) != 0) return false;
        if (Double.compare(that.lCurrentAssets, lCurrentAssets) != 0) return false;
        if (Double.compare(that.mCurrentLiabilities, mCurrentLiabilities) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + aYear;
        temp = bOperatingMargin != +0.0d ? Double.doubleToLongBits(bOperatingMargin) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = cNetOperatingResult != +0.0d ? Double.doubleToLongBits(cNetOperatingResult) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = dTotalRevenue != +0.0d ? Double.doubleToLongBits(dTotalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = eRevenueEarnedPerStaffDollar != +0.0d ? Double.doubleToLongBits(eRevenueEarnedPerStaffDollar) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = fTotalStaffCosts != +0.0d ? Double.doubleToLongBits(fTotalStaffCosts) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = gInternationalRevenueOfAPercOfTotalRevenue != +0.0d ? Double.doubleToLongBits(gInternationalRevenueOfAPercOfTotalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = hInternationalRevenue != +0.0d ? Double.doubleToLongBits(hInternationalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = iPerOfMarketShareOfInternationalRevenue != +0.0d ? Double.doubleToLongBits(iPerOfMarketShareOfInternationalRevenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = jSectorInternationalEvenue != +0.0d ? Double.doubleToLongBits(jSectorInternationalEvenue) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = kLiquidityRation != +0.0d ? Double.doubleToLongBits(kLiquidityRation) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = lCurrentAssets != +0.0d ? Double.doubleToLongBits(lCurrentAssets) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = mCurrentLiabilities != +0.0d ? Double.doubleToLongBits(mCurrentLiabilities) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
//        Hasta aca voy
        return result;
    }
}
