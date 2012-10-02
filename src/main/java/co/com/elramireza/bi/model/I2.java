package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 26, 2012
 * Time: 11:17:22 PM
 */
@Entity
@Table(catalog = "bi", name = "i2")
public class I2 {
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

    private String typeEstudent;

    @Basic
    @Column(name = "type_estudent")
    public String getTypeEstudent() {
        return typeEstudent;
    }

    public void setTypeEstudent(String typeEstudent) {
        this.typeEstudent = typeEstudent;
    }

    private String faculty;

    @Basic
    @Column(name = "faculty")
    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    private double target;

    @Basic
    @Column(name = "target")
    public double getTarget() {
        return target;
    }

    public void setTarget(double target) {
        this.target = target;
    }

    private double projection;

    @Basic
    @Column(name = "projection")
    public double getProjection() {
        return projection;
    }

    public void setProjection(double projection) {
        this.projection = projection;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        I2 i2 = (I2) o;

        if (Double.compare(i2.projection, projection) != 0) return false;
        if (Double.compare(i2.target, target) != 0) return false;
        if (year != i2.year) return false;
        if (faculty != null ? !faculty.equals(i2.faculty) : i2.faculty != null) return false;
        if (typeEstudent != null ? !typeEstudent.equals(i2.typeEstudent) : i2.typeEstudent != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = year;
        result = 31 * result + (typeEstudent != null ? typeEstudent.hashCode() : 0);
        result = 31 * result + (faculty != null ? faculty.hashCode() : 0);
        temp = target != +0.0d ? Double.doubleToLongBits(target) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = projection != +0.0d ? Double.doubleToLongBits(projection) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
