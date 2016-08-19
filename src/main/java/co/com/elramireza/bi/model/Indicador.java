package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by usuariox on 19/08/16.
 */
@Entity
@Table(name = "indicador")
public class Indicador {
    private int id;
    private int idIndicador;
    private String version;
    private int fecha;
    private double variable1;
    private double variable2;
    private double indicador;
    private double aceptacion;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "id_indicador")
    public int getIdIndicador() {
        return idIndicador;
    }

    public void setIdIndicador(int idIndicador) {
        this.idIndicador = idIndicador;
    }

    @Basic
    @Column(name = "version")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Basic
    @Column(name = "fecha")
    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "variable_1")
    public double getVariable1() {
        return variable1;
    }

    public void setVariable1(double variable1) {
        this.variable1 = variable1;
    }

    @Basic
    @Column(name = "variable_2")
    public double getVariable2() {
        return variable2;
    }

    public void setVariable2(double variable2) {
        this.variable2 = variable2;
    }

    @Basic
    @Column(name = "indicador")
    public double getIndicador() {
        return indicador;
    }

    public void setIndicador(double indicador) {
        this.indicador = indicador;
    }

    @Basic
    @Column(name = "aceptacion")
    public double getAceptacion() {
        return aceptacion;
    }

    public void setAceptacion(double aceptacion) {
        this.aceptacion = aceptacion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Indicador that = (Indicador) o;

        if (id != that.id) return false;
        if (idIndicador != that.idIndicador) return false;
        if (fecha != that.fecha) return false;
        if (Double.compare(that.variable1, variable1) != 0) return false;
        if (Double.compare(that.variable2, variable2) != 0) return false;
        if (Double.compare(that.indicador, indicador) != 0) return false;
        if (Double.compare(that.aceptacion, aceptacion) != 0) return false;
        if (version != null ? !version.equals(that.version) : that.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + idIndicador;
        result = 31 * result + (version != null ? version.hashCode() : 0);
        result = 31 * result + fecha;
        temp = Double.doubleToLongBits(variable1);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(variable2);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(indicador);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(aceptacion);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
