package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 26, 2012
 * Time: 3:39:15 PM
 */
@Entity
@Table(catalog = "bi", name = "i1")
public class I1 {
    private int id;
    private String item;
    private String style;
    private String _2008;
    private String _2009;
    private String _2010;
    private String _2011;
    private String _2012;
    private String _2013;
    private String _2014;
    private String _2015;
    private String _2016;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    @Basic
    @Column(name = "item")
    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }


    @Basic
    @Column(name = "style")
    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }


    @Basic
    @Column(name = "a2008")
    public String get_2008() {
        return _2008;
    }

    public void set_2008(String _2008) {
        this._2008 = _2008;
    }


    @Basic
    @Column(name = "a2009")
    public String get_2009() {
        return _2009;
    }

    public void set_2009(String _2009) {
        this._2009 = _2009;
    }


    @Basic
    @Column(name = "a2010")
    public String get_2010() {
        return _2010;
    }

    public void set_2010(String _2010) {
        this._2010 = _2010;
    }


    @Basic
    @Column(name = "a2011")
    public String get_2011() {
        return _2011;
    }

    public void set_2011(String _2011) {
        this._2011 = _2011;
    }


    @Basic
    @Column(name = "a2012")
    public String get_2012() {
        return _2012;
    }

    public void set_2012(String _2012) {
        this._2012 = _2012;
    }


    @Basic
    @Column(name = "a2013")
    public String get_2013() {
        return _2013;
    }

    public void set_2013(String _2013) {
        this._2013 = _2013;
    }


    @Basic
    @Column(name = "a2014")
    public String get_2014() {
        return _2014;
    }

    public void set_2014(String _2014) {
        this._2014 = _2014;
    }


    @Basic
    @Column(name = "a2015")
    public String get_2015() {
        return _2015;
    }

    public void set_2015(String _2015) {
        this._2015 = _2015;
    }


    @Basic
    @Column(name = "a2016")
    public String get_2016() {
        return _2016;
    }

    public void set_2016(String _2016) {
        this._2016 = _2016;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I1 i1 = (I1) o;

        if (id != i1.id) return false;
        if (_2008 != null ? !_2008.equals(i1._2008) : i1._2008 != null) return false;
        if (_2009 != null ? !_2009.equals(i1._2009) : i1._2009 != null) return false;
        if (_2010 != null ? !_2010.equals(i1._2010) : i1._2010 != null) return false;
        if (_2011 != null ? !_2011.equals(i1._2011) : i1._2011 != null) return false;
        if (_2012 != null ? !_2012.equals(i1._2012) : i1._2012 != null) return false;
        if (_2013 != null ? !_2013.equals(i1._2013) : i1._2013 != null) return false;
        if (_2014 != null ? !_2014.equals(i1._2014) : i1._2014 != null) return false;
        if (_2015 != null ? !_2015.equals(i1._2015) : i1._2015 != null) return false;
        if (_2016 != null ? !_2016.equals(i1._2016) : i1._2016 != null) return false;
        if (item != null ? !item.equals(i1.item) : i1.item != null) return false;
        if (style != null ? !style.equals(i1.style) : i1.style != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (item != null ? item.hashCode() : 0);
        result = 31 * result + (style != null ? style.hashCode() : 0);
        result = 31 * result + (_2008 != null ? _2008.hashCode() : 0);
        result = 31 * result + (_2009 != null ? _2009.hashCode() : 0);
        result = 31 * result + (_2010 != null ? _2010.hashCode() : 0);
        result = 31 * result + (_2011 != null ? _2011.hashCode() : 0);
        result = 31 * result + (_2012 != null ? _2012.hashCode() : 0);
        result = 31 * result + (_2013 != null ? _2013.hashCode() : 0);
        result = 31 * result + (_2014 != null ? _2014.hashCode() : 0);
        result = 31 * result + (_2015 != null ? _2015.hashCode() : 0);
        result = 31 * result + (_2016 != null ? _2016.hashCode() : 0);
        return result;
    }
}
