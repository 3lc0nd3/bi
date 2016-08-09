package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 30, 2012
 * Time: 3:03:26 PM
 */
@Entity
@Table(catalog = "bi", name = "i4")
public class I4 {
    private int id;
    private String capitalExpenditure;
    private int _2011;
    private int _2012;
    private int _2013;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    @Basic
    @Column(name = "capital_expenditure")
    public String getCapitalExpenditure() {
        return capitalExpenditure;
    }

    public void setCapitalExpenditure(String capitalExpenditure) {
        this.capitalExpenditure = capitalExpenditure;
    }


    @Basic
    @Column(name = "a2011")
    public int get_2011() {
        return _2011;
    }

    public void set_2011(int _2011) {
        this._2011 = _2011;
    }


    @Basic
    @Column(name = "a2012")
    public int get_2012() {
        return _2012;
    }

    public void set_2012(int _2012) {
        this._2012 = _2012;
    }


    @Basic
    @Column(name = "a2013")
    public int get_2013() {
        return _2013;
    }

    public void set_2013(int _2013) {
        this._2013 = _2013;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I4 i4 = (I4) o;

        if (_2011 != i4._2011) return false;
        if (_2012 != i4._2012) return false;
        if (_2013 != i4._2013) return false;
        if (id != i4.id) return false;
        if (capitalExpenditure != null ? !capitalExpenditure.equals(i4.capitalExpenditure) : i4.capitalExpenditure != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (capitalExpenditure != null ? capitalExpenditure.hashCode() : 0);
        result = 31 * result + _2011;
        result = 31 * result + _2012;
        result = 31 * result + _2013;
        return result;
    }
}
